import 'package:flutter/material.dart';

class ColorsTheme extends ThemeExtension<ColorsTheme> {
  final Color backgroundColor;
  final Color primaryColor;
  final Color secundaryColor;
  final Color terciaryColor;
  final Color textBadgeSelectedColor;
  final Color backgroundInfoColor;
  final Color backgroundSelectedColor;
  final Color blackColor;
  final Color iconsColor;
  final Color iconsWhiteColor;
  final Color badgeSelectedColor;
  final Color badgeUnselectedColor;
  final Color titleColor;
  final Color onlineColor;
  final Color profileSkilltextColor;
  final Color profileIconsAvaliableColor;
  final Color profileIconsUnvaliableColor;
  final List<Color> skillColor;
  ColorsTheme({
    required this.backgroundColor,
    required this.primaryColor,
    required this.secundaryColor,
    required this.terciaryColor,
    required this.textBadgeSelectedColor,
    required this.backgroundInfoColor,
    required this.backgroundSelectedColor,
    required this.blackColor,
    required this.iconsColor,
    required this.iconsWhiteColor,
    required this.badgeSelectedColor,
    required this.badgeUnselectedColor,
    required this.titleColor,
    required this.onlineColor,
    required this.profileSkilltextColor,
    required this.profileIconsAvaliableColor,
    required this.profileIconsUnvaliableColor,
    required this.skillColor,
  });

 

  @override
  ThemeExtension<ColorsTheme> copyWith() {
    throw UnimplementedError();
  }

  @override
  ThemeExtension<ColorsTheme> lerp(
      ThemeExtension<ColorsTheme>? other, double t,) {
    throw UnimplementedError();
  }
}
