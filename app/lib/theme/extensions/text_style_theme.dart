import 'package:flutter/material.dart';

class TextStyleTheme extends ThemeExtension<TextStyleTheme> {
  final TextStyle badgeWidgetStyle;
  final TextStyle chatFilterButtonSelectedStyle;
  final TextStyle chatFilterButtonStyle;
  final TextStyle listTileNumberStyle;
  final TextStyle listTileMessageStyle;
  final TextStyle listTilehourStyle;
  final TextStyle nameSmallStyle;
  final TextStyle nameMediumStyle;
  final TextStyle nameBigStyle;
  final TextStyle searchStyle;
  final TextStyle profileContainerInfoNumberStyle;
  final TextStyle profileContainerInfoDescriptionStyle;
  final TextStyle profileSkillStyle;
  final TextStyle todoTitleStyle;
  final TextStyle todoDescriptionStyle;
  final TextStyle expansionTitleStyle;
 

  TextStyleTheme({
    required this.badgeWidgetStyle,
    required this.chatFilterButtonSelectedStyle,
    required this.chatFilterButtonStyle,
    required this.listTileNumberStyle,
    required this.listTileMessageStyle,
    required this.listTilehourStyle,
    required this.nameSmallStyle,
    required this.nameMediumStyle,
    required this.nameBigStyle,
    required this.searchStyle,
    required this.profileContainerInfoNumberStyle,
    required this.profileContainerInfoDescriptionStyle,
    required this.profileSkillStyle,
    required this.todoTitleStyle,
    required this.todoDescriptionStyle,
    required this.expansionTitleStyle,
   

  });

  @override
  ThemeExtension<TextStyleTheme> copyWith() {
    throw UnimplementedError();
  }

  @override
  ThemeExtension<TextStyleTheme> lerp(
    ThemeExtension<TextStyleTheme>? other,
    double t,
  ) {
    throw UnimplementedError();
  }
}
