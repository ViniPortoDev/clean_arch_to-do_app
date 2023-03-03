import 'package:flutter/material.dart';

import '../../themes/extensions/colors_theme.dart';

class ProfileButtonWidget extends StatelessWidget {
  final bool avaliable;
  final IconData icon;

  const ProfileButtonWidget({
    Key? key,
    required this.icon,
    required this.avaliable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorsTheme = Theme.of(context).extension<ColorsTheme>()!;

    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        height: constraints.maxWidth * 0.16,
        width: constraints.maxWidth * 0.16,
        decoration: BoxDecoration(
          color: avaliable
              ? colorsTheme.profileIconsAvaliableColor
              : colorsTheme.profileIconsUnvaliableColor,
          borderRadius: BorderRadius.circular(constraints.maxWidth * 0.053),
        ),
        child: Icon(
          icon,
          size: constraints.maxWidth * 0.096,
          color: avaliable
              ? colorsTheme.iconsWhiteColor
              : colorsTheme.profileSkilltextColor,
        ),
      );
    });
  }
}
