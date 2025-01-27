enum NavigationSection {
  home,
  aboutMe,
  myBlogs,
  experiences,
  lifetime,
  contact,
}

extension NavigationSectionExt on NavigationSection {
  String get title {
    switch (this) {
      case NavigationSection.home:
        return 'Home';
      case NavigationSection.aboutMe:
        return 'About Me';
      case NavigationSection.myBlogs:
        return 'My Blogs';
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
        return 'home';
      case NavigationSection.aboutMe:
        return 'about_me';
      case NavigationSection.myBlogs:
        return 'my_blogs';
      case NavigationSection.experiences:
        return 'experiences';
      case NavigationSection.lifetime:
        return 'lifetime';
      case NavigationSection.contact:
        return 'contact';
    }
  }
}
