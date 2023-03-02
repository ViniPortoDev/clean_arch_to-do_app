import 'package:flutter/material.dart';
import '../../themes/extensions/colors_theme.dart';
import '../../themes/extensions/text_style_theme.dart';

class SearchWidget extends StatelessWidget {
  // final double height;
  // final double width;
  final String? hintText;
  final Widget? prefixIcon;

  const SearchWidget({
    Key? key,
    // required this.height,
    // required this.width,
    this.hintText,
    this.prefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
 
    final colorsTheme = Theme.of(context).extension<ColorsTheme>()!;
    final textStyleTheme = Theme.of(context).extension<TextStyleTheme>()!;

    return LayoutBuilder(
      builder: (p0, constraints) => Container(
        padding: const EdgeInsets.only(left: 18),
        width: constraints.maxWidth * 0.906,
        height: constraints.maxWidth * 0.16,
        decoration: BoxDecoration(
          color: colorsTheme.secundaryColor,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Center(
          child: TextField(
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: textStyleTheme.searchStyle,
              prefixIcon: prefixIcon,
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}
