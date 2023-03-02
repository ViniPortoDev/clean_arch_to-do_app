import 'package:flutter/material.dart';

import '../../themes/extensions/colors_theme.dart';


class MessageWidget extends StatelessWidget {
  final String message;
 final bool myMessage;
const  MessageWidget({
    Key? key,
    required this.myMessage,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final colorsTheme = Theme.of(context).extension<ColorsTheme>()!;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.042,
        vertical: size.width * 0.058,
      ),
      decoration: BoxDecoration(
        color:
            myMessage ? colorsTheme.terciaryColor : colorsTheme.secundaryColor,
        borderRadius: myMessage
            ? const BorderRadius.only(
                bottomLeft: Radius.circular(18),
                topLeft: Radius.circular(18),
                topRight: Radius.circular(18),
              )
            : const BorderRadius.only(
                bottomLeft: Radius.circular(18),
                bottomRight: Radius.circular(18),
                topRight: Radius.circular(18),
              ),
      ),
      child: Text(message),
    );
  }
}
