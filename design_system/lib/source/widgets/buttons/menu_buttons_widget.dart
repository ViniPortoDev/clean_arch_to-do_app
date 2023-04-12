import 'package:flutter/material.dart';

import '../../themes/extensions/colors_theme.dart';
import '../../themes/extensions/text_style_theme.dart';

class MenuButtonsWidget extends StatelessWidget {
  final double? height;
  final double? width;

  final bool isSelected;
  final IconData iconData;
  final String title;
  const MenuButtonsWidget({
    Key? key,
    this.height,
    this.width,
    required this.isSelected,
    required this.iconData,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorsTheme = Theme.of(context).extension<ColorsTheme>()!;
    final textStyleTheme = Theme.of(context).extension<TextStyleTheme>()!;
    return LayoutBuilder(
      builder: (context, constraints) => SizedBox(
        height: height,
        width: width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              color: isSelected
                  ? colorsTheme.backgroundSelectedColor
                  : colorsTheme.iconsColor,
            ),
            SizedBox(width: constraints.maxHeight * 0.024),
            Text(
              title,
              style: isSelected
                  ? textStyleTheme.menuButtonSelectedStyle
                  : textStyleTheme.menuButtonStyle,
            ),
          ],
        ),
      ),
    );
  }
}
