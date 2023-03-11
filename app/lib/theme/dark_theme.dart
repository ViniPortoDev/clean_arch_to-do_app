import 'package:app/utils/hex_colors.dart';
import 'package:flutter/material.dart';
import 'extensions/colors_theme.dart';
import 'extensions/text_style_theme.dart';

ThemeData getDarkTheme() {
  final colorsTheme = ColorsTheme(
    backgroundColor: HexColors.darkGrey,
    primaryColor: HexColors.primaryGrey,
    secundaryColor: HexColors.secundaryDarkGrey,
    terciaryColor: HexColors.rosyPurple,
    textBadgeSelectedColor: HexColors.lightPink,
    backgroundInfoColor: HexColors.purple,
    backgroundSelectedColor: HexColors.amber,
    badgeSelectedColor: HexColors.selectedPurple,
    badgeUnselectedColor: HexColors.unselectedDarkGrey,
    iconsWhiteColor: HexColors.white,
    iconsColor: HexColors.grey,
    profileSkilltextColor: HexColors.pink,
    onlineColor: HexColors.greenLemon,
    profileIconsAvaliableColor: HexColors.profileAvaliablePurple,
    profileIconsUnvaliableColor: HexColors.profileUnvaliablePurple,
    blackColor: HexColors.black,
    titleColor: HexColors.white,
    skillColor: const [
      HexColors.skillsRandomColors1,
      HexColors.skillsRandomColors2,
      HexColors.skillsRandomColors3,
      HexColors.skillsRandomColors4,
      HexColors.skillsRandomColors5,
    ],
  );
  return ThemeData(
    brightness: Brightness.dark,

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      actionsIconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),

    fontFamily: 'Roboto',

    extensions: <ThemeExtension<dynamic>>[
      colorsTheme,
      TextStyleTheme(
        badgeWidgetStyle: TextStyle(
          fontSize: 16,
          color: colorsTheme.textBadgeSelectedColor,
        ),
        chatFilterButtonSelectedStyle: TextStyle(
          fontSize: 20,
          color: colorsTheme.blackColor,
        ),
        chatFilterButtonStyle: TextStyle(
          fontSize: 20,
          color: colorsTheme.primaryColor,
        ),
        listTileNumberStyle: TextStyle(
          fontSize: 16,
          color: colorsTheme.primaryColor,
        ),
        listTileMessageStyle: TextStyle(
          fontSize: 18,
          color: colorsTheme.primaryColor,
        ),
        listTilehourStyle: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: colorsTheme.primaryColor,
        ),
        nameSmallStyle: const TextStyle(
          fontSize: 18,
        ),
        nameMediumStyle: const TextStyle(
          fontSize: 20,
        ),
        nameBigStyle: const TextStyle(
          fontSize: 24,
        ),
        searchStyle: TextStyle(
          fontSize: 20,
          color: colorsTheme.primaryColor,
        ),
        profileContainerInfoNumberStyle: TextStyle(
          fontSize: 20,
          color: colorsTheme.profileSkilltextColor,
        ),
        profileContainerInfoDescriptionStyle: TextStyle(
          fontSize: 18,
          color: colorsTheme.profileSkilltextColor,
        ),
        profileSkillStyle: TextStyle(
          color: colorsTheme.profileSkilltextColor,
          fontSize: 18,
        ),
        todoTitleStyle: const TextStyle(
          fontSize: 20,
        ),
        todoDescriptionStyle: TextStyle(
          fontSize: 18,
          color: colorsTheme.primaryColor,
        ),
        expansionTitleStyle: TextStyle(
          fontSize: 18,
          color: colorsTheme.primaryColor,
        ),
      )
    ],
    //Text
    // textTheme: TextTheme(
    //   titleMedium: GoogleFonts.roboto(
    //     textStyle: const TextStyle(
    //         color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18),
    //   ),
    //   titleSmall: GoogleFonts.roboto(
    //     textStyle: const TextStyle(
    //         color: Colors.white, fontWeight: FontWeight.w500, fontSize: 18),
    //   ),
    //   bodyLarge: GoogleFonts.roboto(
    //     textStyle: const TextStyle(
    //         color: Color(0xff9FA1A5),
    //         fontWeight: FontWeight.w500,
    //         fontSize: 18),
    //   ),
    //   bodyMedium: GoogleFonts.roboto(
    //     textStyle: const TextStyle(
    //         color: Color(0xff9FA1A5),
    //         fontWeight: FontWeight.w500,
    //         fontSize: 16),
    //   ),
    //   bodySmall: GoogleFonts.roboto(
    //     textStyle: const TextStyle(
    //         color: Color(0xff9FA1A5),
    //         fontWeight: FontWeight.w500,
    //         fontSize: 14),
    //   ),
    //   caption: GoogleFonts.roboto(
    //     textStyle: const TextStyle(
    //         color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12),
    //   ),
    // ),
  );
}
