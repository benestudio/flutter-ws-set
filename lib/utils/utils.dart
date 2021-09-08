import 'package:flutter/material.dart';
import 'package:f_set/utils/extensions.dart';
import 'package:flutter/widgets.dart';

List<Color> getColors(int numberOfBands, Color color) {
  return List.generate(
        numberOfBands,
        (index) => [
          Colors.transparent,
          Colors.transparent,
          color,
          color,
        ],
      ).flatten() +
      [
        Colors.transparent,
        Colors.transparent,
      ];
}

List<double> getStops(int numberOfBands) {
  return List.generate(
        numberOfBands,
        (index) {
          final start = index / (numberOfBands + .5);
          final end = (index + 1) / (numberOfBands + .5);
          final half = start + (end - start) / 2;
          return [start, half, half, end];
        },
      ).flatten() +
      [
        numberOfBands / (numberOfBands + .5),
        1.0,
      ];
}
