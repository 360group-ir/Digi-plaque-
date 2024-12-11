/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsPngGen {
  const $AssetsPngGen();

  /// File path: assets/png/Baam.png
  AssetGenImage get baam => const AssetGenImage('assets/png/Baam.png');

  /// File path: assets/png/Qrcode.png
  AssetGenImage get qrcode => const AssetGenImage('assets/png/Qrcode.png');

  /// File path: assets/png/imagePlaceH.png
  AssetGenImage get imagePlaceH =>
      const AssetGenImage('assets/png/imagePlaceH.png');

  /// File path: assets/png/loogo.png
  AssetGenImage get loogo => const AssetGenImage('assets/png/loogo.png');

  /// List of all assets
  List<AssetGenImage> get values => [baam, qrcode, imagePlaceH, loogo];
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/Group.svg
  String get group => 'assets/svg/Group.svg';

  /// File path: assets/svg/Icon-1.svg
  String get icon1 => 'assets/svg/Icon-1.svg';

  /// File path: assets/svg/Icon-2.svg
  String get icon2 => 'assets/svg/Icon-2.svg';

  /// File path: assets/svg/Icon-3.svg
  String get icon3 => 'assets/svg/Icon-3.svg';

  /// File path: assets/svg/Icon-4.svg
  String get icon4 => 'assets/svg/Icon-4.svg';

  /// File path: assets/svg/Icon.svg
  String get icon => 'assets/svg/Icon.svg';

  /// File path: assets/svg/Vector-1.svg
  String get vector1 => 'assets/svg/Vector-1.svg';

  /// File path: assets/svg/Vector-2.svg
  String get vector2 => 'assets/svg/Vector-2.svg';

  /// File path: assets/svg/Vector.svg
  String get vector => 'assets/svg/Vector.svg';

  /// File path: assets/svg/baam.svg
  String get baam => 'assets/svg/baam.svg';

  /// File path: assets/svg/copy.svg
  String get copy => 'assets/svg/copy.svg';

  /// File path: assets/svg/dlogo.svg
  String get dlogo => 'assets/svg/dlogo.svg';

  /// File path: assets/svg/groper360.svg
  String get groper360 => 'assets/svg/groper360.svg';

  /// File path: assets/svg/lang.svg
  String get lang => 'assets/svg/lang.svg';

  /// File path: assets/svg/save.svg
  String get save => 'assets/svg/save.svg';

  /// File path: assets/svg/service360.svg
  String get service360 => 'assets/svg/service360.svg';

  /// File path: assets/svg/share.svg
  String get share => 'assets/svg/share.svg';

  /// File path: assets/svg/smartphone.svg
  String get smartphone => 'assets/svg/smartphone.svg';

  /// File path: assets/svg/tools360.svg
  String get tools360 => 'assets/svg/tools360.svg';

  /// File path: assets/svg/upload.svg
  String get upload => 'assets/svg/upload.svg';

  /// List of all assets
  List<String> get values => [
        group,
        icon1,
        icon2,
        icon3,
        icon4,
        icon,
        vector1,
        vector2,
        vector,
        baam,
        copy,
        dlogo,
        groper360,
        lang,
        save,
        service360,
        share,
        smartphone,
        tools360,
        upload
      ];
}

class Assets {
  Assets._();

  static const $AssetsPngGen png = $AssetsPngGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();
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
    bool gaplessPlayback = false,
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
