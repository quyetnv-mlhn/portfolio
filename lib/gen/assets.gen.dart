/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsEnvGen {
  const $AssetsEnvGen();

  /// File path: assets/env/.env.dev
  String get aEnvDev => 'assets/env/.env.dev';

  /// File path: assets/env/.env.prod
  String get aEnvProd => 'assets/env/.env.prod';

  /// File path: assets/env/.env.stg
  String get aEnvStg => 'assets/env/.env.stg';

  /// File path: assets/env/.env.template
  String get aEnvTemplate => 'assets/env/.env.template';

  /// List of all assets
  List<String> get values => [aEnvDev, aEnvProd, aEnvStg, aEnvTemplate];
}

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// Directory path: assets/fonts/Mali
  $AssetsFontsMaliGen get mali => const $AssetsFontsMaliGen();
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/arrow.svg
  String get arrow => 'assets/icons/arrow.svg';

  /// File path: assets/icons/brightness.svg
  String get brightness => 'assets/icons/brightness.svg';

  /// File path: assets/icons/facebook.svg
  String get facebook => 'assets/icons/facebook.svg';

  /// File path: assets/icons/github.svg
  String get github => 'assets/icons/github.svg';

  /// File path: assets/icons/house-night.svg
  String get houseNight => 'assets/icons/house-night.svg';

  /// File path: assets/icons/linkedin.svg
  String get linkedin => 'assets/icons/linkedin.svg';

  /// File path: assets/icons/telegram.svg
  String get telegram => 'assets/icons/telegram.svg';

  /// List of all assets
  List<String> get values =>
      [arrow, brightness, facebook, github, houseNight, linkedin, telegram];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/avatar.jpeg
  AssetGenImage get avatarJpeg =>
      const AssetGenImage('assets/images/avatar.jpeg');

  /// File path: assets/images/avatar.png
  AssetGenImage get avatarPng =>
      const AssetGenImage('assets/images/avatar.png');

  /// List of all assets
  List<AssetGenImage> get values => [avatarJpeg, avatarPng];
}

class $AssetsTranslationsGen {
  const $AssetsTranslationsGen();

  /// File path: assets/translations/en-US.json
  String get enUS => 'assets/translations/en-US.json';

  /// File path: assets/translations/vi-VN.json
  String get viVN => 'assets/translations/vi-VN.json';

  /// List of all assets
  List<String> get values => [enUS, viVN];
}

class $AssetsFontsMaliGen {
  const $AssetsFontsMaliGen();

  /// File path: assets/fonts/Mali/Mali-Bold.ttf
  String get maliBold => 'assets/fonts/Mali/Mali-Bold.ttf';

  /// File path: assets/fonts/Mali/Mali-BoldItalic.ttf
  String get maliBoldItalic => 'assets/fonts/Mali/Mali-BoldItalic.ttf';

  /// File path: assets/fonts/Mali/Mali-ExtraLight.ttf
  String get maliExtraLight => 'assets/fonts/Mali/Mali-ExtraLight.ttf';

  /// File path: assets/fonts/Mali/Mali-ExtraLightItalic.ttf
  String get maliExtraLightItalic =>
      'assets/fonts/Mali/Mali-ExtraLightItalic.ttf';

  /// File path: assets/fonts/Mali/Mali-Italic.ttf
  String get maliItalic => 'assets/fonts/Mali/Mali-Italic.ttf';

  /// File path: assets/fonts/Mali/Mali-Light.ttf
  String get maliLight => 'assets/fonts/Mali/Mali-Light.ttf';

  /// File path: assets/fonts/Mali/Mali-LightItalic.ttf
  String get maliLightItalic => 'assets/fonts/Mali/Mali-LightItalic.ttf';

  /// File path: assets/fonts/Mali/Mali-Medium.ttf
  String get maliMedium => 'assets/fonts/Mali/Mali-Medium.ttf';

  /// File path: assets/fonts/Mali/Mali-MediumItalic.ttf
  String get maliMediumItalic => 'assets/fonts/Mali/Mali-MediumItalic.ttf';

  /// File path: assets/fonts/Mali/Mali-Regular.ttf
  String get maliRegular => 'assets/fonts/Mali/Mali-Regular.ttf';

  /// File path: assets/fonts/Mali/Mali-SemiBold.ttf
  String get maliSemiBold => 'assets/fonts/Mali/Mali-SemiBold.ttf';

  /// File path: assets/fonts/Mali/Mali-SemiBoldItalic.ttf
  String get maliSemiBoldItalic => 'assets/fonts/Mali/Mali-SemiBoldItalic.ttf';

  /// File path: assets/fonts/Mali/OFL.txt
  String get ofl => 'assets/fonts/Mali/OFL.txt';

  /// List of all assets
  List<String> get values => [
        maliBold,
        maliBoldItalic,
        maliExtraLight,
        maliExtraLightItalic,
        maliItalic,
        maliLight,
        maliLightItalic,
        maliMedium,
        maliMediumItalic,
        maliRegular,
        maliSemiBold,
        maliSemiBoldItalic,
        ofl
      ];
}

class Assets {
  Assets._();

  static const $AssetsEnvGen env = $AssetsEnvGen();
  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsTranslationsGen translations = $AssetsTranslationsGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
