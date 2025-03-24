import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/core/enums/locale_enum.dart';
import 'package:portfolio/data/repositories/home_repository_impl.dart';
import 'package:portfolio/domain/models/home/home_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_repository.g.dart';

@Riverpod(keepAlive: true)
HomeRepository homeRepository(Ref ref) {
  return HomeRepositoryImpl();
}

abstract class HomeRepository {
  Future<HomeData> getHomeData(LocaleEnum locale);
}
