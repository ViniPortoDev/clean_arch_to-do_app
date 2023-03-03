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

    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        width: width,
        height: height,
        padding: EdgeInsets.all(padding ?? constraints.maxWidth * 0.032),
        decoration: BoxDecoration(
          color: colorsTheme.backgroundSelectedColor,
          borderRadius: BorderRadius.circular(
            borderRadius ?? constraints.maxWidth * 0.037,
          ),
        ),
        child: child,
      );
    });
  }
}
