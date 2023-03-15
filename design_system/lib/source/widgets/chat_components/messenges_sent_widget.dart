import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class MessagesSent extends StatelessWidget {
  final String imageNetwork;
  final String name;
  final String timeSent;
  final bool myMessage;

  final List<Widget> messageList;

  const MessagesSent({
    Key? key,
    required this.imageNetwork,
    required this.name,
    required this.timeSent,
    required this.myMessage,
    required this.messageList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyleTheme = Theme.of(context).extension<TextStyleTheme>()!;
    final colorsTheme = Theme.of(context).extension<ColorsTheme>()!;

    // ignore: require_trailing_commas
    return LayoutBuilder(builder: (context, constraints) {
      return myMessage
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      timeSent,
                      style: TextStyle(color: colorsTheme.primaryColor),
                    ),
                  ],
                ),
                SizedBox(height: constraints.maxWidth * 0.026),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: messageList,
                ),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: constraints.maxWidth * 0.037,
                      backgroundImage: NetworkImage(imageNetwork),
                    ),
                    SizedBox(width: constraints.maxWidth * 0.021),
                    NameWidget(
                      name: name,
                      textSize: textStyleTheme.nameAppbarStyle.fontSize,
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
                ),
                SizedBox(height: constraints.maxWidth * 0.026),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: messageList,
                ),
              ],
            );
    },);
  }
}
