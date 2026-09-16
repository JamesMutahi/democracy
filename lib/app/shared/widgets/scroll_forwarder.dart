import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ScreenScrollForwarder extends StatefulWidget {
  final Widget child;
  final ScrollController? Function() getActiveController;

  const ScreenScrollForwarder({
    super.key,
    required this.child,
    required this.getActiveController,
  });

  @override
  State<ScreenScrollForwarder> createState() => _ScreenScrollForwarderState();
}

class _ScreenScrollForwarderState extends State<ScreenScrollForwarder> {
  double _lastY = 0;
  int? _activePointer;

  @override
  Widget build(BuildContext context) {
    return Listener(
      behavior: HitTestBehavior.translucent,
      onPointerDown: (event) {
        if (_activePointer != null) return;

        if (event.kind == PointerDeviceKind.mouse) return;

        final controller = widget.getActiveController();
        if (controller != null && controller.hasClients) {
          _activePointer = event.pointer;
          _lastY = event.position.dy;
        }
      },
      onPointerMove: (event) {
        if (event.kind == PointerDeviceKind.mouse) return;

        if (event.pointer == _activePointer) {
          final controller = widget.getActiveController();
          if (controller != null && controller.hasClients) {
            final position = controller.position;
            final delta = _lastY - event.position.dy;

            final newOffset = (position.pixels + delta).clamp(
              position.minScrollExtent,
              position.maxScrollExtent,
            );

            controller.jumpTo(newOffset);
            _lastY = event.position.dy;
          }
        }
      },
      onPointerUp: (event) {
        if (event.pointer == _activePointer) _activePointer = null;
      },
      onPointerCancel: (event) {
        if (event.pointer == _activePointer) _activePointer = null;
      },
      onPointerSignal: (event) {
        // Handles mouse wheel / trackpad scrolling from outside the widget
        if (event is PointerScrollEvent) {
          final controller = widget.getActiveController();
          if (controller != null && controller.hasClients) {
            final position = controller.position;

            final newOffset = (position.pixels + event.scrollDelta.dy).clamp(
              position.minScrollExtent,
              position.maxScrollExtent,
            );

            controller.animateTo(
              newOffset,
              duration: const Duration(milliseconds: 150),
              curve: Curves.easeOutCubic,
            );
          }
        }
      },
      child: widget.child,
    );
  }
}
