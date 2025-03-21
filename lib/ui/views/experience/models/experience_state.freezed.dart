// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'experience_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ExperienceState {

 ExperienceData? get data; bool get isLoading; String? get error;
/// Create a copy of ExperienceState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExperienceStateCopyWith<ExperienceState> get copyWith => _$ExperienceStateCopyWithImpl<ExperienceState>(this as ExperienceState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExperienceState&&(identical(other.data, data) || other.data == data)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,data,isLoading,error);

@override
String toString() {
  return 'ExperienceState(data: $data, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class $ExperienceStateCopyWith<$Res>  {
  factory $ExperienceStateCopyWith(ExperienceState value, $Res Function(ExperienceState) _then) = _$ExperienceStateCopyWithImpl;
@useResult
$Res call({
 ExperienceData? data, bool isLoading, String? error
});




}
/// @nodoc
class _$ExperienceStateCopyWithImpl<$Res>
    implements $ExperienceStateCopyWith<$Res> {
  _$ExperienceStateCopyWithImpl(this._self, this._then);

  final ExperienceState _self;
  final $Res Function(ExperienceState) _then;

/// Create a copy of ExperienceState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = freezed,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ExperienceData?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc


class _ExperienceState implements ExperienceState {
  const _ExperienceState({this.data, this.isLoading = false, this.error});
  

@override final  ExperienceData? data;
@override@JsonKey() final  bool isLoading;
@override final  String? error;

/// Create a copy of ExperienceState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExperienceStateCopyWith<_ExperienceState> get copyWith => __$ExperienceStateCopyWithImpl<_ExperienceState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExperienceState&&(identical(other.data, data) || other.data == data)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,data,isLoading,error);

@override
String toString() {
  return 'ExperienceState(data: $data, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class _$ExperienceStateCopyWith<$Res> implements $ExperienceStateCopyWith<$Res> {
  factory _$ExperienceStateCopyWith(_ExperienceState value, $Res Function(_ExperienceState) _then) = __$ExperienceStateCopyWithImpl;
@override @useResult
$Res call({
 ExperienceData? data, bool isLoading, String? error
});




}
/// @nodoc
class __$ExperienceStateCopyWithImpl<$Res>
    implements _$ExperienceStateCopyWith<$Res> {
  __$ExperienceStateCopyWithImpl(this._self, this._then);

  final _ExperienceState _self;
  final $Res Function(_ExperienceState) _then;

/// Create a copy of ExperienceState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = freezed,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_ExperienceState(
data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ExperienceData?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
