import 'package:flutter/material.dart';
import '../../themes/extensions/colors_theme.dart';
import '../../themes/extensions/text_style_theme.dart';
import '../badge/badge_widget.dart';
import '../profile_components/avatar_widget.dart';
import '../profile_components/name_widget.dart';

class ListTileWidget extends StatelessWidget {
  final bool muted;
  final String imageNetworkAvatar;
  final String numberMessages;
  final String name;
  final String dateSent;
  final String phoneNumber;
  final String message;
  final bool isOnline;

  final void Function() onTap;

  const ListTileWidget({
    Key? key,
    required this.muted,
    required this.imageNetworkAvatar,
    required this.numberMessages,
    required this.name,
    required this.dateSent,
    required this.onTap,
    required this.phoneNumber,
    required this.message,
    required this.isOnline,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorsTheme = Theme.of(context).extension<ColorsTheme>()!;
    final textStyleTheme = Theme.of(context).extension<TextStyleTheme>()!;
    return LayoutBuilder(builder: (context, constraints) {
      return InkWell(
        onTap: onTap,
        child: SizedBox(
          height: constraints.maxWidth * 0.22,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AvatarWidet(
                radius: constraints.maxWidth * 0.061,
                badge: BadgeWidget(
                  width: constraints.maxWidth * 0.064,
                  height: constraints.maxWidth * 0.064,
                  numberMessage: numberMessages,
                  isSelected: true,
                ),
                imageNetwork: imageNetworkAvatar,
              ),
              SizedBox(width: constraints.maxWidth * 0.032),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: constraints.maxWidth * 0.84,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        NameWidget(
                          name: name,
                          isOnline: isOnline,
                          textSize: textStyleTheme.nameSmallStyle.fontSize,
                          statusHeight: constraints.maxWidth * 0.026,
                          statusWidth: constraints.maxWidth * 0.026,
                        ),
                        Text(
                          dateSent,
                          style: textStyleTheme.listTilehourStyle,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: constraints.maxWidth * 0.010),
                  SizedBox(
                    child: Text(
                      phoneNumber,
                      style: textStyleTheme.listTileNumberStyle,
                    ),
                  ),
                  SizedBox(height: constraints.maxWidth * 0.021),
                  SizedBox(
                    width: constraints.maxWidth * 0.84,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: constraints.maxWidth * 0.7,
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
                          SizedBox(
                            child: Icon(
                              Icons.volume_off,
                              size: constraints.maxWidth * 0.042,
                              color: colorsTheme.primaryColor,
                            ),
                          )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
