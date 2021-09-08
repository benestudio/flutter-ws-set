import 'package:flutter/material.dart';

class IgnoreTextScale extends StatelessWidget {
  const IgnoreTextScale({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: child,
    );
  }
}