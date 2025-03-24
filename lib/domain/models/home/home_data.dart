import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_data.freezed.dart';
part 'home_data.g.dart';

@freezed
abstract class HomeData with _$HomeData {
  const factory HomeData({
    @JsonKey(name: 'avatar_path') required String avatarPath,
    required List<SlideData> slides,
  }) = _HomeData;

  factory HomeData.fromJson(Map<String, dynamic> json) =>
      _$HomeDataFromJson(json);
}

@freezed
abstract class SlideData with _$SlideData {
  const factory SlideData({
    required Position position,
    required List<String> messages,
    required String image,
  }) = _SlideData;

  factory SlideData.fromJson(Map<String, dynamic> json) =>
      _$SlideDataFromJson(json);
}

@freezed
abstract class Position with _$Position {
  const factory Position({required double x, required double y}) = _Position;

  factory Position.fromJson(Map<String, dynamic> json) =>
      _$PositionFromJson(json);
}
