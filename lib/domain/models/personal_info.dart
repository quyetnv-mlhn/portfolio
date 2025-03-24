import 'package:freezed_annotation/freezed_annotation.dart';

part 'personal_info.freezed.dart';
part 'personal_info.g.dart';

@freezed
abstract class PersonalInfo with _$PersonalInfo {
  const factory PersonalInfo({
    required String name,
    @JsonKey(name: 'image_path') required String imagePath,
    @JsonKey(name: 'social_links') required List<SocialLinkInfo> socialLinks,
  }) = _PersonalInfo;

  factory PersonalInfo.fromJson(Map<String, dynamic> json) =>
      _$PersonalInfoFromJson(json);
}

@freezed
abstract class SocialLinkInfo with _$SocialLinkInfo {
  const factory SocialLinkInfo({
    required String platform,
    required String url,
  }) = _SocialLinkInfo;

  factory SocialLinkInfo.fromJson(Map<String, dynamic> json) =>
      _$SocialLinkInfoFromJson(json);
}
