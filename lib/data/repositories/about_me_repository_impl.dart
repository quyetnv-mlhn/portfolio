import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:portfolio/core/enums/locale_enum.dart';
import 'package:portfolio/domain/models/about_me/about_me_data.dart';
import 'package:portfolio/domain/repositories/about_me_repository.dart';
import 'package:portfolio/gen/assets.gen.dart';

class AboutMeRepositoryImpl implements AboutMeRepository {
  @override
  Future<AboutMeData> getAboutMeData(LocaleEnum locale) async {
    try {
      String assetFile;
      switch (locale) {
        case LocaleEnum.en:
          assetFile = Assets.data.aboutMe.aboutMeEn;
          break;
        case LocaleEnum.vi:
          assetFile = Assets.data.aboutMe.aboutMeVi;
          break;
      }
      final String jsonString = await rootBundle.loadString(assetFile);
      final json = jsonDecode(jsonString) as Map<String, dynamic>;
      return AboutMeData.fromJson(json);
    } catch (e, s) {
      throw Exception('Failed to load about me data: $e\n$s');
    }
  }
}
