import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../themes/extensions/colors_theme.dart';

class CustomSwitchWidget extends StatelessWidget {
  final bool value;
  final void Function(bool) onChanged;
  final double width;
  const CustomSwitchWidget({
    Key? key,
    required this.value,
    required this.onChanged,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorsTheme = Theme.of(context).extension<ColorsTheme>()!;

    return CupertinoSwitch(
      activeColor: colorsTheme.profileIconsAvaliableColor,
      trackColor: colorsTheme.backgroundSelectedColor,
      value: value,
      onChanged: onChanged,
    );
  }
}
