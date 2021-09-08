import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'score.g.dart';

Duration deserializeDuration(dynamic value) {
  return Duration(microseconds: value.hashCode);
}

@JsonSerializable(includeIfNull: false, explicitToJson: true)
class Score {
  Score({
    required this.id,
    required this.username,
    required this.time
  });

  factory Score.fromJson(Map<String, dynamic> json) => _$ScoreFromJson(json);
  factory Score.fromJsonString(String jsonString) => _$ScoreFromJson(json.decode(jsonString) as Map<String, dynamic>);

  int id;
  final String username;
  @JsonKey(fromJson: deserializeDuration, name: 'email')
  final Duration time;

  static List<Score> listFrom(List<dynamic> list) {
    return list.map((dynamic e) => Score.fromJson(e as Map<String, dynamic>)).toList();
  }
}
