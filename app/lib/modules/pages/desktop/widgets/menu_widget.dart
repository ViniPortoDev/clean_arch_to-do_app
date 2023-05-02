import 'package:app/modules/pages/mobile/widgets/logo_widget.dart';
import 'package:app/utils/image_path.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class MenuWidget extends StatelessWidget {
  final double? menuHeight;
  final String userName;
  final String number;
  final bool switchValue;
  final void Function(bool) switchOnChanged;
  const MenuWidget({
    Key? key,
    this.menuHeight,
    required this.userName,
    required this.number,
    required this.switchValue,
    required this.switchOnChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyleTheme = Theme.of(context).extension<TextStyleTheme>()!;
    final size = MediaQuery.of(context).size;

    final listMenuButtons = <MenuButtonsWidget>[
      MenuButtonsWidget(
        height: menuHeight,
        isSelected: false,
        iconData: LineIcons.file,
        title: 'Resume',
      ),
      MenuButtonsWidget(
        height: menuHeight,
        isSelected: false,
        iconData: Icons.contact_page_outlined,
        title: 'Contacts',
      ),
      MenuButtonsWidget(
        height: menuHeight,
        isSelected: false,
        iconData: Icons.insert_chart_outlined_rounded,
        title: 'Statistic',
      ),
      MenuButtonsWidget(
        height: menuHeight,
        isSelected: true,
        iconData: LineIcons.comment,
        title: 'Chats',
      ),
      MenuButtonsWidget(
        height: menuHeight,
        isSelected: false,
        iconData: Icons.settings,
        title: 'Settings',
      ),
    ];

    return SizedBox(
      height: menuHeight ?? size.height * 0.107,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const LogoWidget(),
          SizedBox(
            width: size.width * 0.55,
            height: menuHeight ?? size.height * 0.107,
            child: ListView.separated(
              itemCount: listMenuButtons.length,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (BuildContext context, int index) {
                return Container(width: size.width * 0.03);
              },
              itemBuilder: (BuildContext context, int index) {
                return MenuButtonsWidget(
                  height: listMenuButtons[index].height,
                  isSelected: listMenuButtons[index].isSelected,
                  iconData: listMenuButtons[index].iconData,
                  title: listMenuButtons[index].title,
                );
              },
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: size.width * 0.12,
                child: Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    CustomSwitchWidget(
                      value: switchValue,
                      onChanged: switchOnChanged,
                      width: 0,
                    ),
                    const Icon(Icons.phone),
                    const Icon(Icons.notifications),
                  ],
                ),
              ),
              SizedBox(
                width: size.width * 0.14,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
        ],
      ),
    );
  }
}
