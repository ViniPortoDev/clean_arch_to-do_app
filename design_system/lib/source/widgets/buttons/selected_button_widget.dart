import 'package:flutter/material.dart';
import '../../themes/extensions/colors_theme.dart';

class SelectedButtonWidget extends StatelessWidget {
  final double? padding;
  final double? width;
  final double? height;

  final double? borderRadius;
  final Widget child;
  const SelectedButtonWidget({
    Key? key,
    required this.child,
    this.width,
    this.height,
    this.padding,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorsTheme = Theme.of(context).extension<ColorsTheme>()!;

    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.all(padding ?? 12),
      decoration: BoxDecoration(
        color: colorsTheme.backgroundSelectedColor,
        borderRadius: BorderRadius.circular(
          borderRadius ?? 8,
        ),
      ),
      child: child,
    );
  }
}
