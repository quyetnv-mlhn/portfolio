import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_model.freezed.dart';
part 'profile_model.g.dart';

@freezed
class ProfileModel with _$ProfileModel {
  const factory ProfileModel({
    required String name,
    required String role,
    required String motto,
    required String avatarUrl,
    required List<String> mainSkills,
    required String about,
    required List<String> hobbies,
  }) = _ProfileModel;

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);
}
