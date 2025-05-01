import 'package:portfolio/gen/locale_keys.g.dart';

enum NavigationSection { home, aboutMe, skills, experiences, lifetime, contact }

extension NavigationSectionExt on NavigationSection {
  String get title {
    switch (this) {
      case NavigationSection.home:
        return 'Home';
      case NavigationSection.aboutMe:
        return 'About Me';
      case NavigationSection.skills:
        return 'My Skills';
      case NavigationSection.experiences:
        return 'Experiences';
      case NavigationSection.lifetime:
        return 'Lifetime';
      case NavigationSection.contact:
        return 'Contact';
    }
  }

  String get key {
    switch (this) {
      case NavigationSection.home:
        return LocaleKeys.home_title;
      case NavigationSection.aboutMe:
        return LocaleKeys.about_me_name;
      case NavigationSection.skills:
        return LocaleKeys.my_skills;
      case NavigationSection.experiences:
        return LocaleKeys.experiences;
      case NavigationSection.lifetime:
        return LocaleKeys.lifetime;
      case NavigationSection.contact:
        return LocaleKeys.contact;
    }
  }
}
