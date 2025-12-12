import 'package:democracy/post/models/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class ImageViewer extends StatefulWidget {
  const ImageViewer({super.key, required this.post});

  final Post post;

  @override
  State<ImageViewer> createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer> {
  late PageController pageController;
  int _activePage = 0;
  bool verticalGallery = false;

  @override
  Widget build(BuildContext context) {
    pageController = PageController(initialPage: _activePage);
    List<String> images = [];
    if (widget.post.image1Url != null) {
      images.add(widget.post.image1Url!);
    }
    if (widget.post.image2Url != null) {
      images.add(widget.post.image2Url!);
    }
    if (widget.post.image3Url != null) {
      images.add(widget.post.image3Url!);
    }
    if (widget.post.image4Url != null) {
      images.add(widget.post.image4Url!);
    }
    if (widget.post.image5Url != null) {
      images.add(widget.post.image5Url!);
    }
    if (widget.post.image6Url != null) {
      images.add(widget.post.image6Url!);
    }
    List<Widget> pages = List.generate(
      images.length,
      (index) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(images[index]),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
    List<GalleryItem> galleryItems = List.generate(
      images.length,
      (index) => GalleryItem(id: index.toString(), resource: images[index]),
    );
    return GestureDetector(
      key: ValueKey(widget.post),
      onTap: () {
        // open(context, 2);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => GalleryPhotoViewWrapper(
              galleryItems: galleryItems,
              backgroundDecoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
              ),
              initialIndex: _activePage,
              scrollDirection: verticalGallery
                  ? Axis.vertical
                  : Axis.horizontal,
            ),
          ),
        );
      },
      child: Stack(
        children: [
          PageView.builder(
            controller: pageController,
            itemCount: images.length,
            onPageChanged: (value) {
              setState(() {
                _activePage = value;
              });
            },
            itemBuilder: (context, index) {
              return pages[index];
            },
          ),
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Visibility(
              visible: images.length > 1,
              child: Container(
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    images.length,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                      child: InkWell(
                        onTap: () {
                          pageController.animateToPage(
                            index,
                            duration: const Duration(milliseconds: 600),
                            curve: Curves.ease,
                          );
                        },
                        child: CircleAvatar(
                          radius: _activePage == index ? 4 : 2,
                          backgroundColor: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: InkWell(
              onTap: () {
                pageController.animateToPage(
                  _activePage + 1,
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.ease,
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: (_activePage == images.indexOf(images.last))
                          ? Theme.of(context).colorScheme.outline
                          : Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child: InkWell(
              onTap: () {
                pageController.animateToPage(
                  _activePage - 1,
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.ease,
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: (_activePage == images.indexOf(images.first))
                          ? Theme.of(context).colorScheme.outline
                          : Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
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
        : PhotoViewGalleryPageOptions(
            imageProvider: NetworkImage(item.resource),
            initialScale: PhotoViewComputedScale.contained,
            minScale: PhotoViewComputedScale.contained * (0.5 + index / 10),
            maxScale: PhotoViewComputedScale.covered * 4.1,
            heroAttributes: PhotoViewHeroAttributes(tag: item.id),
          );
  }
}

class GalleryItem {
  GalleryItem({required this.id, required this.resource, this.isSvg = false});

  final String id;
  final String resource;
  final bool isSvg;
}

class GalleryExampleItemThumbnail extends StatelessWidget {
  const GalleryExampleItemThumbnail({
    super.key,
    required this.galleryExampleItem,
    required this.onTap,
  });

  final GalleryItem galleryExampleItem;

  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: GestureDetector(
        onTap: onTap,
        child: Hero(
          tag: galleryExampleItem.id,
          child: Image.network(galleryExampleItem.resource, height: 80.0),
        ),
      ),
    );
  }
}
