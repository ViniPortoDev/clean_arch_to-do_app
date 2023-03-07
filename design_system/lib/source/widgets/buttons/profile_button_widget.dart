import 'package:flutter/material.dart';

import '../../themes/extensions/colors_theme.dart';

class ProfileButtonWidget extends StatelessWidget {
  final bool avaliable;
  final IconData icon;
  final double? iconSize;

  final double? height;
  final double? width;
  final double? borderRadius;

  const ProfileButtonWidget({
    Key? key,
    required this.icon,
    required this.avaliable,
    this.iconSize,

    this.height,
    this.width,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorsTheme = Theme.of(context).extension<ColorsTheme>()!;

    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        height: height ?? constraints.maxWidth * 0.16,
        width: width ?? constraints.maxWidth * 0.16,
        decoration: BoxDecoration(
          color: avaliable
              ? colorsTheme.profileIconsAvaliableColor
              : colorsTheme.profileIconsUnvaliableColor,
          borderRadius: BorderRadius.circular(
            borderRadius ?? constraints.maxWidth * 0.053,
          ),
        ),
        child: Icon(
          icon,
          size: iconSize ?? constraints.maxWidth * 0.096,
          color: avaliable
              ? colorsTheme.iconsWhiteColor
              : colorsTheme.profileSkilltextColor,
        ),
      );
    });
  }
}
