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
    "home": {
      "greeting": "Hi! I'm Quyet",
      "role": "a 'Mobile Engineer'",
      "sharing": {
        "line1": "I'll be sharing",
        "line2": "knowledge and various",
        "line3": "stories here"
      },
      "helping": {
        "line1": "I hope to help",
        "line2": "everyone with 'something'",
        "line3": "when you are here"
      },
      "contact": {
        "line1": "If you want to",
        "line2": "reach out, feel free to",
        "line3": "contact me, thank you!"
      }
    },
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
    "home": {
      "greeting": "Hi! Tôi là Quyết",
      "role": "một 'Mobile Engineer'",
      "sharing": {
        "line1": "Tôi sẽ chia sẻ",
        "line2": "kiến thức và những",
        "line3": "câu chuyện ở đây"
      },
      "helping": {
        "line1": "Tôi hy vọng sẽ giúp",
        "line2": "mọi người 'một điều gì đó'",
        "line3": "khi bạn ở đây"
      },
      "contact": {
        "line1": "Nếu bạn muốn",
        "line2": "liên hệ, hãy thoải mái",
        "line3": "nhắn tin cho tôi, cảm ơn!"
      }
    },
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
