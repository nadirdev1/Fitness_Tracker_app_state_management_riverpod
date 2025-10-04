// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Workout {

 String get id; String get name; double get weight; int get reps; int get sets; bool get isCompleted; WorkoutType get type; DateTime get createdAt; DateTime? get completedAt;
/// Create a copy of Workout
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkoutCopyWith<Workout> get copyWith => _$WorkoutCopyWithImpl<Workout>(this as Workout, _$identity);

  /// Serializes this Workout to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Workout&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.reps, reps) || other.reps == reps)&&(identical(other.sets, sets) || other.sets == sets)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.type, type) || other.type == type)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,weight,reps,sets,isCompleted,type,createdAt,completedAt);

@override
String toString() {
  return 'Workout(id: $id, name: $name, weight: $weight, reps: $reps, sets: $sets, isCompleted: $isCompleted, type: $type, createdAt: $createdAt, completedAt: $completedAt)';
}


}

/// @nodoc
abstract mixin class $WorkoutCopyWith<$Res>  {
  factory $WorkoutCopyWith(Workout value, $Res Function(Workout) _then) = _$WorkoutCopyWithImpl;
@useResult
$Res call({
 String id, String name, double weight, int reps, int sets, bool isCompleted, WorkoutType type, DateTime createdAt, DateTime? completedAt
});




}
/// @nodoc
class _$WorkoutCopyWithImpl<$Res>
    implements $WorkoutCopyWith<$Res> {
  _$WorkoutCopyWithImpl(this._self, this._then);

  final Workout _self;
  final $Res Function(Workout) _then;

/// Create a copy of Workout
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? weight = null,Object? reps = null,Object? sets = null,Object? isCompleted = null,Object? type = null,Object? createdAt = null,Object? completedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double,reps: null == reps ? _self.reps : reps // ignore: cast_nullable_to_non_nullable
as int,sets: null == sets ? _self.sets : sets // ignore: cast_nullable_to_non_nullable
as int,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as WorkoutType,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [Workout].
extension WorkoutPatterns on Workout {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Workout value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Workout() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Workout value)  $default,){
final _that = this;
switch (_that) {
case _Workout():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Workout value)?  $default,){
final _that = this;
switch (_that) {
case _Workout() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  double weight,  int reps,  int sets,  bool isCompleted,  WorkoutType type,  DateTime createdAt,  DateTime? completedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Workout() when $default != null:
return $default(_that.id,_that.name,_that.weight,_that.reps,_that.sets,_that.isCompleted,_that.type,_that.createdAt,_that.completedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  double weight,  int reps,  int sets,  bool isCompleted,  WorkoutType type,  DateTime createdAt,  DateTime? completedAt)  $default,) {final _that = this;
switch (_that) {
case _Workout():
return $default(_that.id,_that.name,_that.weight,_that.reps,_that.sets,_that.isCompleted,_that.type,_that.createdAt,_that.completedAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  double weight,  int reps,  int sets,  bool isCompleted,  WorkoutType type,  DateTime createdAt,  DateTime? completedAt)?  $default,) {final _that = this;
switch (_that) {
case _Workout() when $default != null:
return $default(_that.id,_that.name,_that.weight,_that.reps,_that.sets,_that.isCompleted,_that.type,_that.createdAt,_that.completedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Workout implements Workout {
  const _Workout({required this.id, required this.name, required this.weight, required this.reps, required this.sets, required this.isCompleted, required this.type, required this.createdAt, this.completedAt});
  factory _Workout.fromJson(Map<String, dynamic> json) => _$WorkoutFromJson(json);

@override final  String id;
@override final  String name;
@override final  double weight;
@override final  int reps;
@override final  int sets;
@override final  bool isCompleted;
@override final  WorkoutType type;
@override final  DateTime createdAt;
@override final  DateTime? completedAt;

/// Create a copy of Workout
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorkoutCopyWith<_Workout> get copyWith => __$WorkoutCopyWithImpl<_Workout>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WorkoutToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Workout&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.reps, reps) || other.reps == reps)&&(identical(other.sets, sets) || other.sets == sets)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.type, type) || other.type == type)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,weight,reps,sets,isCompleted,type,createdAt,completedAt);

@override
String toString() {
  return 'Workout(id: $id, name: $name, weight: $weight, reps: $reps, sets: $sets, isCompleted: $isCompleted, type: $type, createdAt: $createdAt, completedAt: $completedAt)';
}


}

/// @nodoc
abstract mixin class _$WorkoutCopyWith<$Res> implements $WorkoutCopyWith<$Res> {
  factory _$WorkoutCopyWith(_Workout value, $Res Function(_Workout) _then) = __$WorkoutCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, double weight, int reps, int sets, bool isCompleted, WorkoutType type, DateTime createdAt, DateTime? completedAt
});




}
/// @nodoc
class __$WorkoutCopyWithImpl<$Res>
    implements _$WorkoutCopyWith<$Res> {
  __$WorkoutCopyWithImpl(this._self, this._then);

  final _Workout _self;
  final $Res Function(_Workout) _then;

/// Create a copy of Workout
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? weight = null,Object? reps = null,Object? sets = null,Object? isCompleted = null,Object? type = null,Object? createdAt = null,Object? completedAt = freezed,}) {
  return _then(_Workout(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double,reps: null == reps ? _self.reps : reps // ignore: cast_nullable_to_non_nullable
as int,sets: null == sets ? _self.sets : sets // ignore: cast_nullable_to_non_nullable
as int,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as WorkoutType,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
