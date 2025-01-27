// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader {
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String, dynamic> en_US = {
    "appTitle": "Portfolio",
    "home": "Home",
    "about_me": "About Me",
    "my_blogs": "My Blogs",
    "experiences": "Experiences",
    "lifetime": "Lifetime",
    "contact": "Contact",
    "name": "I'm Quyet",
    "social": {
      "facebook": "Follow me on Facebook",
      "telegram": "Contact me via Telegram",
      "github": "Check out my GitHub",
      "linkedin": "Connect with me on LinkedIn"
    }
  };
  static const Map<String, dynamic> vi_VN = {
    "appTitle": "Portfolio",
    "home": "Trang chủ",
    "about_me": "Về tui",
    "my_blogs": "Blogs tui viết",
    "experiences": "Kinh nghiệm",
    "lifetime": "Cuộc sống",
    "contact": "Liên hệ",
    "name": "Đây là Quyết",
    "social": {
      "facebook": "Theo dõi tôi trên Facebook",
      "telegram": "Liên hệ qua Telegram",
      "github": "Xem GitHub của tôi",
      "linkedin": "Kết nối trên LinkedIn"
    }
  };
  static const Map<String, Map<String, dynamic>> mapLocales = {
    "en_US": en_US,
    "vi_VN": vi_VN
  };
}
