import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ActiveScrollController extends ChangeNotifier {
  static final List<ScrollController> _stack = [];
  static final ActiveScrollController instance = ActiveScrollController._();

  // Global notifier for scroll metrics changes (e.g., async content loading)
  static final ValueNotifier<int> _metricsNotifier = ValueNotifier(0);
  static ValueListenable<int> get metricsNotifier => _metricsNotifier;

  ActiveScrollController._();

  static ScrollController? get controller =>
      _stack.isNotEmpty ? _stack.last : null;

  static void activate(ScrollController controller) {
    if (!_stack.contains(controller)) {
      _stack.add(controller);
      instance.notifyListeners();
    }
  }

  static void deactivate(ScrollController controller) {
    if (_stack.remove(controller)) {
      instance.notifyListeners();
    }
  }

  // Call this whenever scroll metrics change
  static void notifyMetricsChanged() {
    _metricsNotifier.value++;
  }
}
