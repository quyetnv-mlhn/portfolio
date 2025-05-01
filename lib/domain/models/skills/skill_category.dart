import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'skill_category.freezed.dart';
part 'skill_category.g.dart';

@freezed
abstract class SkillCategoryResponse with _$SkillCategoryResponse {
  const factory SkillCategoryResponse({
    required List<SkillCategory> categories,
  }) = _SkillCategoryResponse;

  factory SkillCategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$SkillCategoryResponseFromJson(json);
}

@freezed
abstract class SkillCategory with _$SkillCategory {
  const factory SkillCategory({
    required String title,
    required List<String> skills,
    @IconDataConverter() required IconData icon,
  }) = _SkillCategory;

  factory SkillCategory.fromJson(Map<String, dynamic> json) =>
      _$SkillCategoryFromJson(json);
}

class IconDataConverter implements JsonConverter<IconData, String> {
  const IconDataConverter();

  @override
  IconData fromJson(String iconName) {
    switch (iconName) {
      case 'code':
        return Icons.code;
      case 'architecture':
        return Icons.architecture;
      case 'smartphone':
        return Icons.smartphone;
      case 'wifi':
        return Icons.wifi;
      case 'api':
        return Icons.api;
      case 'storage':
        return Icons.storage;
      case 'lock':
        return Icons.lock;
      case 'sync':
        return Icons.sync;
      case 'assignment':
        return Icons.assignment;
      case 'source':
        return Icons.source;
      case 'build':
        return Icons.build;
      default:
        return Icons.code;
    }
  }

  @override
  String toJson(IconData icon) {
    if (icon == Icons.code) return 'code';
    if (icon == Icons.architecture) return 'architecture';
    if (icon == Icons.smartphone) return 'smartphone';
    if (icon == Icons.wifi) return 'wifi';
    if (icon == Icons.api) return 'api';
    if (icon == Icons.storage) return 'storage';
    if (icon == Icons.lock) return 'lock';
    if (icon == Icons.sync) return 'sync';
    if (icon == Icons.assignment) return 'assignment';
    if (icon == Icons.source) return 'source';
    if (icon == Icons.build) return 'build';
    return 'code';
  }
}
