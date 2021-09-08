// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'score.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Score _$ScoreFromJson(Map<String, dynamic> json) {
  return Score(
    id: json['id'] as int,
    username: json['username'] as String,
    time: deserializeDuration(json['email']),
  );
}

Map<String, dynamic> _$ScoreToJson(Score instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.time.inMicroseconds,
    };
