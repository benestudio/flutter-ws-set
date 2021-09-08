import 'package:flutter/widgets.dart';

class NonGlowingScrollBehavior extends ScrollBehavior {
  const NonGlowingScrollBehavior();
  
  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
