import 'package:design_system/design_system.dart';
import 'package:design_system/source/themes/extensions/colors_theme.dart';
import 'package:design_system/source/themes/extensions/text_style_theme.dart';
import 'package:design_system/source/widgets/buttons/selected_button_widget.dart';
import 'package:flutter/material.dart';

class LateralButtonWidget extends StatelessWidget {
  final IconData icon;
  final String filterTypeTextChat;

  final bool isSelected;
  final double? selectedWidth;
  final double? selectedButtonBorderRadius;
  final double? unselectedButtonWidth;
  final double? selectedButtonHeight;

  final String? messages;

  const LateralButtonWidget({
    Key? key,
    required this.icon,
    required this.filterTypeTextChat,
    required this.isSelected,
    this.selectedWidth,
    this.selectedButtonHeight,
    this.selectedButtonBorderRadius,
    this.unselectedButtonWidth,
    this.messages,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorsTheme = Theme.of(context).extension<ColorsTheme>()!;
    final textStyleTheme = Theme.of(context).extension<TextStyleTheme>()!;

    return isSelected
        ? SelectedButtonWidget(
            width: selectedWidth,
            height: selectedButtonHeight,
            borderRadius: selectedButtonBorderRadius,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      icon,
                      color: colorsTheme.blackColor,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      filterTypeTextChat,
                      style: textStyleTheme.chatFilterButtonSelectedStyle,
                    ),
                  ],
                ),
                Text(
                  messages ?? '',
                  style: textStyleTheme.chatFilterButtonSelectedStyle,
                ),
              ],
            ),
          )
        : LayoutBuilder(
            builder: (context, constraints) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                width: unselectedButtonWidth,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          icon,
                          color: colorsTheme.iconsColor,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          filterTypeTextChat,
                          style: textStyleTheme.chatFilterButtonStyle,
                        ),
                      ],
                    ),
                    Text(
                      messages ?? '',
                      style: textStyleTheme.chatFilterButtonStyle,
                    ),
                  ],
                ),
              );
            },
          );
  }
}
