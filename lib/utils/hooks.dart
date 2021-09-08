import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:simple_animations/simple_animations.dart';

TweenAnimationHook<TweenType> useTweenAnimation<T, TweenType extends Animatable<TimelineValue>>({
  required TweenType tween,
  required T dependentValue,
  required CustomAnimationControl Function() onDependentValueChanged,
  Duration duration = const Duration(milliseconds: 200),
  Curve curve = Curves.linear,
  Duration delay = Duration.zero,
  double startPosition = 0,
  int? fps,
  Key? key,
}) {
  final control = useState(onDependentValueChanged());
  useValueChanged<T, void>(dependentValue, (_, __) => control.value = onDependentValueChanged());

  return TweenAnimationHook(
    control: control.value,
    tween: tween,
    duration: duration,
    curve: curve,
    delay: delay,
    startPosition: startPosition,
    fps: fps,
    key: key,
  );
}

class TweenAnimationHook<TweenType> {
  TweenAnimationHook({
    required this.control,
    required this.tween,
    required this.duration,
    required this.curve,
    required this.delay,
    required this.startPosition,
    required this.fps,
    this.key,
  });

  final CustomAnimationControl control;
  final TweenType tween;
  final Duration duration;
  final Curve curve;
  final Duration delay;
  final double startPosition;
  final int? fps;
  final Key? key;
}

class HookAnimation<PropType> extends StatelessWidget {
  const HookAnimation({
    Key? key,
    required this.child,
    required this.hook,
    required this.builder,
  }) : super(key: key);

  final Widget child;
  final TweenAnimationHook<Animatable<TimelineValue<PropType>>> hook;
  final AnimatedWidgetBuilder<TimelineValue<PropType>> builder;

  @override
  Widget build(BuildContext context) {
    return CustomAnimation<TimelineValue<PropType>>(
      duration: hook.duration,
      tween: hook.tween,
      control: hook.control,
      curve: hook.curve,
      delay: hook.delay,
      startPosition: hook.startPosition,
      fps: hook.fps,
      key: hook.key,
      builder: (context, child, value) => builder(context, child, value),
      child: child,
    );
  }
}
