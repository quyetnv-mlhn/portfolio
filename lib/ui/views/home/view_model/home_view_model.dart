import 'package:portfolio/gen/assets.gen.dart';
import 'package:portfolio/gen/locale_keys.g.dart';
import 'package:portfolio/ui/views/home/models/slide_data.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_view_model.g.dart';

@riverpod
class HomeViewModel extends _$HomeViewModel {
  @override
  int build() {
    return 0;
  }

  void setCurrentIndex(int index) => state = index;

  static final slides = [
    SlideData(
      positionX: 0.7,
      positionY: 0.115,
      messages: [LocaleKeys.home_greeting, LocaleKeys.home_role],
      image: Assets.images.banner.path,
    ),
    SlideData(
      positionX: 0.7,
      positionY: 0.4,
      messages: [
        LocaleKeys.home_sharing_line1,
        LocaleKeys.home_sharing_line2,
        LocaleKeys.home_sharing_line3,
      ],
      image: Assets.images.banner1.path,
    ),
    SlideData(
      positionX: 0.112,
      positionY: 0.115,
      messages: [
        LocaleKeys.home_helping_line1,
        LocaleKeys.home_helping_line2,
        LocaleKeys.home_helping_line3,
      ],
      image: Assets.images.banner2.path,
    ),
    SlideData(
      positionX: 0.112,
      positionY: 0.115,
      messages: [
        LocaleKeys.home_contact_line1,
        LocaleKeys.home_contact_line2,
        LocaleKeys.home_contact_line3,
      ],
      image: Assets.images.banner3.path,
    ),
  ];
}
