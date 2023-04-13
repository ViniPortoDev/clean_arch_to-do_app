import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
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

    return LiteRollingSwitch(
      width: width,
      value: value,
      colorOn: colorsTheme.profileIconsAvaliableColor,
      colorOff: colorsTheme.backgroundSelectedColor,
      iconOn: Icons.dark_mode_outlined,
      iconOff: Icons.light_mode_outlined,
      textOff: '',
      textOn: '',
      onChanged: onChanged,
      onDoubleTap: () {},
      onSwipe: () {},
      onTap: () {},
    );
  }
}
