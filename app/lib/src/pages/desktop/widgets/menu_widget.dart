import 'package:app/src/pages/mobile/widgets/logo_widget.dart';
import 'package:app/utils/image_path.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class MenuWidget extends StatelessWidget {
  final String userName;
  final String number;

  const MenuWidget({
    Key? key,
    required this.userName,
    required this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyleTheme = Theme.of(context).extension<TextStyleTheme>()!;

    final size = MediaQuery.of(context).size;

    return SizedBox(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const LogoWidget(),
            MenuButtonsWidget(
              height: size.height * 0.13,
              isSelected: false,
              iconData: LineIcons.file,
              title: 'Resume',
            ),
            MenuButtonsWidget(
              height: size.height * 0.13,
              width: size.height * 0.5,
              isSelected: true,
              iconData: Icons.contact_page_outlined,
              title: 'Contacts',
            ),
            MenuButtonsWidget(
              height: size.height * 0.13,
              width: size.height * 0.13,
              isSelected: false,
              iconData: Icons.insert_chart_outlined_rounded,
              title: 'Statistic',
            ),
            MenuButtonsWidget(
              height: size.height * 0.13,
              width: size.height * 0.13,
              isSelected: false,
              iconData: LineIcons.comment,
              title: 'Chats',
            ),
            MenuButtonsWidget(
              height: size.height * 0.13,
              width: size.height * 0.13,
              isSelected: false,
              iconData: Icons.settings,
              title: 'Settings',
            ),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.05),
              child: Row(
                children: [
                  SizedBox(
                    width: size.width * 0.1,
                    child: Wrap(
                      alignment: WrapAlignment.spaceBetween,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        CustomSwitchWidget(
                          value: true,
                          onChanged: (a) {},
                          width: 0,
                        ),
                        const Icon(Icons.phone),
                        const Icon(Icons.notifications),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.13,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: userName,
                            style: textStyleTheme.todoTitleStyle,
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: number,
                            style: textStyleTheme.listTileDescription,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  const CircleAvatar(
                    backgroundImage: NetworkImage(ImagePath.profileAvatar),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
