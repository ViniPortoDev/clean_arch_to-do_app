import 'package:flutter/material.dart';
import '../../themes/extensions/colors_theme.dart';
import '../../themes/extensions/text_style_theme.dart';

class BadgeWidget extends StatelessWidget {
  final bool isSelected;
  final String numberMessage;
  final double? width;
  final double? height;
  const BadgeWidget({
    Key? key,
    required this.numberMessage,
    required this.isSelected,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorsTheme = Theme.of(context).extension<ColorsTheme>()!;
    final textStyleTheme = Theme.of(context).extension<TextStyleTheme>()!;

    return Container(
      width: width,
      height: height,
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
  }
}
