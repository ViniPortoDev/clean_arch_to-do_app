import 'package:app/utils/hex_colors.dart';
import 'package:design_system/source/themes/extensions/colors_theme.dart';
import 'package:design_system/source/themes/extensions/text_style_theme.dart';
import 'package:design_system/source/widgets/profile_components/name_widget.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class AppbarDesktopWidget extends StatelessWidget {
  final String name;
  final String networkImageAvatar;
  final double? height;
  const AppbarDesktopWidget({
    Key? key,
    this.height,
    required this.name,
    required this.networkImageAvatar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textStyleTheme = Theme.of(context).extension<TextStyleTheme>()!;
    final colorsTheme = Theme.of(context).extension<ColorsTheme>()!;

    return Container(
      padding: EdgeInsets.only(left: size.width * 0.015),
      height: height,
      decoration: const BoxDecoration(
        color: HexColors.black,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: 14,
                backgroundImage: NetworkImage(networkImageAvatar),
              ),
              SizedBox(width: size.width * 0.01),
              NameWidget(
                name: name,
                nameColor: HexColors.white,
                isOnline: false,
                textSize: textStyleTheme.nameAppbarStyle.fontSize,
              )
            ],
          ),
          SizedBox(
            width: size.width * 0.173,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 17, vertical: 11),
                  decoration: BoxDecoration(
                    color: colorsTheme.terciaryGrey,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const Text('Agree to Offer'),
                ),
                const Icon(
                  Icons.calendar_today,
                  color: HexColors.white,
                ),
                const Icon(
                  LineIcons.calculator,
                  color: HexColors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
