import 'package:flutter/material.dart';
import '../../themes/extensions/colors_theme.dart';
import '../../themes/extensions/text_style_theme.dart';

class BadgeWidget extends StatelessWidget {
  final bool isSelected;
  final String numberMessage;
  const BadgeWidget({
    Key? key,
    required this.numberMessage,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorsTheme = Theme.of(context).extension<ColorsTheme>()!;
    final textStyleTheme = Theme.of(context).extension<TextStyleTheme>()!;

    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        width: constraints.maxWidth * 0.064,
        height: constraints.maxWidth * 0.064,
        decoration: BoxDecoration(
          color: isSelected
              ? colorsTheme.badgeSelectedColor
              : colorsTheme.badgeUnselectedColor,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            numberMessage,
            style: textStyleTheme.badgeWidgetStyle,
          ),
        ),
      );
    });
  }
}
