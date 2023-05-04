import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

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
    final thumbIcon = MaterialStateProperty.resolveWith<Icon?>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return const Icon(
            Icons.dark_mode_outlined,
            color: HexDarkColors.white,
          );
        }
        return const Icon(
          Icons.light_mode_outlined,
          color: HexDarkColors.black,
        );
      },
    );
    final thumbColor = MaterialStateProperty.resolveWith<Color?>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return colorsTheme.switchActivateColor;
        }
        return colorsTheme.inactiveSwitchActivateColor;
      },
    );
    final trackColor = MaterialStateProperty.resolveWith<Color?>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return Colors.transparent;
        }
        return Colors.transparent;
      },
    );

    return Builder(
      builder: (context) {
        return Theme(
          data: ThemeData(useMaterial3: true),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 53,
                height: 33,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2.5,
                    color: value == true
                        ? colorsTheme.switchActivateColor
                        : colorsTheme.inactiveSwitchActivateColor,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Switch(
                  value: value,
                  trackColor: trackColor,
                  onChanged: onChanged,
                  activeColor: colorsTheme.backgroundColor,
                  inactiveTrackColor: colorsTheme.backgroundColor,
                  thumbColor: thumbColor,
                  thumbIcon: thumbIcon,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
