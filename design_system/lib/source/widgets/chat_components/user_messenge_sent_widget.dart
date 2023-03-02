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
    final size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(imageNetwork),
        ),
        SizedBox(width: size.width * 0.021),
        NameWidget(name: name, isOnline: false),
        SizedBox(width: size.width * 0.037),
        Text(
          timeSent,
          style: TextStyle(color: colorsTheme.primaryColor),
        ),
      ],
    );
  }
}
