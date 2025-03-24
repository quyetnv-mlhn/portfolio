import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:portfolio/core/enums/locale_enum.dart';
import 'package:portfolio/domain/models/home/home_data.dart';
import 'package:portfolio/domain/repositories/home_repository.dart';
import 'package:portfolio/gen/assets.gen.dart';

class HomeRepositoryImpl implements HomeRepository {
  @override
  Future<HomeData> getHomeData(LocaleEnum locale) async {
    try {
      String path;
      switch (locale) {
        case LocaleEnum.vi:
          path = Assets.data.home.homeVi;
          break;
        case LocaleEnum.en:
          path = Assets.data.home.homeEn;
          break;
      }

      final String jsonString = await rootBundle.loadString(path);
      final Map<String, dynamic> jsonData = json.decode(jsonString);
      return HomeData.fromJson(jsonData);
    } catch (e) {
      throw Exception('Failed to load home data: $e');
    }
  }
}
