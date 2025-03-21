import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TechIcons {
  // Mapping of technology (lowercase) to asset path and fallback icon
  static const Map<String, (String, IconData)> _techMapping = {
    'flutter': ('assets/icons/techs/flutter.svg', Icons.flutter_dash),
    'dart': ('assets/icons/techs/dart.svg', Icons.flutter_dash),
    'android': ('assets/icons/techs/android.svg', Icons.android),
    'ios': ('assets/icons/techs/ios.svg', Icons.apple),
    'swift': ('assets/icons/techs/swift.svg', Icons.apple),
    'react': ('assets/icons/techs/react.svg', Icons.web),
    'javascript': ('assets/icons/techs/javascript.svg', Icons.code),
    'js': ('assets/icons/techs/javascript.svg', Icons.code),
    'firebase': (
      'assets/icons/tec5hs/firebase.svg',
      Icons.local_fire_department,
    ),
    'aws': ('assets/icons/techs/aws.svg', Icons.cloud),
    'azure': ('assets/icons/techs/azure.svg', Icons.cloud),
    'database': ('assets/icons/techs/database.svg', Icons.storage),
    'sql': ('assets/icons/techs/database.svg', Icons.storage),
    'git': ('assets/icons/techs/github.svg', Icons.code),
    'github': ('assets/icons/techs/github.svg', Icons.code),
    'figma': ('assets/icons/techs/figma.svg', Icons.design_services),
    'python': ('assets/icons/techs/python.svg', Icons.code),
    'nodejs': ('assets/icons/techs/nodejs.svg', Icons.code),
    'nextjs': ('assets/icons/techs/nextjs.svg', Icons.web),
    'getx': ('assets/icons/techs/flutter.svg', Icons.flutter_dash),
    'riverpod': ('assets/icons/techs/flutter.svg', Icons.flutter_dash),
    'odoo': ('assets/icons/techs/odoo.svg', Icons.business),
    'php': ('assets/icons/techs/php.svg', Icons.code),
  };

  // Default icon for undefined technologies
  static const IconData _defaultIcon = Icons.developer_mode;

  /// Returns an icon (SVG or Material Icon) for the specified technology
  ///
  /// Parameters:
  /// - [technology]: Technology name (case insensitive)
  /// - [size]: Icon size (defaults to 16)
  /// - [color]: Icon color (defaults to black)
  /// - [context]: BuildContext for asset verification
  static Future<Widget> getIcon(
    String technology, {
    double size = 16,
    Color? color,
  }) async {
    final tech = technology.toLowerCase();
    final defaultColor = color ?? Colors.black;

    // Find technology in mapping
    final techEntry = _techMapping[tech];
    if (techEntry == null) {
      debugPrint('TechIcons: No icon found for "$technology". Using default.');
      return Icon(_defaultIcon, size: size, color: defaultColor);
    }

    final (assetPath, fallbackIcon) = techEntry;

    // Verify SVG file exists
    if (!await _checkAssetExists(assetPath)) {
      debugPrint('TechIcons: Asset "$assetPath" not found. Using fallback.');
      return Icon(fallbackIcon, size: size, color: defaultColor);
    }

    // Load and return SVG
    try {
      return SvgPicture.asset(
        assetPath,
        width: size,
        height: size,
        colorFilter: ColorFilter.mode(defaultColor, BlendMode.srcIn),
      );
    } catch (e) {
      debugPrint('TechIcons: SVG error for "$technology": $e');
      return Icon(fallbackIcon, size: size, color: defaultColor);
    }
  }

  /// Check if an asset exists in the bundle
  static Future<bool> _checkAssetExists(String assetPath) async {
    try {
      await rootBundle.load(assetPath);
      return true;
    } catch (_) {
      return false;
    }
  }
}
