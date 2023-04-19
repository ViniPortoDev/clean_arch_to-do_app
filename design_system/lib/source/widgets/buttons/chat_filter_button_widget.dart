import 'package:design_system/source/themes/extensions/colors_theme.dart';
import 'package:design_system/source/themes/extensions/text_style_theme.dart';
import 'package:design_system/source/widgets/buttons/selected_button_widget.dart';
import 'package:flutter/material.dart';

import '../badge/badge_widget.dart';

class ChatFilterButtonWidget extends StatelessWidget {
  final IconData icon;
  final String filterTypeTextChat;
  final String numberMessage;
  final bool isSelected;
  final double? selectedWidth;
  final double? iconSize;
  final double? spacing;
  final double? padding;
  final double? selectedButtonBorderRadius;
  final double? unselectedButtonWidth;
  final MainAxisAlignment? mainAxisAlignment;

  const ChatFilterButtonWidget({
    Key? key,
    required this.icon,
    required this.filterTypeTextChat,
    required this.numberMessage,
    required this.isSelected,
    this.selectedWidth,
    this.iconSize,
    this.spacing,
    this.padding,
    this.selectedButtonBorderRadius,
    this.unselectedButtonWidth,
    this.mainAxisAlignment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorsTheme = Theme.of(context).extension<ColorsTheme>()!;
    final textStyleTheme = Theme.of(context).extension<TextStyleTheme>()!;

    return isSelected
        ? SelectedButtonWidget(
            borderRadius: selectedButtonBorderRadius,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: colorsTheme.blackColor,
                  size: iconSize,
                ),
                const SizedBox(width: 8),
                Text(
                  filterTypeTextChat,
                  style: textStyleTheme.chatFilterButtonSelectedStyle,
                ),
                const SizedBox(width: 6),
                BadgeWidget(
                  numberMessage: numberMessage,
                  isSelected: isSelected,
                  height: iconSize,
                  width: iconSize,
                )
              ],
            ),
          )
        : LayoutBuilder(
            builder: (context, constraints) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                color: Colors.blue,
                width: unselectedButtonWidth ?? constraints.maxWidth * 0.4,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      icon,
                      color: colorsTheme.iconsColor,
                      size: iconSize ?? constraints.maxWidth * 0.069,
                    ),
                    SizedBox(width: spacing ?? constraints.maxWidth * 0.026),
                    Text(
                      filterTypeTextChat,
                      style: textStyleTheme.chatFilterButtonStyle,
                    ),
                    const SizedBox(width: 6),
                    BadgeWidget(
                      numberMessage: numberMessage,
                      isSelected: isSelected,
                      height: iconSize ?? constraints.maxWidth * 0.064,
                      width: iconSize ?? constraints.maxWidth * 0.064,
                    )
                  ],
                ),
              );
            },
          );
  }
}
