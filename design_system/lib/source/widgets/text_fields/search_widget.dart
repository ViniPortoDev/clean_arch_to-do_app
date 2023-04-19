import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  final String? hintText;
  final Widget? prefixIcon;

  const SearchWidget({
    Key? key,
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
        width: constraints.maxWidth,
        height: constraints.maxWidth * 0.16,
        decoration: BoxDecoration(
          color: colorsTheme.secundaryColor,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Center(
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search',
              hintStyle: textStyleTheme.searchStyle,
              prefixIcon: Icon(
                Icons.search,
                size: constraints.maxWidth * 0.09,
                color: HexColors.grey,
              ),
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}
