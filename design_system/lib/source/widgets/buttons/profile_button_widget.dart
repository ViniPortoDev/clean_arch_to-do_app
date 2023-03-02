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
    final size = MediaQuery.of(context).size;
    final colorsTheme = Theme.of(context).extension<ColorsTheme>()!;

    return Container(
      height: size.width * 0.16,
      width: size.width * 0.16,
      decoration: BoxDecoration(
        color: avaliable
            ? colorsTheme.profileIconsAvaliableColor
            : colorsTheme.profileIconsUnvaliableColor,
        borderRadius: BorderRadius.circular(size.width * 0.053),
      ),
      child: Icon(
        icon,
        size: size.width * 0.096,
        color: avaliable
            ? colorsTheme.iconsWhiteColor
            : colorsTheme.profileSkilltextColor,
      ),
    );
  }
}
