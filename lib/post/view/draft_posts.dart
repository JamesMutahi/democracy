import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:democracy/app/shared/constants/variables.dart';
import 'package:democracy/app/shared/widgets/bottom_loader.dart';
import 'package:democracy/app/shared/widgets/custom_text.dart';
import 'package:democracy/app/shared/widgets/failure_retry_button.dart';
import 'package:democracy/app/shared/widgets/file_widget.dart';
import 'package:democracy/app/shared/widgets/map_widget.dart';
import 'package:democracy/app/shared/widgets/video_viewer.dart';
import 'package:democracy/ballot/view/widgets/ballot_tile.dart';
import 'package:democracy/constitution/view/section_tile.dart';
import 'package:democracy/meet/view/widgets/meeting_tile.dart';
import 'package:democracy/petition/view/widgets/petition_tile.dart';
import 'package:democracy/post/bloc/draft_post/draft_post_bloc.dart';
import 'package:democracy/post/bloc/draft_posts/draft_posts_bloc.dart';
import 'package:democracy/post/models/draft_post.dart';
import 'package:democracy/post/view/shared/post_navigator.dart';
import 'package:democracy/post/view/widgets/post_tile.dart';
import 'package:democracy/survey/view/widgets/survey_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mime/mime.dart';
import 'package:path/path.dart' as p;
import 'package:photo_view/photo_view.dart';
import 'package:responsive_framework/responsive_framework.dart';

class DraftPosts extends StatefulWidget {
  const DraftPosts({super.key});

  @override
  State<DraftPosts> createState() => _DraftsPostsState();
}

class _DraftsPostsState extends State<DraftPosts> {
  @override
  void initState() {
    context.read<DraftPostsBloc>().add(DraftPostsEvent.get());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DraftPostBloc, DraftPostState>(
      listener: (context, state) {
        final draftPostsBloc = context.read<DraftPostsBloc>();
        if (state is DraftPostSaved) {
          draftPostsBloc.add(DraftPostsEvent.update(draft: state.draft));
        }
        if (state is DraftPostDeleted) {
          draftPostsBloc.add(DraftPostsEvent.remove(id: state.draft.id));
        }
        if (state is DraftPostSaved) {
          draftPostsBloc.add(DraftPostsEvent.update(draft: state.draft));
        }
      },
      child: Scaffold(
        appBar: AppBar(title: Text('Drafts'), elevation: 0.5),
        body: BlocBuilder<DraftPostsBloc, DraftPostsState>(
          builder: (context, state) {
            final drafts = state.drafts.toList();

            if (state.status == DraftPostsStatus.initial ||
                state.status == DraftPostsStatus.loading && drafts.isEmpty) {
              return const BottomLoader();
            }

            if (state.status == DraftPostsStatus.failure && drafts.isEmpty) {
              return FailureRetryButton(
                onPressed: () =>
                    context.read<DraftPostsBloc>().add(DraftPostsEvent.get()),
              );
            }

            return ListView.builder(
              padding: EdgeInsets.only(bottom: 50),
              itemBuilder: (BuildContext context, int index) {
                DraftPost draft = drafts[index];
                return DraftTile(key: ValueKey(draft.id), draft: draft);
              },
              itemCount: drafts.length,
            );
          },
        ),
      ),
    );
  }
}

class DraftTile extends StatelessWidget {
  const DraftTile({super.key, required this.draft});

  final DraftPost draft;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigateToPostUpdate(context: context, draft: draft);
      },
      child: Container(
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Theme.of(context).disabledColor.withAlpha(30),
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DraftPostBody(draft: draft),
            if (draft.filePaths.isNotEmpty)
              Container(
                margin: EdgeInsets.only(top: 10),
                child: DraftAssetViewer(
                  key: ValueKey(draft.id),
                  filePaths: draft.filePaths,
                ),
              ),
            if (draft.location != null)
              Container(
                margin: EdgeInsets.only(top: 10),
                child: MapWidget(mapCenter: draft.location!),
              ),
            if (draft.repostOf != null) PostDependency(post: draft.repostOf!),
            if (draft.ballot != null)
              DependencyContainer(
                child: BallotTile(ballot: draft.ballot!, isDependency: true),
              ),
            if (draft.survey != null)
              DependencyContainer(
                child: SurveyTile(survey: draft.survey!, isDependency: true),
              ),
            if (draft.petition != null)
              DependencyContainer(
                child: PetitionTile(
                  petition: draft.petition!,
                  isDependency: true,
                ),
              ),
            if (draft.meeting != null)
              DependencyContainer(
                child: MeetingTile(meeting: draft.meeting!, isDependency: true),
              ),
            if (draft.section != null)
              DependencyContainer(
                child: SectionTile(section: draft.section!, isDependency: true),
              ),
          ],
        ),
      ),
    );
  }
}

class DraftPostBody extends StatefulWidget {
  const DraftPostBody({
    super.key,
    required this.draft,
    this.showWholeText = false,
    this.isDependency = false,
  });

  final DraftPost draft;
  final bool showWholeText;
  final bool isDependency;

  @override
  State<DraftPostBody> createState() => _DraftPostBodyState();
}

class _DraftPostBodyState extends State<DraftPostBody> {
  String suffix = '...Show more';
  bool readMore = false;

  @override
  Widget build(BuildContext context) {
    return CustomText(
      text: widget.draft.body,
      style: Theme.of(context).textTheme.bodyMedium!,
      suffix: widget.showWholeText ? '' : suffix,
      showAllText: widget.showWholeText ? true : readMore,
      onSuffixPressed: () {
        setState(() {
          if (readMore) {
            suffix = '...Show more';
            readMore = false;
          } else {
            suffix = '\nShow less';
            readMore = true;
          }
        });
      },
    );
  }
}

class DraftAssetViewer extends StatelessWidget {
  const DraftAssetViewer({super.key, required this.filePaths});

  final List<String> filePaths;

  @override
  Widget build(BuildContext context) {
    bool isMobile = ResponsiveBreakpoints.of(context).isMobile;
    List<File> media = [];
    List<File> documents = [];
    for (var path in filePaths) {
      final contentType = lookupMimeType(path);
      bool isImage = contentType!.toLowerCase().contains('image');
      bool isVideo = contentType.toLowerCase().contains('video');
      if (isImage || isVideo) {
        media.add(File(path));
      } else {
        documents.add(File(path));
      }
    }
    return Column(
      children: [
        media.length == 1
            ? _buildMediaWidget(context, media, media.first, isMobile)
            : StaggeredGrid.count(
                crossAxisCount: 4,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
                children: [
                  ...media.map((asset) {
                    int crossAxisCellCount = 2;
                    int mainAxisCellCount = 2;

                    if (media.length == 3 && media.indexOf(asset) == 0) {
                      mainAxisCellCount = 4;
                    }

                    return StaggeredGridTile.count(
                      crossAxisCellCount: crossAxisCellCount,
                      mainAxisCellCount: mainAxisCellCount,
                      child: _buildMediaWidget(context, media, asset, isMobile),
                    );
                  }),
                ],
              ),
        if (documents.isNotEmpty)
          ...documents.map(
            (document) => Container(
              margin: EdgeInsets.only(top: 10),
              child: FileWidget(
                fileName: p.basename(document.path),
                url: document.path,
                navigateToViewer: false,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildMediaWidget(
    BuildContext context,
    List<File> media,
    File file,
    bool isMobile,
  ) {
    final contentType = lookupMimeType(file.path);
    return contentType!.toLowerCase().contains('image')
        ? _ImageWidget(
            file: file,
            onTap: () => _openCarousel(context, file: file, media: media),
          )
        : _VideoWidget(
            video: file,
            onTap: () => _openCarousel(context, file: file, media: media),
            showControls: media.length == 1 || !isMobile,
          );
  }

  void _openCarousel(
    BuildContext context, {
    required File file,
    required List<File> media,
  }) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => _MediaCarousel(media: media, selectedFile: file),
      ),
    );
  }
}

class _VideoWidget extends StatelessWidget {
  const _VideoWidget({
    required this.video,
    required this.onTap,
    required this.showControls,
  });

  final File video;
  final VoidCallback onTap;
  final bool showControls;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height / 3,
          ),
          child: Stack(
            children: [
              VideoViewer(url: video.path, showControls: showControls),
              if (!showControls)
                Center(
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    child: Icon(Icons.play_arrow_rounded),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ImageWidget extends StatelessWidget {
  const _ImageWidget({required this.file, required this.onTap});

  final File file;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height / 3,
          ),
          child: Image.file(file, fit: BoxFit.cover, width: 1000.0),
        ),
      ),
    );
  }
}

class _MediaCarousel extends StatelessWidget {
  const _MediaCarousel({required this.media, required this.selectedFile});

  final List<File> media;
  final File selectedFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: PhotoViewGestureDetectorScope(
                axis: Axis.horizontal,
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 700.0,
                    initialPage: media.indexOf(selectedFile),
                    enableInfiniteScroll: false,
                    enlargeCenterPage: true,
                  ),
                  items: media.map((asset) {
                    final contentType = lookupMimeType(asset.path);
                    return contentType!.toLowerCase().contains('image')
                        ? PhotoView(imageProvider: FileImage(asset))
                        : VideoViewer(
                            url: asset.path,
                            autoPlay: selectedFile == asset,
                          );
                  }).toList(),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                margin: const EdgeInsets.all(15.0),
                child: IconButton.filledTonal(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.close_rounded),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
