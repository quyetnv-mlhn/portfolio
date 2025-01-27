import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncherUtils {
  static Future<void> launchURL(String url) async {
    try {
      if (!await launchUrl(Uri.parse(url))) {
        debugPrint('Could not launch URL: $url');
      }
    } catch (e) {
      debugPrint('Invalid URL: $url');
    }
  }
}
