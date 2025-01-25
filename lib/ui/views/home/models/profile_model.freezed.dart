// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) {
  return _ProfileModel.fromJson(json);
}

/// @nodoc
mixin _$ProfileModel {
  String get name => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;
  String get motto => throw _privateConstructorUsedError;
  String get avatarUrl => throw _privateConstructorUsedError;
  List<String> get mainSkills => throw _privateConstructorUsedError;
  String get about => throw _privateConstructorUsedError;
  List<String> get hobbies => throw _privateConstructorUsedError;

  /// Serializes this ProfileModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfileModelCopyWith<ProfileModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileModelCopyWith<$Res> {
  factory $ProfileModelCopyWith(
          ProfileModel value, $Res Function(ProfileModel) then) =
      _$ProfileModelCopyWithImpl<$Res, ProfileModel>;
  @useResult
  $Res call(
      {String name,
      String role,
      String motto,
      String avatarUrl,
      List<String> mainSkills,
      String about,
      List<String> hobbies});
}

/// @nodoc
class _$ProfileModelCopyWithImpl<$Res, $Val extends ProfileModel>
    implements $ProfileModelCopyWith<$Res> {
  _$ProfileModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? role = null,
    Object? motto = null,
    Object? avatarUrl = null,
    Object? mainSkills = null,
    Object? about = null,
    Object? hobbies = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      motto: null == motto
          ? _value.motto
          : motto // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: null == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String,
      mainSkills: null == mainSkills
          ? _value.mainSkills
          : mainSkills // ignore: cast_nullable_to_non_nullable
              as List<String>,
      about: null == about
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as String,
      hobbies: null == hobbies
          ? _value.hobbies
          : hobbies // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProfileModelImplCopyWith<$Res>
    implements $ProfileModelCopyWith<$Res> {
  factory _$$ProfileModelImplCopyWith(
          _$ProfileModelImpl value, $Res Function(_$ProfileModelImpl) then) =
      __$$ProfileModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String role,
      String motto,
      String avatarUrl,
      List<String> mainSkills,
      String about,
      List<String> hobbies});
}

/// @nodoc
class __$$ProfileModelImplCopyWithImpl<$Res>
    extends _$ProfileModelCopyWithImpl<$Res, _$ProfileModelImpl>
    implements _$$ProfileModelImplCopyWith<$Res> {
  __$$ProfileModelImplCopyWithImpl(
      _$ProfileModelImpl _value, $Res Function(_$ProfileModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? role = null,
    Object? motto = null,
    Object? avatarUrl = null,
    Object? mainSkills = null,
    Object? about = null,
    Object? hobbies = null,
  }) {
    return _then(_$ProfileModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      motto: null == motto
          ? _value.motto
          : motto // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: null == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String,
      mainSkills: null == mainSkills
          ? _value._mainSkills
          : mainSkills // ignore: cast_nullable_to_non_nullable
              as List<String>,
      about: null == about
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as String,
      hobbies: null == hobbies
          ? _value._hobbies
          : hobbies // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfileModelImpl implements _ProfileModel {
  const _$ProfileModelImpl(
      {required this.name,
      required this.role,
      required this.motto,
      required this.avatarUrl,
      required final List<String> mainSkills,
      required this.about,
      required final List<String> hobbies})
      : _mainSkills = mainSkills,
        _hobbies = hobbies;

  factory _$ProfileModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileModelImplFromJson(json);

  @override
  final String name;
  @override
  final String role;
  @override
  final String motto;
  @override
  final String avatarUrl;
  final List<String> _mainSkills;
  @override
  List<String> get mainSkills {
    if (_mainSkills is EqualUnmodifiableListView) return _mainSkills;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mainSkills);
  }

  @override
  final String about;
  final List<String> _hobbies;
  @override
  List<String> get hobbies {
    if (_hobbies is EqualUnmodifiableListView) return _hobbies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hobbies);
  }

  @override
  String toString() {
    return 'ProfileModel(name: $name, role: $role, motto: $motto, avatarUrl: $avatarUrl, mainSkills: $mainSkills, about: $about, hobbies: $hobbies)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.motto, motto) || other.motto == motto) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            const DeepCollectionEquality()
                .equals(other._mainSkills, _mainSkills) &&
            (identical(other.about, about) || other.about == about) &&
            const DeepCollectionEquality().equals(other._hobbies, _hobbies));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      role,
      motto,
      avatarUrl,
      const DeepCollectionEquality().hash(_mainSkills),
      about,
      const DeepCollectionEquality().hash(_hobbies));

  /// Create a copy of ProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileModelImplCopyWith<_$ProfileModelImpl> get copyWith =>
      __$$ProfileModelImplCopyWithImpl<_$ProfileModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileModelImplToJson(
      this,
    );
  }
}

abstract class _ProfileModel implements ProfileModel {
  const factory _ProfileModel(
      {required final String name,
      required final String role,
      required final String motto,
      required final String avatarUrl,
      required final List<String> mainSkills,
      required final String about,
      required final List<String> hobbies}) = _$ProfileModelImpl;

  factory _ProfileModel.fromJson(Map<String, dynamic> json) =
      _$ProfileModelImpl.fromJson;

  @override
  String get name;
  @override
  String get role;
  @override
  String get motto;
  @override
  String get avatarUrl;
  @override
  List<String> get mainSkills;
  @override
  String get about;
  @override
  List<String> get hobbies;

  /// Create a copy of ProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileModelImplCopyWith<_$ProfileModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
