import 'package:f_set/presentation/theme/app_theme.dart';
import 'package:f_set/presentation/theme/scale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AnimatedSimpleDialog extends HookWidget {
  const AnimatedSimpleDialog({
    Key? key,
    required this.child,
    this.duration = const Duration(seconds: 1),
    this.curve = Curves.easeOutCubic,
  }) : super(key: key);

  final Widget child;
  final Duration duration;
  final Curve curve;

  @override
  Widget build(BuildContext context) {
    final animationController = useAnimationController(duration: duration, initialValue: 0.7)..forward();
    final scaleAnimation = CurvedAnimation(parent: animationController, curve: curve);

    return ScaleTransition(
      scale: scaleAnimation,
      child: SimpleDialog(
        backgroundColor: AppTheme.of(context).appBackground,
        titlePadding: EdgeInsets.zero,
        contentPadding: EdgeInsets.all(24.hs),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.hs)),
        children: [child],
      ),
    );
  }
}
