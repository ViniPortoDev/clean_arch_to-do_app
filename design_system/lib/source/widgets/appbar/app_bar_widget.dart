import 'package:design_system/source/utils/hex_light_colors.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import '../../themes/extensions/colors_theme.dart';
import '../../themes/extensions/text_style_theme.dart';
import '../profile_components/name_widget.dart';

class AppBarWidget extends StatelessWidget implements PreferredSize {
  final String name;
  final double height;
  final String networkImageAvatar;

  const AppBarWidget({
    Key? key,
    required this.name,
    required this.height,
    required this.networkImageAvatar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorsTheme = Theme.of(context).extension<ColorsTheme>()!;
    final textStyleTheme = Theme.of(context).extension<TextStyleTheme>()!;
    return LayoutBuilder(
      builder: (context, constraints) {
        return AppBar(
          toolbarHeight: height,
          backgroundColor: colorsTheme.blackColor,
          elevation: 0,
          leading: Container(
            margin: EdgeInsets.only(left: constraints.maxWidth * 0.074),
            child: CircleAvatar(
              radius: 1,
              backgroundImage: NetworkImage(networkImageAvatar),
            ),
          ),
          title: NameWidget(
            name: name,
            isOnline: false,
          ),
          actions: [
            Container(
              margin:
                  EdgeInsets.symmetric(vertical: constraints.maxWidth * 0.069),
              padding: EdgeInsets.symmetric(
                vertical: constraints.maxWidth * 0.032,
                horizontal: constraints.maxWidth * 0.042,
              ),
              decoration: BoxDecoration(
                color: colorsTheme.terciaryGrey,
                borderRadius:
                    BorderRadius.circular(constraints.maxWidth * 0.032),
              ),
              child: const Text('ZapNey'),
            ),
            SizedBox(width: constraints.maxWidth * 0.032),
            const Icon(Icons.calendar_today),
            SizedBox(width: constraints.maxWidth * 0.032),
            const Icon(LineIcons.calculator),
            SizedBox(width: constraints.maxWidth * 0.044),
          ],
        );
      },
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget get child => throw UnimplementedError();
}
