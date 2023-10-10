import 'package:flutter/material.dart';

final class ResponsiveSize {
  ResponsiveSize._();
  static final Size size = WidgetsBinding.instance.platformDispatcher.views.first.physicalSize /
      WidgetsBinding.instance.platformDispatcher.views.first.devicePixelRatio;
}

extension Responsive on num {
  double get h => (this / 100) * ResponsiveSize.size.height;
  double get w => (this / 100) * ResponsiveSize.size.width;
  // double get h=>  ()
}
