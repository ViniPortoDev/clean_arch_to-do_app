import 'package:design_system/source/widgets/buttons/selected_button_widget.dart';
import 'package:flutter/material.dart';
import '../../themes/extensions/colors_theme.dart';
import '../../themes/extensions/text_style_theme.dart';
import '../badge/badge_widget.dart';

class ChatFilterButtonWidget extends StatelessWidget {
  final IconData icon;
  final String filterTypeTextChat;
  final String numberMessage;
  final bool isSelected;
  const ChatFilterButtonWidget({
    Key? key,
    required this.icon,
    required this.filterTypeTextChat,
    required this.numberMessage,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorsTheme = Theme.of(context).extension<ColorsTheme>()!;
    final textStyleTheme = Theme.of(context).extension<TextStyleTheme>()!;

    return isSelected
        ? LayoutBuilder(builder: (context, constraints) {
            return Padding(
              padding: EdgeInsets.only(right: constraints.maxWidth * 0.042),
              child: SelectedButtonWidget(
                width: constraints.maxWidth * 0.33,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      icon,
                      color: colorsTheme.blackColor,
                      size: constraints.maxWidth * 0.069,
                    ),
                    SizedBox(width: constraints.maxWidth * 0.032),
                    Text(
                      filterTypeTextChat,
                      style: textStyleTheme.chatFilterButtonSelectedStyle,
                    ),
                    SizedBox(width: constraints.maxWidth * 0.014),
                    BadgeWidget(
                      numberMessage: numberMessage,
                      isSelected: isSelected,
                      height: constraints.maxWidth * 0.064,
                      width: constraints.maxWidth * 0.064,
                    )
                  ],
                ),
              ),
            );
          },)
        : LayoutBuilder(builder: (context, constraints) {
            return Padding(
              padding: EdgeInsets.only(right: constraints.maxWidth * 0.042),
              child: SizedBox(
                width: constraints.maxWidth * 0.4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      icon,
                      color: colorsTheme.iconsColor,
                      size: constraints.maxWidth * 0.069,
                    ),
                    SizedBox(width: constraints.maxWidth * 0.026),
                    Text(
                      filterTypeTextChat,
                      style: textStyleTheme.chatFilterButtonStyle,
                    ),
                    SizedBox(width: constraints.maxWidth * 0.016),
                    BadgeWidget(
                      numberMessage: numberMessage,
                      isSelected: isSelected,
                      height: constraints.maxWidth * 0.064,
                      width: constraints.maxWidth * 0.064,
                    )
                  ],
                ),
              ),
            );
          },);
  }
}
