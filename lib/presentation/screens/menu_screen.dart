import 'package:f_set/presentation/theme/app_theme.dart';
import 'package:f_set/presentation/theme/scale.dart';
import 'package:f_set/set.dart';
import 'package:auto_route/auto_route.dart';
import 'package:f_set/presentation/routing/app_auto_router.gr.dart';
import 'package:f_set/utils/type_scale.dart';
import 'package:f_set/utils/utils.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.6,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(flex: 2),
              const _SetTitle(),
              const Spacer(flex: 2),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                    child: const TypeScale.h3(Text('Start')),
                    onPressed: () => context.router.navigate(const GameRoute()),
                  ),
                  SizedBox(height: 8.hs),
                  OutlinedButton(
                    child: const TypeScale.h3(Text('Learn')),
                    onPressed: () => context.router.navigate(const InstructionsRoute()),
                  ),
                  SizedBox(height: 8.hs),
                  OutlinedButton(
                    child: const TypeScale.h3(Text('High scores')),
                    onPressed: () {},
                  ),
                ],
              ),
              const Spacer(flex: 5),
            ],
          ),
        ),
      ),
    );
  }
}

class _SetTitle extends StatelessWidget {
  const _SetTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TypeScale.h1(
          Text('S', style: TextStyle(color: AppTheme.cardColorMap[ColorType.yellow])),
        ),
        TypeScale.h1(Text(
          'E',
          style: TextStyle(
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 1
              ..color = AppTheme.cardColorMap[ColorType.blue]!,
          ),
        )),
        BandedText(text: 'T', color: AppTheme.cardColorMap[ColorType.green]!),
      ],
    );
  }
}

class BandedText extends StatelessWidget {
  const BandedText({Key? key, required this.text, required this.color}) : super(key: key);

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TypeScale.h1(
          Text(
            text,
            style: TextStyle(
              foreground: Paint()
                ..shader = ui.Gradient.linear(
                  Offset.zero,
                  const Offset(160, 0),
                  getColors(26, color),
                  getStops(26),
                  ui.TileMode.mirror,
                ),
            ),
          ),
        ),
        TypeScale.h1(
          Text(
            text,
            style: TextStyle(
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = 1
                ..color = color,
            ),
          ),
        ),
      ],
    );
  }
}
