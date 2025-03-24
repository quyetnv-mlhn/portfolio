import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:portfolio/domain/models/personal_info.dart';
import 'package:portfolio/domain/repositories/personal_info_repository.dart';
import 'package:portfolio/gen/assets.gen.dart';

class PersonalInfoRepositoryImpl implements PersonalInfoRepository {
  @override
  Future<PersonalInfo> getPersonalInfo() async {
    try {
      final String jsonString = await rootBundle.loadString(
        Assets.data.base.personalInfo,
      );
      final json = jsonDecode(jsonString) as Map<String, dynamic>;
      return PersonalInfo.fromJson(json);
    } catch (e, s) {
      throw Exception('Failed to load personal info: $e\n$s');
    }
  }
}
