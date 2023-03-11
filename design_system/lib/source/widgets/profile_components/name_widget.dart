import 'package:flutter/material.dart';
import '../../themes/extensions/colors_theme.dart';
import '../../themes/extensions/text_style_theme.dart';

class NameWidget extends StatelessWidget {
  final double? textSize;
  final String name;
  final bool isOnline;
  final double? statusWidth;
  final double? statusHeight;

  const NameWidget({
    Key? key,
    this.textSize,
    required this.name,
    required this.isOnline,
   this.statusWidth,
   this.statusHeight,


  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorsTheme = Theme.of(context).extension<ColorsTheme>()!;
    final textStyleTheme = Theme.of(context).extension<TextStyleTheme>()!;
    return LayoutBuilder(builder: (context, constraints) {
      return Row(
        children: [
          RichText(
            text: TextSpan(
              text: name,
              style: TextStyle(
                fontSize: textSize ?? textStyleTheme.nameMediumStyle.fontSize,
              ),
            ),
          ),
          const SizedBox(width: 6),
          if (isOnline)
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Container(
                width: statusWidth ,
                height: statusHeight, 
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: colorsTheme.onlineColor,
                ),
              ),
            )
          else
            Container()
        ],
      );
    },);
  }
}
