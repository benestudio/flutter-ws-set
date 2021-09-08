import 'package:f_set/presentation/theme/app_theme.dart';
import 'package:f_set/presentation/theme/scale.dart';
import 'package:f_set/set.dart';
import 'package:f_set/utils/hooks.dart';
import 'package:f_set/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

enum AniProps { elevation, borderWidth }

class SetCardWidget extends HookWidget {
  final SetCard card;

  const SetCardWidget({
    Key? key,
    required this.card,
    this.highlight = false,
    this.duration = const Duration(milliseconds: 200),
  }) : super(key: key);

  final bool highlight;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    final tweenHook = useTweenAnimation(
      tween: TimelineTween<AniProps>()
        ..addScene(begin: 0.milliseconds, duration: 1000.milliseconds)
            .animate(AniProps.elevation, tween: 1.0.tweenTo(8.0))
            .animate(AniProps.borderWidth, tween: 0.5.tweenTo(1)),
      duration: 200.milliseconds,
      dependentValue: highlight,
      onDependentValueChanged: () => highlight ? CustomAnimationControl.play : CustomAnimationControl.playReverse,
    );

    return AspectRatio(
      aspectRatio: 2.25 / 3.5,
      child: HookAnimation<AniProps>(
        hook: tweenHook,
        builder: (context, child, TimelineValue<AniProps> value) {
          return Container(
            margin: EdgeInsets.all(4.hs),
            child: Material(
              animationDuration: Duration.zero,
              type: MaterialType.card,
              elevation: value.get(AniProps.elevation),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.hs),
                side: BorderSide(width: value.get(AniProps.borderWidth), color: AppTheme.of(context).cardBorderColor),
              ),
              child: child,
            ),
          );
        },
        child: Padding(
          padding: EdgeInsets.all(16.hs),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
                card.count,
                (index) => ShapeView(
                      texture: card.texture,
                      shape: card.shape,
                      colorType: card.color,
                    )).toList(),
          ),
        ),
      ),
    );
  }
}

class ShapeView extends StatelessWidget {
  final TextureType texture;
  final ShapeType shape;
  final ColorType colorType;

  const ShapeView({
    Key? key,
    required this.texture,
    required this.shape,
    required this.colorType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.5,
      child: CustomPaint(
        painter: ShapePainter(texture, shape, colorType),
      ),
    );
  }
}

class ShapePainter extends CustomPainter {
  final TextureType texture;
  final ShapeType shape;
  final ColorType colorType;

  ShapePainter(this.texture, this.shape, this.colorType);

  Color get color => AppTheme.cardColorMap[colorType]!;

  @override
  void paint(Canvas canvas, Size size) {
    final shape = getPath(size);

    final interiorPaint = getInteriorPaint(size);
    final borderPaint = getBorderPaint(size);
    canvas.drawPath(shape, interiorPaint);
    canvas.drawPath(shape, borderPaint);
  }

  Path getPath(Size size) {
    switch (shape) {
      case ShapeType.diamond:
        return Path()
          ..moveTo(0, size.height / 2)
          ..lineTo(size.width / 2, 0)
          ..lineTo(size.width, size.height / 2)
          ..lineTo(size.width / 2, size.height)
          ..close();

      case ShapeType.pill:
        final r = size.height / 2;
        return Path()
          ..moveTo(r, 0)
          ..lineTo(size.width - r, 0)
          ..arcToPoint(Offset(size.width - r, size.height), radius: Radius.circular(r))
          ..lineTo(r, size.height)
          ..arcToPoint(Offset(r, 0), radius: Radius.circular(r));

      case ShapeType.squiggly:
        final Offset p0 = Offset(0, size.height * .6);
        final Offset p1 = Offset(size.width * .55, size.height * .15);
        final Offset p2 = Offset(size.width, size.height * .4);
        final Offset p3 = Offset(size.width * .45, size.height * .85);

        final Offset slant = Offset.fromDirection(.6);

        final Offset cp0 = p0 - Offset(0, size.height * .6);
        final Offset cp1 = p1 - slant * size.height * .8;
        final Offset cp2 = p1 + slant * size.height * .5;
        final Offset cp3 = p2 - Offset(0, size.height * 1.1);
        final Offset cp4 = p2 + Offset(0, size.height * .6);
        final Offset cp5 = p3 + slant * size.height * .8;
        final Offset cp6 = p3 - slant * size.height * .5;
        final Offset cp7 = p0 + Offset(0, size.height * 1.1);

        return Path()
          ..moveTo(p0.dx, p0.dy)
          ..cubicTo(cp0.dx, cp0.dy, cp1.dx, cp1.dy, p1.dx, p1.dy)
          ..cubicTo(cp2.dx, cp2.dy, cp3.dx, cp3.dy, p2.dx, p2.dy)
          ..cubicTo(cp4.dx, cp4.dy, cp5.dx, cp5.dy, p3.dx, p3.dy)
          ..cubicTo(cp6.dx, cp6.dy, cp7.dx, cp7.dy, p0.dx, p0.dy);

      default:
        return Path();
    }
  }

  @override
  bool shouldRepaint(ShapePainter oldDelegate) {
    return oldDelegate.texture != texture || oldDelegate.shape != shape || oldDelegate.colorType != colorType;
  }

  Paint getInteriorPaint(Size size) {
    switch (texture) {
      case TextureType.filled:
        return Paint()..color = color;
      case TextureType.outline:
        return Paint()..color = Colors.transparent;
      case TextureType.banded:
        return Paint()
          ..color = color
          ..shader = LinearGradient(
            colors: getColors(16, color),
            stops: getStops(16),
          ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
      default:
        return Paint();
    }
  }

  Paint getBorderPaint(Size size) {
    return Paint()
      ..color = color
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke
      ..strokeJoin = StrokeJoin.round;
  }
}

class EmptyCard extends StatelessWidget {
  const EmptyCard({
    Key? key,
    this.borderColor,
    this.borderWidth = 1,
    this.color,
    this.child,
  }) : super(key: key);

  final Color? borderColor;
  final double borderWidth;
  final Color? color;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final color = this.color ?? AppTheme.of(context).cardBackgroundColor;
    debugPrint('color $color');
    final borderColor = this.borderColor ?? AppTheme.of(context).cardSilhouetteBorderColor;

    return AspectRatio(
      aspectRatio: 2.25 / 3.5,
      child: Container(
        margin: EdgeInsets.all(4.hs),
        decoration: ShapeDecoration(
          color: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.hs),
            side: BorderSide(color: borderColor, width: borderWidth),
          ),
        ),
        child: Center(child: child),
      ),
    );
  }
}
