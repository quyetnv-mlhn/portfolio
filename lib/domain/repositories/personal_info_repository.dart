import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/data/repositories/personal_info_repository_impl.dart';
import 'package:portfolio/domain/models/personal_info.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'personal_info_repository.g.dart';

@Riverpod(keepAlive: true)
PersonalInfoRepository personalInfoRepository(Ref ref) {
  return PersonalInfoRepositoryImpl();
}

abstract class PersonalInfoRepository {
  Future<PersonalInfo> getPersonalInfo();
}
