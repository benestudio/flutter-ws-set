import 'package:flutter/material.dart';

class MaterialHero extends StatelessWidget {
  const MaterialHero({Key? key, required this.child, required this.tag}) : super(key: key);

  final Widget child;
  final String tag;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag,
      child: Material(
        type: MaterialType.transparency,
        child: child,
      ),
    );
  }
}

class ConditionalHero extends StatelessWidget {
  const ConditionalHero({
    Key? key,
    required this.child,
    required this.tag,
    this.active = false,
  }) : super(key: key);

  final Widget child;
  final String tag;
  final bool active;

  @override
  Widget build(BuildContext context) {
    if (active) {
      return MaterialHero(
        tag: tag,
        child: child,
      );
    }

    return child;
  }
}
