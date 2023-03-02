import 'package:flutter/material.dart';
import '../../themes/extensions/colors_theme.dart';


class SelectedButtonWidget extends StatelessWidget {
  final double? padding;
  final double? width;
  final Widget child;
  const SelectedButtonWidget(
      {Key? key, required this.child, this.width, this.padding,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final colorsTheme = Theme.of(context).extension<ColorsTheme>()!;

    return Container(
      width: width,
      padding: EdgeInsets.all(padding ?? size.width * 0.032),
      decoration: BoxDecoration(
        color: colorsTheme.backgroundSelectedColor,
        borderRadius: BorderRadius.circular(14),
      ),
      child: child,
    );
  }
}
