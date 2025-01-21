/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/Back.svg
  String get back => 'assets/icons/Back.svg';

  /// File path: assets/icons/Bookmark.svg
  String get bookmark => 'assets/icons/Bookmark.svg';

  /// File path: assets/icons/Menu.svg
  String get menu => 'assets/icons/Menu.svg';

  /// File path: assets/icons/Notif.svg
  String get notif => 'assets/icons/Notif.svg';

  /// File path: assets/icons/Path.svg
  String get path => 'assets/icons/Path.svg';

  /// File path: assets/icons/Play.svg
  String get play => 'assets/icons/Play.svg';

  /// File path: assets/icons/Star.svg
  String get star => 'assets/icons/Star.svg';

  /// File path: assets/icons/clock.svg
  String get clock => 'assets/icons/clock.svg';

  /// File path: assets/icons/hamburger_menu.svg
  String get hamburgerMenu => 'assets/icons/hamburger_menu.svg';

  /// File path: assets/icons/play_vid.svg
  String get playVid => 'assets/icons/play_vid.svg';

  /// File path: assets/icons/save_click.svg
  String get saveClick => 'assets/icons/save_click.svg';

  /// File path: assets/icons/save_unclick.svg
  String get saveUnclick => 'assets/icons/save_unclick.svg';

  /// File path: assets/icons/ticket.svg
  String get ticket => 'assets/icons/ticket.svg';

  /// File path: assets/icons/ticket_selected.svg
  String get ticketSelected => 'assets/icons/ticket_selected.svg';

  /// List of all assets
  List<String> get values => [
        back,
        bookmark,
        menu,
        notif,
        path,
        play,
        star,
        clock,
        hamburgerMenu,
        playVid,
        saveClick,
        saveUnclick,
        ticket,
        ticketSelected
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/act1.png
  AssetGenImage get act1 => const AssetGenImage('assets/images/act1.png');

  /// File path: assets/images/act2.png
  AssetGenImage get act2 => const AssetGenImage('assets/images/act2.png');

  /// File path: assets/images/act3.png
  AssetGenImage get act3 => const AssetGenImage('assets/images/act3.png');

  /// File path: assets/images/act4.png
  AssetGenImage get act4 => const AssetGenImage('assets/images/act4.png');

  /// File path: assets/images/act5.png
  AssetGenImage get act5 => const AssetGenImage('assets/images/act5.png');

  /// File path: assets/images/act6.png
  AssetGenImage get act6 => const AssetGenImage('assets/images/act6.png');

  /// File path: assets/images/act7.png
  AssetGenImage get act7 => const AssetGenImage('assets/images/act7.png');

  /// File path: assets/images/act8.png
  AssetGenImage get act8 => const AssetGenImage('assets/images/act8.png');

  /// File path: assets/images/film_bg_trailer.png
  AssetGenImage get filmBgTrailer =>
      const AssetGenImage('assets/images/film_bg_trailer.png');

  /// File path: assets/images/post1.png
  AssetGenImage get post1 => const AssetGenImage('assets/images/post1.png');

  /// File path: assets/images/post2.png
  AssetGenImage get post2 => const AssetGenImage('assets/images/post2.png');

  /// File path: assets/images/post2_blur.png
  AssetGenImage get post2Blur =>
      const AssetGenImage('assets/images/post2_blur.png');

  /// File path: assets/images/post3.png
  AssetGenImage get post3 => const AssetGenImage('assets/images/post3.png');

  /// File path: assets/images/post3_blur.png
  AssetGenImage get post3Blur =>
      const AssetGenImage('assets/images/post3_blur.png');

  /// File path: assets/images/post4.png
  AssetGenImage get post4 => const AssetGenImage('assets/images/post4.png');

  /// File path: assets/images/post5.png
  AssetGenImage get post5 => const AssetGenImage('assets/images/post5.png');

  /// File path: assets/images/post6.png
  AssetGenImage get post6 => const AssetGenImage('assets/images/post6.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        act1,
        act2,
        act3,
        act4,
        act5,
        act6,
        act7,
        act8,
        filmBgTrailer,
        post1,
        post2,
        post2Blur,
        post3,
        post3Blur,
        post4,
        post5,
        post6
      ];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
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
