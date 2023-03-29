import 'package:flutter/material.dart';
import '../utils/hex_colors.dart';
import 'extensions/colors_theme.dart';
import 'extensions/text_style_theme.dart';

class Mytheme {
  static ThemeData myTheme = ThemeData.dark().copyWith(
    extensions: <ThemeExtension<dynamic>>[
      // cores do app
      ColorsTheme(
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
        iconsColor: HexColors.primaryGrey,
        profileSkilltextColor: HexColors.pink,
        onlineColor: HexColors.greenLemon,
        terciaryGrey: HexColors.terciaryGrey,
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
      ),
      // estilos em geral do app
      TextStyleTheme(
        badgeWidgetStyle: const TextStyle(
          fontSize: 12,
          color: HexColors.lightPink,
        ),
        chatFilterButtonSelectedStyle: const TextStyle(
          fontSize: 16,
          color: HexColors.black,
        ),
        chatFilterButtonStyle: const TextStyle(
          fontSize: 16,
          color: HexColors.primaryGrey,
        ),
        listTileNumberStyle: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 14,
          color: HexColors.primaryGrey,
        ),
        listTileMessageStyle: const TextStyle(
          fontSize: 16,
          color: HexColors.primaryGrey,
        ),
        listTilehourStyle: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 12,
          color: HexColors.primaryGrey,
        ),
        nameAppbarStyle: const TextStyle(
          fontSize: 14,
        ),
        nameSmallStyle: const TextStyle(
          fontSize: 16,
        ),
        nameMediumStyle: const TextStyle(
          fontSize: 18,
        ),
        nameBigStyle: const TextStyle(
          fontSize: 20,
        ),
        searchStyle: const TextStyle(
          fontSize: 16,
          color: HexColors.grey,
        ),
        profileContainerInfoNumberStyle: const TextStyle(
          fontSize: 16,
          color: HexColors.pink,
        ),
        profileContainerInfoDescriptionStyle: const TextStyle(
          fontSize: 16,
          color: HexColors.pink,
        ),
        profileSkillStyle: const TextStyle(
          color: HexColors.pink,
          fontSize: 16,
        ),
        todoTitleStyle: const TextStyle(
          fontSize: 18,
        ),
        todoDescriptionStyle: const TextStyle(
          fontSize: 16,
          color: HexColors.primaryGrey,
        ),
        expansionTitleStyle: const TextStyle(
          fontSize: 18,
          color: HexColors.primaryGrey,
        ),
      )
    ],
  );
}
