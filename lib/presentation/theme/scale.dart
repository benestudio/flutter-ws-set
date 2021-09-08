import 'dart:ui';
import 'package:flutter/widgets.dart';

class Scale {
  static Size _designSize = Size.zero;
  static Size _screenSize = Size.zero;

  static double get _horizontallyScaleFactor {
    return _screenSize.width / _designSize.width;
  }

  static void setup({required Size screenSize, required Size designSize}) {
    assert(screenSize.shortestSide != 0, 'Scale.setup has to be called with a non 0 screenSize');
    assert(designSize.shortestSide != 0, 'Scale.setup has to be called with a non 0 designSize');

    _screenSize = screenSize;
    _designSize = designSize;
  }

  static double hs(double value) {
    assert(
      _designSize.shortestSide != 0 && _screenSize.shortestSide != 0,
      'ensure Scale.setup() was called with a non 0 designSize and non 0 screenSize',
    );

    return value * _horizontallyScaleFactor;
  }
}

extension ScreenExtension on num {
  double get hs {
    return Scale.hs(toDouble());
  }
}
