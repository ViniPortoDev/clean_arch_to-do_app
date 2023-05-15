import 'package:flutter/material.dart';
import '../utils/hex_dark_colors.dart';
import '../utils/hex_light_colors.dart';
import 'extensions/colors_theme.dart';
import 'extensions/text_style_theme.dart';

class Mytheme {
  // tema branco

  static ThemeData customLightTheme = ThemeData.light().copyWith(
    brightness: Brightness.light,
    extensions: <ThemeExtension<dynamic>>[
      // cores do app
      ColorsTheme(
        backgroundColor: HexLightColors.darkGrey,
        backgroundChatColor: HexLightColors.backgroundChatColor,
        primaryColor: HexLightColors.primaryGrey,
        secundaryColor: HexLightColors.secundaryDarkGrey,
        terciaryColor: HexLightColors.pink,
        backgroundLateralMenuColor: HexLightColors.backgroundChatColor,
        textBadgeSelectedColor: HexLightColors.lightPink,
        backgroundInfoColor: HexLightColors.black,
        backgroundSelectedColor: HexLightColors.pink,
        badgeSelectedColor: HexLightColors.selectedPurple,
        badgeUnselectedColor: HexLightColors.unselectedDarkGrey,
        iconsWhiteColor: HexLightColors.lightPink,
        iconsColor: HexLightColors.black,
        blackAndWhiteColor: HexLightColors.black,
        profileSkilltextColor: HexLightColors.backgroundChatColor,
        onlineColor: HexLightColors.greenLemon,
        terciaryGrey: HexLightColors.pink,
        profileIconsAvaliableColor: HexLightColors.pink,
        profileIconsUnvaliableColor: HexLightColors.profileUnvaliablePurple,
        switchActivateColor: HexLightColors.switchActivateColor,
        inactiveSwitchActivateColor: HexLightColors.inactiveSwitchActivateColor,
        blackColor: HexLightColors.black,
        titleColor: HexLightColors.black,
        skillColor: const [
          HexLightColors.skillsRandomColors1,
          HexLightColors.skillsRandomColors2,
          HexLightColors.skillsRandomColors3,
          HexLightColors.skillsRandomColors4,
          HexLightColors.skillsRandomColors5,
        ],
      ),
      // estilos em geral do app
      TextStyleTheme(
        badgeWidgetStyle: const TextStyle(
          fontSize: 12,
          color: HexDarkColors.lightPink,
        ),
        chatFilterButtonSelectedStyle: const TextStyle(
          fontSize: 16,
          color: HexDarkColors.black,
        ),
        chatFilterButtonStyle: const TextStyle(
          fontSize: 16,
          color: HexDarkColors.black,
        ),
        listTileNumberStyle: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 14,
          color: HexDarkColors.primaryGrey,
        ),
        listTileMessageStyle: const TextStyle(
          fontSize: 16,
          color: HexDarkColors.primaryGrey,
        ),
        listTilehourStyle: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 12,
          color: HexDarkColors.primaryGrey,
        ),
        listTileDescription: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 12,
          color: HexDarkColors.primaryGrey,
        ),
        nameAppbarStyle: const TextStyle(
          fontSize: 14,
        ),
        nameSmallStyle: const TextStyle(
          fontSize: 16,
        ),
        nameMediumStyle: const TextStyle(
          fontSize: 18,
          color: HexLightColors.black,
        ),
        nameBigStyle: const TextStyle(
          fontSize: 20,
        ),
        menuButtonStyle: const TextStyle(
          fontSize: 16,
          color: HexDarkColors.black,
        ),
        menuButtonSelectedStyle: const TextStyle(
          fontSize: 16,
          color: HexDarkColors.pink,
        ),
        searchStyle: const TextStyle(
          fontSize: 16,
          color: HexDarkColors.black,
        ),
        profileContainerInfoNumberStyle: const TextStyle(
          fontSize: 16,
          color: HexDarkColors.white,
        ),
        profileContainerInfoDescriptionStyle: const TextStyle(
          fontSize: 16,
          color: HexDarkColors.white,
        ),
        profileSkillStyle: const TextStyle(
          color: HexDarkColors.white,
          fontSize: 16,
        ),
        todoTitleStyle: const TextStyle(
          fontSize: 18,
          color: HexLightColors.black,
        ),
        todoDescriptionStyle: const TextStyle(
          fontSize: 16,
          color: HexDarkColors.primaryGrey,
        ),
        expansionTitleStyle: const TextStyle(
          fontSize: 18,
          color: HexDarkColors.black,
        ),
      )
    ],
  );

  // tema escuro

  static ThemeData customDarkTheme = ThemeData.dark().copyWith(
    extensions: <ThemeExtension<dynamic>>[
      // cores do app
      ColorsTheme(
        backgroundColor: HexDarkColors.darkGrey,
        backgroundChatColor: HexDarkColors.backgroundChatColor,
        primaryColor: HexDarkColors.primaryGrey,
        secundaryColor: HexDarkColors.secundaryDarkGrey,
        terciaryColor: HexDarkColors.rosyPurple,
        backgroundLateralMenuColor: HexLightColors.black,
        textBadgeSelectedColor: HexDarkColors.lightPink,
        backgroundInfoColor: HexDarkColors.purple,
        backgroundSelectedColor: HexDarkColors.amber,
        badgeSelectedColor: HexDarkColors.selectedPurple,
        badgeUnselectedColor: HexDarkColors.unselectedDarkGrey,
        iconsWhiteColor: HexDarkColors.white,
        iconsColor: HexDarkColors.primaryGrey,
        profileSkilltextColor: HexDarkColors.pink,
        onlineColor: HexDarkColors.greenLemon,
        blackAndWhiteColor: HexLightColors.white,
        terciaryGrey: HexDarkColors.terciaryGrey,
        profileIconsAvaliableColor: HexDarkColors.profileAvaliablePurple,
        profileIconsUnvaliableColor: HexDarkColors.profileUnvaliablePurple,
        switchActivateColor: HexDarkColors.switchActivateColor,
        inactiveSwitchActivateColor: HexDarkColors.inactiveSwitchActivateColor,
        blackColor: HexDarkColors.black,
        titleColor: HexDarkColors.white,
        skillColor: const [
          HexDarkColors.skillsRandomColors1,
          HexDarkColors.skillsRandomColors2,
          HexDarkColors.skillsRandomColors3,
          HexDarkColors.skillsRandomColors4,
          HexDarkColors.skillsRandomColors5,
        ],
      ),
      // estilos em geral do app
      TextStyleTheme(
        badgeWidgetStyle: const TextStyle(
          fontSize: 12,
          color: HexDarkColors.lightPink,
        ),
        chatFilterButtonSelectedStyle: const TextStyle(
          fontSize: 16,
          color: HexDarkColors.black,
        ),
        chatFilterButtonStyle: const TextStyle(
          fontSize: 16,
          color: HexDarkColors.primaryGrey,
        ),
        listTileNumberStyle: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 14,
          color: HexDarkColors.primaryGrey,
        ),
        listTileMessageStyle: const TextStyle(
          fontSize: 16,
          color: HexDarkColors.primaryGrey,
        ),
        listTilehourStyle: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 12,
          color: HexDarkColors.primaryGrey,
        ),
        listTileDescription: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 12,
          color: HexDarkColors.primaryGrey,
        ),
        nameAppbarStyle:
            const TextStyle(fontSize: 14, color: HexLightColors.white),
        nameSmallStyle: const TextStyle(
          fontSize: 16,
        ),
        nameMediumStyle: const TextStyle(
          fontSize: 18,
        ),
        nameBigStyle: const TextStyle(
          fontSize: 20,
        ),
        menuButtonStyle: const TextStyle(
          fontSize: 16,
          color: HexDarkColors.primaryGrey,
        ),
        menuButtonSelectedStyle: const TextStyle(
          fontSize: 16,
          color: HexDarkColors.amber,
        ),
        searchStyle: const TextStyle(
          fontSize: 16,
          color: HexDarkColors.primaryGrey,
        ),
        profileContainerInfoNumberStyle: const TextStyle(
          fontSize: 16,
          color: HexDarkColors.pink,
        ),
        profileContainerInfoDescriptionStyle: const TextStyle(
          fontSize: 16,
          color: HexDarkColors.pink,
        ),
        profileSkillStyle: const TextStyle(
          color: HexDarkColors.pink,
          fontSize: 16,
        ),
        todoTitleStyle: const TextStyle(
          fontSize: 18,
          color: HexLightColors.white,
        ),
        todoDescriptionStyle: const TextStyle(
          fontSize: 16,
          color: HexDarkColors.primaryGrey,
        ),
        expansionTitleStyle: const TextStyle(
          fontSize: 18,
          color: HexDarkColors.primaryGrey,
        ),
      )
    ],
  );
}
