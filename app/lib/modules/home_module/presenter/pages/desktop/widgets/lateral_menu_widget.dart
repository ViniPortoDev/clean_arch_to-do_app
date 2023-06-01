import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class LateralMenuWidget extends StatelessWidget {
  const LateralMenuWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final colorsTheme = Theme.of(context).extension<ColorsTheme>()!;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: size.width * 0.179,
          color: colorsTheme.backgroundLateralMenuColor,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LateralButtonWidget(
                  icon: Icons.mark_email_unread_outlined,
                  filterTypeTextChat: 'Pinned',
                  messages: '5',
                  isSelected: false,
                  unselectedButtonWidth: size.width * 0.13,
                ),
                LateralButtonWidget(
                  icon: Icons.forum_outlined,
                  filterTypeTextChat: 'All',
                  messages: '35',
                  isSelected: true,
                  selectedWidth: size.width * 0.13,
                ),
                LateralButtonWidget(
                  icon: Icons.inbox,
                  filterTypeTextChat: 'Live Chat',
                  messages: '2',
                  isSelected: false,
                  unselectedButtonWidth: size.width * 0.13,
                ),
                LateralButtonWidget(
                  icon: Icons.bookmark,
                  filterTypeTextChat: 'Archived',
                  messages: '',
                  isSelected: false,
                  unselectedButtonWidth: size.width * 0.13,
                ),
                LateralButtonWidget(
                  icon: Icons.block,
                  filterTypeTextChat: 'Blocked',
                  messages: '',
                  isSelected: false,
                  unselectedButtonWidth: size.width * 0.13,
                ),
                LateralButtonWidget(
                  icon: Icons.delete_forever_rounded,
                  filterTypeTextChat: 'trash',
                  messages: '',
                  isSelected: false,
                  unselectedButtonWidth: size.width * 0.13,
                ),
                SizedBox(
                  width: size.width * 0.13,
                  height: size.height * 0.3,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
