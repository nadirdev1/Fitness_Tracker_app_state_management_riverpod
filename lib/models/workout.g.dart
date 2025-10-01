// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Workout _$WorkoutFromJson(Map<String, dynamic> json) => _Workout(
  id: json['id'] as String,
  name: json['name'] as String,
  weight: (json['weight'] as num).toDouble(),
  reps: (json['reps'] as num).toInt(),
  sets: (json['sets'] as num).toInt(),
  isCompleted: json['isCompleted'] as bool,
  type: $enumDecode(_$WorkoutTypeEnumMap, json['type']),
  createdAt: DateTime.parse(json['createdAt'] as String),
  completedAt: json['completedAt'] == null
      ? null
      : DateTime.parse(json['completedAt'] as String),
);

Map<String, dynamic> _$WorkoutToJson(_Workout instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'weight': instance.weight,
  'reps': instance.reps,
  'sets': instance.sets,
  'isCompleted': instance.isCompleted,
  'type': _$WorkoutTypeEnumMap[instance.type]!,
  'createdAt': instance.createdAt.toIso8601String(),
  'completedAt': instance.completedAt?.toIso8601String(),
};

const _$WorkoutTypeEnumMap = {
  WorkoutType.upperBody: 'upperBody',
  WorkoutType.lowerBody: 'lowerBody',
};
