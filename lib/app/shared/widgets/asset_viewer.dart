import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:democracy/app/models/asset.dart';
import 'package:democracy/app/shared/constants/variables.dart';
import 'package:democracy/app/shared/widgets/bottom_loader.dart';
import 'package:democracy/app/shared/widgets/file_widget.dart';
import 'package:democracy/app/shared/widgets/video_viewer.dart';
import 'package:democracy/chat/bloc/message_create/message_create_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:photo_view/photo_view.dart';
import 'package:responsive_framework/responsive_framework.dart';

class AssetViewer extends StatefulWidget {
  const AssetViewer({super.key, required this.assets});

  final List<Asset> assets;

  @override
  State<AssetViewer> createState() => _AssetViewerState();
}

class _AssetViewerState extends State<AssetViewer> {
  late List<Asset> media = widget.assets
      .where((asset) => asset.contentType != ContentType.document)
      .toList();

  late List<Asset> documents = widget.assets
      .where((asset) => asset.contentType == ContentType.document)
      .toList();

  @override
  Widget build(BuildContext context) {
    bool isMobile = ResponsiveBreakpoints.of(context).isMobile;

    return BlocListener<MessageCreateBloc, MessageCreateState>(
      listener: (context, state) {
        if (state.status == MessageCreateStatus.success) {
          if (state.message!.assets.isNotEmpty) {
            for (final asset in state.message!.assets) {
              if (media.any((a) => a.id == asset.id && !a.isCompleted)) {
                setState(() {
                  int index = media.indexWhere((a) => a.id == asset.id);
                  media[index] = asset;
                });
              }
              if (documents.any((a) => a.id == asset.id && !a.isCompleted)) {
                setState(() {
                  int index = documents.indexWhere((a) => a.id == asset.id);
                  documents[index] = asset;
                });
              }
            }
          }
        }
      },
      child: Column(
        children: [
          media.length == 1
              ? _buildMediaWidget(media.first, isMobile)
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
                        child: _buildMediaWidget(asset, isMobile),
                      );
                    }),
                  ],
                ),
          if (documents.isNotEmpty)
            ...documents.map(
              (document) => Container(
                margin: EdgeInsets.only(top: 10),
                child: FileWidget(fileName: document.name, url: document.url),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildMediaWidget(Asset asset, bool isMobile) {
    return asset.contentType == ContentType.image
        ? _ImageWidget(
            asset: asset,
            onTap: () => _openCarousel(asset: asset, media: media),
          )
        : _VideoWidget(
            asset: asset,
            onTap: () => _openCarousel(asset: asset, media: media),
            showControls: media.length == 1 || !isMobile,
          );
  }

  void _openCarousel({required Asset asset, required List<Asset> media}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            _MediaCarousel(media: media, selectedAsset: asset),
      ),
    );
  }
}

class _VideoWidget extends StatelessWidget {
  const _VideoWidget({
    required this.asset,
    required this.onTap,
    required this.showControls,
  });

  final Asset asset;
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
              VideoViewer(
                url: asset.url,
                cacheKey: asset.fileKey,
                showControls: showControls,
              ),
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
  const _ImageWidget({required this.asset, required this.onTap});

  final Asset asset;
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
          child: !asset.isCompleted
              ? BottomLoader()
              : CachedNetworkImage(
                  fit: BoxFit.cover,
                  width: 1000.0,
                  imageUrl: asset.url,
                  cacheKey: asset.fileKey,
                  placeholder: (context, url) => BottomLoader(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
        ),
      ),
    );
  }
}

class _MediaCarousel extends StatelessWidget {
  const _MediaCarousel({required this.media, required this.selectedAsset});

  final List<Asset> media;
  final Asset selectedAsset;

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
                    initialPage: media.indexOf(selectedAsset),
                    enableInfiniteScroll: false,
                    enlargeCenterPage: true,
                  ),
                  items: media.map((asset) {
                    return asset.contentType == ContentType.image
                        ? PhotoView(
                            imageProvider: CachedNetworkImageProvider(
                              asset.url,
                              cacheKey: asset.fileKey,
                            ),
                          )
                        : VideoViewer(
                            url: asset.url,
                            cacheKey: asset.fileKey,
                            autoPlay: selectedAsset.id == asset.id,
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
