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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorsTheme = Theme.of(context).extension<ColorsTheme>()!;
    final textStyleTheme = Theme.of(context).extension<TextStyleTheme>()!;

    return isSelected
        ? LayoutBuilder(
            builder: (context, constraints) {
              return Padding(
                padding: EdgeInsets.only(
                  right: padding ?? constraints.maxWidth * 0.042,
                ),
                child: SelectedButtonWidget(
                  borderRadius: selectedButtonBorderRadius,
                  padding: 5,
                  width: selectedWidth ?? constraints.maxWidth * 0.33,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        icon,
                        color: colorsTheme.blackColor,
                        size: iconSize ?? constraints.maxWidth * 0.069,
                      ),
                      SizedBox(width: spacing ?? constraints.maxWidth * 0.032),
                      Text(
                        filterTypeTextChat,
                        style: textStyleTheme.chatFilterButtonSelectedStyle,
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
                ),
              );
            },
          )
        : LayoutBuilder(
            builder: (context, constraints) {
              return Padding(
                padding: EdgeInsets.only(
                  right: padding ?? constraints.maxWidth * 0.042,
                ),
                child: SizedBox(
                  width: unselectedButtonWidth ?? constraints.maxWidth * 0.4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                ),
              );
            },
          );
  }
}
