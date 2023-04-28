import 'package:flutter/material.dart';

import '../../themes/extensions/text_style_theme.dart';

class ProfileSkillsWidget extends StatelessWidget {
  final Color colors;
  final String text;
  final EdgeInsetsGeometry? padding;
  final double? borderRadius;

  const ProfileSkillsWidget({
    Key? key,
    required this.text,
    required this.colors,
    this.padding,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyleTheme = Theme.of(context).extension<TextStyleTheme>()!;
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          padding: padding ??
              EdgeInsets.symmetric(
                horizontal: constraints.maxWidth * 0.032,
                vertical: constraints.maxWidth * 0.021,
              ),
          decoration: BoxDecoration(
            color: colors,
            borderRadius: BorderRadius.circular(
              borderRadius ?? constraints.maxWidth * 0.026,
            ),
          ),
          child: Text(
            text,
            style: textStyleTheme.profileSkillStyle,
          ),
        );
      },
    );
  }
}
