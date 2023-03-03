import 'package:flutter/material.dart';

import '../../themes/extensions/colors_theme.dart';
import '../user/name_widget.dart';

class UserMesseger extends StatelessWidget {
  final String imageNetwork;
  final String name;
  final String timeSent;
  final MainAxisAlignment mainAxisAlignment;
  const UserMesseger({
    Key? key,
    required this.imageNetwork,
    required this.name,
    required this.timeSent,
    required this.mainAxisAlignment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorsTheme = Theme.of(context).extension<ColorsTheme>()!;

    return LayoutBuilder(builder: (context, constraints) {
      return Row(
        mainAxisAlignment: mainAxisAlignment,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(imageNetwork),
          ),
          SizedBox(width: constraints.maxWidth * 0.021),
          NameWidget(
            name: name,
            isOnline: false,
            statusWidth: constraints.maxWidth * 0.026,
            statusHeight: constraints.maxWidth * 0.026,
          ),
          SizedBox(width: constraints.maxWidth * 0.037),
          Text(
            timeSent,
            style: TextStyle(color: colorsTheme.primaryColor),
          ),
        ],
      );
    });
  }
}
