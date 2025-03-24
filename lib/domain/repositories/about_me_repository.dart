import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/core/enums/locale_enum.dart';
import 'package:portfolio/data/repositories/about_me_repository_impl.dart';
import 'package:portfolio/domain/models/about_me/about_me_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'about_me_repository.g.dart';

@Riverpod(keepAlive: true)
AboutMeRepository aboutMeRepository(Ref ref) {
  return AboutMeRepositoryImpl();
}

abstract class AboutMeRepository {
  Future<AboutMeData> getAboutMeData(LocaleEnum locale);
}
