// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters, constant_identifier_names

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader {
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String, dynamic> _en_US = {
    "appTitle": "Portfolio",
    "home": {"title": "Home"},
    "about_me": {"name": "About Me", "title": "Who Am I?"},
    "my_skills": "My Skills",
    "skills": {
      "title": "Technical Skills",
      "subtitle": "The tools and technologies I work with daily.",
      "description": "Turning knowledge into impactful projects.",
    },
    "experiences": "Experiences",
    "experience": {
      "title": "My Experience",
      "subtitle": "Everything I have learned and done is summarized here!",
      "description": "Details can be viewed below.",
      "timeline": {
        "present": "Present",
        "skills": "Skills",
        "responsibilities": "Responsibilities",
      },
      "technical_profile": "TECHNICAL PROFILE",
      "empty": "No experience data available",
      "error": {"loading": "Failed to load experiences", "retry": "Retry"},
      "education": {"title": "EDUCATION"},
      "work_experience": {
        "title": "WORK EXPERIENCE",
        "key_responsibilities": "KEY RESPONSIBILITIES",
        "store_links": {
          "google_play": "Get it on Google Play",
          "app_store": "Download on App Store",
          "website": "Visit the website",
        },
      },
    },
    "lifetime": "Lifetime",
    "contact": {
      "title": "Contact",
      "with_me": "Contact Me",
      "subtitle": "Let's Connect and Create Something Amazing Together!",
      "description":
          "Feel free to reach out. I'm always open to discussing new projects, opportunities and collaborations.",
      "name": "Full Name",
      "name_hint": "Enter your full name",
      "name_required": "Please enter your name",
      "email": "Email",
      "email_hint": "Enter your email address",
      "email_required": "Please enter your email",
      "email_invalid": "Invalid email format",
      "phone": "Phone Number",
      "phone_hint": "Enter your phone number",
      "message": "Message",
      "message_hint": "Enter your message",
      "message_required": "Please enter your message",
      "submit": "Submit",
      "phone_required": "Please enter your phone number",
      "success": "Message sent successfully!",
      "error": "An error occurred, please try again later!",
    },
    "social": {
      "facebook": "Follow me on Facebook",
      "telegram": "Contact via Telegram",
      "github": "Check out my GitHub",
      "linkedin": "Connect on LinkedIn",
    },
    "common": {"retry": "Retry"},
  };
  static const Map<String, dynamic> _vi_VN = {
    "appTitle": "Portfolio",
    "home": {"title": "Trang chủ"},
    "about_me": {"name": "Về tui", "title": "Tôi Là Ai ?"},
    "my_skills": "Kỹ năng",
    "skills": {
      "title": "Kỹ Năng Chuyên Môn",
      "subtitle": "Những công cụ và công nghệ mình sử dụng hằng ngày.",
      "description": "Biến kiến thức thành những dự án thực tế.",
    },
    "experiences": "Kinh nghiệm",
    "experience": {
      "title": "Kinh Nghiệm Của Tôi",
      "subtitle": "Tất cả những gì tôi đã học và làm được tổng hợp ở đây!",
      "description": "Chi tiết có thể xem bên dưới.",
      "timeline": {
        "present": "Hiện tại",
        "skills": "Kỹ năng",
        "responsibilities": "Trách nhiệm",
      },
      "technical_profile": "KỸ NĂNG CHUYÊN MÔN",
      "empty": "Chưa có dữ liệu kinh nghiệm",
      "error": {
        "loading": "Không thể tải dữ liệu kinh nghiệm",
        "retry": "Thử lại",
      },
      "education": {"title": "HỌC VẤN"},
      "work_experience": {
        "title": "KINH NGHIỆM LÀM VIỆC",
        "key_responsibilities": "TRÁCH NHIỆM CHÍNH",
        "store_links": {
          "google_play": "Tải về từ Google Play",
          "app_store": "Tải về từ App Store",
          "website": "Xem trên Website",
        },
      },
    },
    "lifetime": "Cuộc sống",
    "contact": {
      "title": "Liên Hệ",
      "with_me": "Liên hệ với tôi",
      "subtitle": "Hãy Kết Nối và Cùng Tạo Nên Điều Tuyệt Vời!",
      "description":
          "Đừng ngần ngại liên hệ. Tôi luôn sẵn sàng thảo luận về các dự án, cơ hội và hợp tác mới.",
      "name": "Họ và tên",
      "name_hint": "Nhập họ và tên của bạn",
      "name_required": "Vui lòng nhập họ và tên",
      "email": "Email",
      "email_hint": "Nhập địa chỉ email của bạn",
      "email_required": "Vui lòng nhập email",
      "email_invalid": "Email không hợp lệ",
      "phone": "Số điện thoại",
      "phone_hint": "Nhập số điện thoại của bạn",
      "message": "Tin nhắn",
      "message_hint": "Nhập tin nhắn của bạn",
      "message_required": "Vui lòng nhập tin nhắn",
      "submit": "Gửi",
      "phone_required": "Vui lòng nhập số điện thoại",
      "success": "Gửi tin nhắn thành công!",
      "error": "Có lỗi xảy ra, vui lòng thử lại sau!",
    },
    "social": {
      "facebook": "Theo dõi tôi trên Facebook",
      "telegram": "Liên hệ qua Telegram",
      "github": "Xem GitHub của tôi",
      "linkedin": "Kết nối trên LinkedIn",
    },
    "common": {"retry": "Thử lại"},
  };
  static const Map<String, Map<String, dynamic>> mapLocales = {
    "en_US": _en_US,
    "vi_VN": _vi_VN,
  };
}
