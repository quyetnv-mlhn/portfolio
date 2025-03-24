import 'package:freezed_annotation/freezed_annotation.dart';

part 'about_me_data.freezed.dart';
part 'about_me_data.g.dart';

@freezed
abstract class AboutMeData with _$AboutMeData {
  const factory AboutMeData({
    required String greeting,
    @JsonKey(name: 'image_path') required String imagePath,
    required String title,
    required IntroData intro,
    @JsonKey(name: 'bullet_points') required List<String> bulletPoints,
  }) = _AboutMeData;

  factory AboutMeData.fromJson(Map<String, dynamic> json) =>
      _$AboutMeDataFromJson(json);
}

@freezed
abstract class IntroData with _$IntroData {
  const factory IntroData({
    required String part1,
    required String role,
    required String part2,
    required String exploring,
    required String part3,
  }) = _IntroData;

  factory IntroData.fromJson(Map<String, dynamic> json) =>
      _$IntroDataFromJson(json);
}
