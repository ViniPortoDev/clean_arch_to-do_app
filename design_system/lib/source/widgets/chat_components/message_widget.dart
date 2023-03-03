import 'package:flutter/material.dart';
import '../../themes/extensions/colors_theme.dart';

class MessageWidget extends StatelessWidget {
  final String message;
  final bool myMessage;
  const MessageWidget({
    Key? key,
    required this.myMessage,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorsTheme = Theme.of(context).extension<ColorsTheme>()!;

    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        padding: EdgeInsets.symmetric(
          horizontal: constraints.maxWidth * 0.042,
          vertical: constraints.maxWidth * 0.058,
        ),
        decoration: BoxDecoration(
          color: myMessage
              ? colorsTheme.terciaryColor
              : colorsTheme.secundaryColor,
          borderRadius: myMessage
              ? BorderRadius.only(
                  bottomLeft: Radius.circular(constraints.maxWidth * 0.048),
                  topLeft: Radius.circular(constraints.maxWidth * 0.048),
                  topRight: Radius.circular(constraints.maxWidth * 0.048),
                )
              : BorderRadius.only(
                  bottomLeft: Radius.circular(constraints.maxWidth * 0.048),
                  bottomRight: Radius.circular(constraints.maxWidth * 0.048),
                  topRight: Radius.circular(constraints.maxWidth * 0.048),
                ),
        ),
        child: Text(message),
      );
    });
  }
}
