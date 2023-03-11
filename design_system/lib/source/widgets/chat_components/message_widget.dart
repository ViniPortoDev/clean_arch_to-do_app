import 'package:flutter/material.dart';
import '../../themes/extensions/colors_theme.dart';
import '../../themes/extensions/text_style_theme.dart';

class MessageWidget extends StatelessWidget {
  final String message;
  final bool myMessage;
  final double? paddingHorizontal;
  final double? paddingVertical;
  final double? borderRadius;
  final double? messageSpacing;

  const MessageWidget({
    Key? key,
    required this.myMessage,
    required this.message,
    this.paddingHorizontal,
    this.paddingVertical,
    this.borderRadius,
    this.messageSpacing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorsTheme = Theme.of(context).extension<ColorsTheme>()!;
    final textStyleTheme = Theme.of(context).extension<TextStyleTheme>()!;
    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: paddingHorizontal ?? constraints.maxWidth * 0.042,
              vertical: paddingVertical ?? constraints.maxWidth * 0.058,
            ),
            decoration: BoxDecoration(
              color: myMessage
                  ? colorsTheme.terciaryColor
                  : colorsTheme.secundaryColor,
              borderRadius: myMessage
                  ? BorderRadius.only(
                      bottomLeft: Radius.circular(
                        borderRadius ?? constraints.maxWidth * 0.048,
                      ),
                      topLeft: Radius.circular(
                        borderRadius ?? constraints.maxWidth * 0.048,
                      ),
                      topRight: Radius.circular(
                        borderRadius ?? constraints.maxWidth * 0.048,
                      ),
                    )
                  : BorderRadius.only(
                      bottomLeft: Radius.circular(
                        borderRadius ?? constraints.maxWidth * 0.048,
                      ),
                      bottomRight: Radius.circular(
                        borderRadius ?? constraints.maxWidth * 0.048,
                      ),
                      topRight: Radius.circular(
                        borderRadius ?? constraints.maxWidth * 0.048,
                      ),
                    ),
            ),
            child: Text(message, style: textStyleTheme.nameSmallStyle),
          ),
          SizedBox(height: messageSpacing ?? 0),
        ],
      );
    },);
  }
}
