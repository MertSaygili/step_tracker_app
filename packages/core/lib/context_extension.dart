import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  // default text style
  TextStyle get _defaultTextStyle => const TextStyle();

  // text theme
  TextTheme get _textTheme => Theme.of(this).textTheme;

  // current localization
  String get currentLocalization => Localizations.localeOf(this).languageCode;

  // true, false
  bool get trueCode => true;
  bool get falseCode => false;

  // height, width
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;

  // text theme
  TextStyle get headlineSmall => _textTheme.headlineSmall ?? _defaultTextStyle;
  TextStyle get headlineMedium => _textTheme.headlineMedium ?? _defaultTextStyle;
  TextStyle get headlineLarge => _textTheme.headlineLarge ?? _defaultTextStyle;

  TextStyle get titleSmall => _textTheme.titleSmall ?? _defaultTextStyle;
  TextStyle get titleMedium => _textTheme.titleMedium ?? _defaultTextStyle;
  TextStyle get titleLarge => _textTheme.titleLarge ?? _defaultTextStyle;

  TextStyle get labelSmall => _textTheme.labelSmall ?? _defaultTextStyle;
  TextStyle get labelMedium => _textTheme.labelMedium ?? _defaultTextStyle;
  TextStyle get labelLarge => _textTheme.labelLarge ?? _defaultTextStyle;

  TextStyle get bodySmall => _textTheme.bodySmall ?? _defaultTextStyle;
  TextStyle get bodyMedium => _textTheme.bodyMedium ?? _defaultTextStyle;
  TextStyle get bodyLarge => _textTheme.bodyLarge ?? _defaultTextStyle;

  // constant app colos
  Color get primaryColor => const Color(0XFF3498DB);
  Color get lowPrimaryColor => const Color(0XFF3498DB).withOpacity(0.2);
  Color get backgroundColor => const Color(0XFfF0F0F0);
  Color get errorColor => const Color(0xFFE74C3C);
  Color get borderColor => const Color(0xFFC0C0C0);
  Color get textColor => const Color(0XFF000000);
  Color get textColorLight => const Color(0XFFC0C0C0);
  Color get whiteColor => const Color(0XFFFFFFFF);
  Color get blackColor => const Color(0XFF000000);
  Color get greenColor => const Color(0XFF2ECC71);
  Color get greyColor => const Color(0XFFC0C0C0);
  Color get transparentColor => Colors.transparent;

  // padding
  // ignore: use_named_constants
  EdgeInsets get paddingZero => const EdgeInsets.all(0);
  EdgeInsets get paddingPage => const EdgeInsets.all(20);
  EdgeInsets get paddingHorizontalPage => const EdgeInsets.symmetric(vertical: 8, horizontal: 12);
  EdgeInsets get paddingLeftLow => const EdgeInsets.only(left: 4);
  EdgeInsets get paddingLeftNormal => const EdgeInsets.only(left: 8);
  EdgeInsets get paddingLeftHigh => const EdgeInsets.only(left: 12);
  EdgeInsets get paddingRightLow => const EdgeInsets.only(right: 4);
  EdgeInsets get paddingRightNormal => const EdgeInsets.only(right: 8);
  EdgeInsets get paddingRightHigh => const EdgeInsets.only(right: 12);
  EdgeInsets get paddingHorizontalLeftNormalRightLow => const EdgeInsets.only(left: 8, right: 4);
  EdgeInsets get paddingHorizontalLeftLowRightHigh => const EdgeInsets.only(left: 4, right: 12);
  EdgeInsets get paddingLow => const EdgeInsets.all(4);
  EdgeInsets get paddingMedium => const EdgeInsets.all(8);
  EdgeInsets get paddingMediumX => const EdgeInsets.all(12);
  EdgeInsets get paddingHigh => const EdgeInsets.all(16);
  EdgeInsets get paddingBottom => const EdgeInsets.symmetric(vertical: 32);

  // gap padding
  double get gapPaddingVeryLow => 2;
  double get gapPaddingLow => 4;
  double get gapPaddingNormal => 8;

  // border radius
  BorderRadius get borderRadiusLow => const BorderRadius.all(Radius.circular(4));
  BorderRadius get borderRadiusMedium => const BorderRadius.all(Radius.circular(8));
  BorderRadius get borderRadiusHigh => const BorderRadius.all(Radius.circular(16));

  // empty box column
  SizedBox get emptyBoxLowLowVertical => SizedBox(height: height * 0.01);
  SizedBox get emptyBoxLowVertical => SizedBox(height: height * 0.02);
  SizedBox get emptyBoxMediumVertical => SizedBox(height: height * 0.04);
  SizedBox get emptyBoxLargeVertical => SizedBox(height: height * 0.06);

  // empty box row
  SizedBox get emptyBoxLowHorizontal => SizedBox(width: width * 0.02);
  SizedBox get emptyBoxLowMediumHorizontal => SizedBox(width: width * 0.03);
  SizedBox get emptyBoxMediumHorizontal => SizedBox(width: width * 0.04);
  SizedBox get emptyBoxLargeHorizontal => SizedBox(width: width * 0.06);

  // elevation
  double get zero => 0;
  double get elevationLow => 4;
  double get elevationNormal => 8;

  // icon size
  double get iconSizeLow => 16;
  double get iconSizeMedium => 24;

  // shape
  ShapeBorder get roundedRectangleBorder => RoundedRectangleBorder(borderRadius: borderRadiusMedium);

  // font sizes
  double get fontSize10 => 10;
  double get fontSize11 => 11;
  double get fontSize12 => 12;
  double get fontSize13 => 13;
  double get fontSize14 => 14;
  double get fontSize15 => 15;
  double get fontSize16 => 16;
  double get fontSize18 => 18;
  double get fontSize20 => 20;
  double get fontSize24 => 24;
  double get fontSize28 => 28;
  double get fontSize32 => 32;
  double get fontSize36 => 36;
  double get fontSize40 => 40;
  double get fontSize48 => 48;

  // radius
  double get logoRadius => 100;
}
