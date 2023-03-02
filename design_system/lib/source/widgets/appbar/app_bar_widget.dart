import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import '../../themes/extensions/colors_theme.dart';
import '../../themes/extensions/text_style_theme.dart';
import '../user/name_widget.dart';

class AppBarWidget extends StatelessWidget implements PreferredSize {
  final String title;
  final String networkImage;
  final double height;

  const AppBarWidget({
    Key? key,
    required this.title,
    required this.networkImage,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorsTheme = Theme.of(context).extension<ColorsTheme>()!;
    final textStyleTheme = Theme.of(context).extension<TextStyleTheme>()!;
    return LayoutBuilder(builder: (context, constraints) {
      return AppBar(
        toolbarHeight: constraints.maxWidth * 0.266,
        backgroundColor: colorsTheme.blackColor,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: constraints.maxWidth * 0.064),
          child: CircleAvatar(
            radius: constraints.maxWidth * 0.037,
            backgroundImage: NetworkImage(networkImage),
          ),
        ),
        title: NameWidget(
          name: title,
          isOnline: false,
          textSize: textStyleTheme.nameAppbarStyle.fontSize,
        ),
        actions: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: constraints.maxWidth * 0.032,
                  horizontal: constraints.maxWidth * 0.042,
                ),
                decoration: BoxDecoration(
                  color: colorsTheme.terciaryGrey,
                  borderRadius:
                      BorderRadius.circular(constraints.maxWidth * 0.032),
                ),
                child: const Text('Agree to Offer'),
              ),
            ],
          ),
          SizedBox(width: constraints.maxWidth * 0.032),
          const Icon(Icons.calendar_today),
          SizedBox(width: constraints.maxWidth * 0.021),
          const Icon(LineIcons.calculator),
          SizedBox(width: constraints.maxWidth * 0.044),
        ],
      );
    });
  }

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget get child => throw UnimplementedError();
}
