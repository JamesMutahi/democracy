import 'package:flutter/material.dart';
import 'package:democracy/app/shared/widgets/active_scroll_controller.dart';

class CustomEdgeScrollbar extends StatefulWidget {
  final double width;
  final double thumbMinHeight;
  final Color thumbColor;
  final Color trackColor;
  final double borderRadius;

  const CustomEdgeScrollbar({
    super.key,
    this.width = 12,
    this.thumbMinHeight = 40,
    this.thumbColor = Colors.black54,
    this.trackColor = Colors.black12,
    this.borderRadius = 6,
  });

  @override
  State<CustomEdgeScrollbar> createState() => _CustomEdgeScrollbarState();
}

class _CustomEdgeScrollbarState extends State<CustomEdgeScrollbar> {
  double _thumbPosition = 0.0;
  double _thumbHeight = 100.0;
  bool _isDragging = false;
  double _dragStartY = 0.0;
  double _dragStartThumbPosition = 0.0;

  // Separate the two heights
  double _trackHeight = 0.0; // Actual rendered height of the scrollbar
  double _scrollViewport = 0.0; // Scrollable viewport height
  bool _metricsUpdateScheduled = false;

  @override
  void initState() {
    super.initState();
    ActiveScrollController.instance.addListener(_onControllerChanged);
    ActiveScrollController.metricsNotifier.addListener(_onMetricsChanged);
    _attachToActiveController();
  }

  @override
  void dispose() {
    ActiveScrollController.instance.removeListener(_onControllerChanged);
    ActiveScrollController.metricsNotifier.removeListener(_onMetricsChanged);
    _detachFromActiveController();
    super.dispose();
  }

  void _onControllerChanged() {
    _detachFromActiveController();
    _attachToActiveController();
  }

  void _onMetricsChanged() {
    _scheduleMetricsUpdate();
  }

  void _attachToActiveController() {
    ActiveScrollController.controller?.addListener(_onScroll);
    _scheduleMetricsUpdate();
  }

  void _detachFromActiveController() {
    ActiveScrollController.controller?.removeListener(_onScroll);
  }

  void _onScroll() {
    if (!_isDragging) {
      _scheduleMetricsUpdate();
    }
  }

  void _scheduleMetricsUpdate() {
    if (_metricsUpdateScheduled) return;
    _metricsUpdateScheduled = true;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _metricsUpdateScheduled = false;
      if (!mounted) return;
      _updateThumbMetrics();
    });
  }

  void _updateThumbMetrics() {
    final controller = ActiveScrollController.controller;
    if (controller == null || !controller.hasClients) return;

    // Use the actual rendered track height, fallback to viewport
    final trackHeight = _trackHeight > 0
        ? _trackHeight
        : controller.position.viewportDimension;

    final position = controller.position;
    final scrollViewport = position.viewportDimension;
    final minScrollExtent = position.minScrollExtent;
    final maxScrollExtent = position.maxScrollExtent;
    final currentOffset = position.pixels;

    final totalScrollableRange = maxScrollExtent - minScrollExtent;

    double newThumbHeight;
    double newThumbPosition;

    if (totalScrollableRange <= 0) {
      newThumbHeight = trackHeight;
      newThumbPosition = 0;
    } else {
      // Thumb SIZE: proportional to (scrollViewport / totalContent), scaled to TRACK height
      final totalContentHeight = scrollViewport + totalScrollableRange;
      final calculatedThumbHeight =
          (scrollViewport / totalContentHeight) * trackHeight;
      newThumbHeight = calculatedThumbHeight.clamp(
        widget.thumbMinHeight,
        trackHeight,
      );

      // Thumb POSITION: mapped within the TRACK height
      final scrollPercentage =
          (currentOffset - minScrollExtent) / totalScrollableRange;
      final availableTrackHeight = trackHeight - newThumbHeight;
      newThumbPosition = scrollPercentage * availableTrackHeight;
    }

    if (_thumbHeight != newThumbHeight ||
        _thumbPosition != newThumbPosition ||
        _scrollViewport != scrollViewport) {
      setState(() {
        _thumbHeight = newThumbHeight;
        _thumbPosition = newThumbPosition;
        _scrollViewport = scrollViewport;
      });
    }
  }

  void _onDragStart(DragStartDetails details) {
    _attachToActiveController();
    setState(() {
      _isDragging = true;
      _dragStartY = details.globalPosition.dy;
      _dragStartThumbPosition = _thumbPosition;
    });
  }

  void _onDragUpdate(DragUpdateDetails details) {
    final controller = ActiveScrollController.controller;
    if (controller == null || !controller.hasClients) return;

    final position = controller.position;
    final minScrollExtent = position.minScrollExtent;
    final maxScrollExtent = position.maxScrollExtent;
    final totalScrollableRange = maxScrollExtent - minScrollExtent;

    // Use track height for drag calculations
    final trackHeight = _trackHeight > 0
        ? _trackHeight
        : position.viewportDimension;
    final availableTrackHeight = trackHeight - _thumbHeight;
    if (availableTrackHeight <= 0 || totalScrollableRange <= 0) return;

    final deltaY = details.globalPosition.dy - _dragStartY;
    final newThumbPosition = (_dragStartThumbPosition + deltaY).clamp(
      0.0,
      availableTrackHeight,
    );

    final scrollPercentage = newThumbPosition / availableTrackHeight;
    final newScrollOffset =
        minScrollExtent + (scrollPercentage * totalScrollableRange);

    setState(() {
      _thumbPosition = newThumbPosition;
    });

    controller.jumpTo(newScrollOffset);
  }

  void _onDragEnd(DragEndDetails details) {
    if (!mounted) return;
    setState(() {
      _isDragging = false;
    });
  }

  void _onTrackTap(TapUpDetails details, BoxConstraints constraints) {
    final controller = ActiveScrollController.controller;
    if (controller == null || !controller.hasClients) return;

    final position = controller.position;
    final minScrollExtent = position.minScrollExtent;
    final maxScrollExtent = position.maxScrollExtent;
    final totalScrollableRange = maxScrollExtent - minScrollExtent;

    // Use the actual tap area height (from LayoutBuilder)
    final availableTrackHeight = constraints.maxHeight - _thumbHeight;
    if (availableTrackHeight <= 0 || totalScrollableRange <= 0) return;

    final tapY = details.localPosition.dy;
    final newThumbPosition = (tapY - _thumbHeight / 2).clamp(
      0.0,
      availableTrackHeight,
    );
    final scrollPercentage = newThumbPosition / availableTrackHeight;
    final newScrollOffset =
        minScrollExtent + (scrollPercentage * totalScrollableRange);

    controller.animateTo(
      newScrollOffset,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollMetricsNotification>(
      onNotification: (notification) {
        _scheduleMetricsUpdate();
        return false;
      },
      child: LayoutBuilder(
        builder: (context, constraints) {
          // Store the actual rendered track height
          if (_trackHeight != constraints.maxHeight &&
              constraints.maxHeight > 0) {
            _trackHeight = constraints.maxHeight;
            _scheduleMetricsUpdate();
          }

          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onVerticalDragStart: _onDragStart,
            onVerticalDragUpdate: _onDragUpdate,
            onVerticalDragEnd: _onDragEnd,
            onTapUp: (details) => _onTrackTap(details, constraints),
            child: Container(
              width: widget.width,
              color: widget.trackColor,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: _thumbPosition,
                    left: 2,
                    right: 2,
                    height: _thumbHeight,
                    child: Container(
                      decoration: BoxDecoration(
                        color: widget.thumbColor,
                        borderRadius: BorderRadius.circular(
                          widget.borderRadius,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
