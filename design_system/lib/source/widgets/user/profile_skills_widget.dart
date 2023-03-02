import 'package:flutter/material.dart';

import '../../themes/extensions/text_style_theme.dart';

class ProfileSkillsWidget extends StatelessWidget {
  final Color colors;
  final String text;
  const ProfileSkillsWidget({
    Key? key,
    required this.colors,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textStyleTheme = Theme.of(context).extension<TextStyleTheme>()!;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.032,
        vertical: size.width * 0.021,
      ),
      decoration: BoxDecoration(
        color: colors,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          text,
          style: textStyleTheme.profileSkillStyle,
        ),
      ),
    );
  }
}
