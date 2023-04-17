import 'package:flutter/material.dart';
import '../../themes/extensions/colors_theme.dart';
import '../../themes/extensions/text_style_theme.dart';

class MenuButtonsWidget extends StatelessWidget {
  final double? height;
  final double? width;
  final bool isSelected;
  final IconData iconData;
  final String title;
  const MenuButtonsWidget({
    Key? key,
    this.height = 80,
    this.width,
    required this.isSelected,
    required this.iconData,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorsTheme = Theme.of(context).extension<ColorsTheme>()!;
    final textStyleTheme = Theme.of(context).extension<TextStyleTheme>()!;
    return SizedBox(
      height: height ?? 80,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (isSelected)
                Container(
                  height: 6,
                  width: 100,
                  decoration: BoxDecoration(
                    color: colorsTheme.backgroundSelectedColor,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                ),
              SizedBox(
                height: height! - 6,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      iconData,
                      color: isSelected
                          ? colorsTheme.backgroundSelectedColor
                          : colorsTheme.iconsColor,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      title,
                      style: isSelected
                          ? textStyleTheme.menuButtonSelectedStyle
                          : textStyleTheme.menuButtonStyle,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );

    // SizedBox(
    //   height: height,
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //     children: [
    //       Container(
    //         height: 6,
    //         width: double.infinity,
    //         decoration: BoxDecoration(
    //           color: isSelected ? colorsTheme.backgroundSelectedColor : null,
    //           borderRadius: const BorderRadius.only(
    //             bottomLeft: Radius.circular(20),
    //             bottomRight: Radius.circular(20),
    //           ),
    //         ),
    //       ),
    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           Icon(
    //             iconData,
    //             color: isSelected
    //                 ? colorsTheme.backgroundSelectedColor
    //                 : colorsTheme.iconsColor,
    //           ),
    //           const SizedBox(width: 6),
    //           Text(
    //             title,
    //             style: isSelected
    //                 ? textStyleTheme.menuButtonSelectedStyle
    //                 : textStyleTheme.menuButtonStyle,
    //           ),
    //         ],
    //       ),
    //     ],
    //   ),
    // );
  }
}
