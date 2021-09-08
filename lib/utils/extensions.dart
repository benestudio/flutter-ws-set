import 'dart:math' as math;

extension IterableExt<T> on Iterable<Iterable<T>> {
  List<T> flatten() => expand((_) => _).toList();
}

extension IntExt on int {
  double get degrees => this * math.pi / 180;
}

extension DurationExtensions on Duration {
  String formatDuration() {
    final hours = inHours.toString().padLeft(1, '0');
    final minutes = inMinutes.remainder(60).toString().padLeft(1, '0');
    final seconds = inSeconds.remainder(60).toString().padLeft(1, '0');

    final timeStrings = [
      hours == '0' ? null : "${hours}h",
      minutes == '0' ? null : "${minutes}m",
      seconds == '0' ? null : "${seconds}s",
    ];

    if (timeStrings.every((time) => time == null)) {
      return '-';
    }

    return timeStrings.where((time) => time != null).join(' ');
  }

  String formatDurationSimple() {
    final hours = inHours.toString().padLeft(2, '0');
    final minutes = inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = inSeconds.remainder(60).toString().padLeft(2, '0');
    if (hours == '00') {
      return "$minutes:$seconds";
    }

    return "$hours:$minutes:$seconds";
  }
}
