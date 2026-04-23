import 'package:cached_network_image/cached_network_image.dart';
import 'package:democracy/app/models/asset.dart';
import 'package:democracy/app/shared/widgets/file_widget.dart';
import 'package:democracy/app/shared/widgets/video_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class AssetViewer extends StatefulWidget {
  const AssetViewer({super.key, required this.assets});

  final List<Asset> assets;

  @override
  State<AssetViewer> createState() => _AssetViewerState();
}

class _AssetViewerState extends State<AssetViewer> {
  late List<Asset> mediaAssets = widget.assets
      .where((asset) => asset.contentType != ContentType.document)
      .toList();

  late List<Asset> documentAssets = widget.assets
      .where((asset) => asset.contentType == ContentType.document)
      .toList();

  @override
  Widget build(BuildContext context) {
    List<GalleryItem> galleryItems = List.generate(
      mediaAssets.length,
      (index) =>
          GalleryItem(id: index.toString(), resource: mediaAssets[index].url),
    );

    return Column(
      children: [
        mediaAssets.length == 1
            ? mediaAssets.first.contentType == ContentType.image
                  ? _ImageWidget(
                      asset: mediaAssets.first,
                      urls: [mediaAssets.first.url],
                      galleryItems: galleryItems,
                    )
                  : VideoViewer(urls: [mediaAssets.first.url])
            : StaggeredGrid.count(
                crossAxisCount: 4,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
                children: [
                  ...mediaAssets.map(
                    (asset) => StaggeredGridTile.count(
                      crossAxisCellCount: 2,
                      mainAxisCellCount:
                          mediaAssets.length == 3 &&
                              mediaAssets.indexOf(asset) == 0
                          ? 4
                          : 2,
                      child: _ImageWidget(
                        asset: asset,
                        urls: [...mediaAssets.map((asset) => asset.url)],
                        galleryItems: galleryItems,
                      ),
                    ),
                  ),
                ],
              ),
        if (documentAssets.isNotEmpty)
          Container(
            margin: EdgeInsets.only(top: 10),
            child: FileWidget(
              fileName: documentAssets.first.name,
              url: documentAssets.first.url,
            ),
          ),
      ],
    );
  }
}

class _ImageWidget extends StatelessWidget {
  const _ImageWidget({
    required this.asset,
    required this.urls,
    required this.galleryItems,
  });

  final Asset asset;
  final List<String> urls;
  final List<GalleryItem> galleryItems;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => GalleryPhotoViewWrapper(
              galleryItems: galleryItems,
              backgroundDecoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
              ),
              initialIndex: urls.indexOf(asset.url),
              scrollDirection: Axis.horizontal,
            ),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height / 4,
          ),
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            width: 1000.0,
            imageUrl: asset.url,
            // Use the constant file_key as cacheKey, NOT the temporary url
            cacheKey: asset.fileKey,
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}

class GalleryPhotoViewWrapper extends StatefulWidget {
  GalleryPhotoViewWrapper({
    super.key,
    this.loadingBuilder,
    this.backgroundDecoration,
    this.minScale,
    this.maxScale,
    this.initialIndex = 0,
    required this.galleryItems,
    this.scrollDirection = Axis.horizontal,
  }) : pageController = PageController(initialPage: initialIndex);

  final LoadingBuilder? loadingBuilder;
  final BoxDecoration? backgroundDecoration;
  final dynamic minScale;
  final dynamic maxScale;
  final int initialIndex;
  final PageController pageController;
  final List<GalleryItem> galleryItems;
  final Axis scrollDirection;

  @override
  State<StatefulWidget> createState() {
    return _GalleryPhotoViewWrapperState();
  }
}

class _GalleryPhotoViewWrapperState extends State<GalleryPhotoViewWrapper> {
  late int currentIndex = widget.initialIndex;

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).canvasColor,
      child: SafeArea(
        child: Scaffold(
          body: Container(
            decoration: widget.backgroundDecoration,
            constraints: BoxConstraints.expand(
              height: MediaQuery.of(context).size.height,
            ),
            child: Stack(
              alignment: Alignment.bottomRight,
              children: <Widget>[
                PhotoViewGallery.builder(
                  scrollPhysics: const BouncingScrollPhysics(),
                  builder: _buildItem,
                  itemCount: widget.galleryItems.length,
                  loadingBuilder: widget.loadingBuilder,
                  backgroundDecoration: widget.backgroundDecoration,
                  pageController: widget.pageController,
                  onPageChanged: onPageChanged,
                  scrollDirection: widget.scrollDirection,
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  bottom: 0,
                  child: Center(
                    child: IconButton(
                      onPressed: () {
                        widget.pageController.animateToPage(
                          currentIndex + 1,
                          duration: const Duration(milliseconds: 600),
                          curve: Curves.ease,
                        );
                      },
                      icon: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color:
                            (currentIndex ==
                                widget.galleryItems.indexOf(
                                  widget.galleryItems.last,
                                ))
                            ? Theme.of(context).colorScheme.outline
                            : Colors.white,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 0,
                  bottom: 0,
                  child: Center(
                    child: IconButton(
                      onPressed: () {
                        widget.pageController.animateToPage(
                          currentIndex - 1,
                          duration: const Duration(milliseconds: 600),
                          curve: Curves.ease,
                        );
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color:
                            (currentIndex ==
                                widget.galleryItems.indexOf(
                                  widget.galleryItems.first,
                                ))
                            ? Theme.of(context).colorScheme.outline
                            : Colors.white,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: IconButton.outlined(
                    style: ButtonStyle(
                      shape: WidgetStateProperty.all(const CircleBorder()),
                      side: WidgetStateProperty.all(
                        BorderSide(
                          width: 3,
                          color: Theme.of(context).colorScheme.outlineVariant,
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close_rounded),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  PhotoViewGalleryPageOptions _buildItem(BuildContext context, int index) {
    final GalleryItem item = widget.galleryItems[index];
    return item.isSvg
        ? PhotoViewGalleryPageOptions.customChild(
            child: SizedBox(
              width: 300,
              height: 300,
              child: SvgPicture.asset(item.resource, height: 200.0),
            ),
            childSize: const Size(300, 300),
            initialScale: PhotoViewComputedScale.contained,
            minScale: PhotoViewComputedScale.contained * (0.5 + index / 10),
            maxScale: PhotoViewComputedScale.covered * 4.1,
            heroAttributes: PhotoViewHeroAttributes(tag: item.id),
          )
        : item.isVideo
        ? PhotoViewGalleryPageOptions.customChild(
            child: VideoViewer(urls: [item.resource]),
            childSize: const Size(300, 300),
            initialScale: PhotoViewComputedScale.contained,
            minScale: PhotoViewComputedScale.contained * (0.5 + index / 10),
            maxScale: PhotoViewComputedScale.covered * 4.1,
            heroAttributes: PhotoViewHeroAttributes(tag: item.id),
          )
        : PhotoViewGalleryPageOptions(
            imageProvider: CachedNetworkImageProvider(item.resource),
            initialScale: PhotoViewComputedScale.contained,
            minScale: PhotoViewComputedScale.contained * (0.5 + index / 10),
            maxScale: PhotoViewComputedScale.covered * 4.1,
            heroAttributes: PhotoViewHeroAttributes(tag: item.id),
          );
  }
}

class GalleryItem {
  GalleryItem({
    required this.id,
    required this.resource,
    this.isSvg = false,
    this.isVideo = false,
  });

  final String id;
  final String resource;
  final bool isSvg;
  final bool isVideo;
}
