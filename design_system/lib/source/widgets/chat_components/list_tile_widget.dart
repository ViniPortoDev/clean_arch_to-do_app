import 'package:flutter/material.dart';
import '../../themes/extensions/colors_theme.dart';
import '../../themes/extensions/text_style_theme.dart';
import '../badge/badge_widget.dart';
import '../user/avatar_widget.dart';
import '../user/name_widget.dart';

class ListTileWidget extends StatelessWidget {
  final bool muted;
  final String imageNetwork;
  final String numberMessages;
  final String name;
  final String timeSent;
  final String phoneNumber;
  final String message;

  final void Function() onTap;

  const ListTileWidget({
    Key? key,
    required this.muted,
    required this.imageNetwork,
    required this.numberMessages,
    required this.name,
    required this.timeSent,
    required this.onTap,
    required this.phoneNumber,
    required this.message,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final colorsTheme = Theme.of(context).extension<ColorsTheme>()!;
    final textStyleTheme = Theme.of(context).extension<TextStyleTheme>()!;
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: size.width * 0.906,
        height: size.width * 0.161,
        child: Row(
          children: [
            
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AvatarWidet(
                  badge: BadgeWidget(
                      numberMessage: numberMessages, isSelected: true),
                  imageNetwork: imageNetwork,
                ),
                SizedBox(width: size.width * 0.032),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: size.width * 0.752,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          NameWidget(name: name, isOnline: true),
                          Text(
                            timeSent,
                            style: textStyleTheme.listTilehourStyle,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      phoneNumber,
                      style: textStyleTheme.listTileNumberStyle,
                    ),
                    SizedBox(height: size.width * 0.021),
                    SizedBox(
                      width: size.width * 0.752,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: size.width * 0.56,
                            child: RichText(
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              text: TextSpan(
                                text: message,
                                style: textStyleTheme.listTileMessageStyle,
                              ),
                            ),
                          ),
                          if (muted)
                            Icon(
                              Icons.volume_off,
                              size: size.width * 0.042,
                              color: colorsTheme.primaryColor,
                            )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
