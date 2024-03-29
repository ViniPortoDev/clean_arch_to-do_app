

import 'package:app/modules/home_module/presenter/pages/desktop/widgets/chat_widget.dart';
import 'package:app/modules/home_module/presenter/pages/desktop/widgets/lateral_menu_widget.dart';
import 'package:app/modules/home_module/presenter/pages/desktop/widgets/menu_widget.dart';
import 'package:app/modules/home_module/presenter/pages/desktop/widgets/profile_todos_widget.dart';
import 'package:app/modules/home_module/presenter/stores/task_store/task_store.dart';
import 'package:app/modules/home_module/presenter/stores/theme_store/theme_store.dart';
import 'package:design_system/design_system.dart';
import 'package:design_system/source/themes/extensions/colors_theme.dart';
import 'package:flutter/material.dart';

import 'widgets/messages_widget.dart';

class HomePageDesktop extends StatelessWidget {
  final TaskStore taskStore;
  final ThemeStore themeStore;
  const HomePageDesktop({
    Key? key,
    required this.themeStore,
    required this.taskStore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final colorsTheme = Theme.of(context).extension<ColorsTheme>()!;
    final menuHeight = size.height * 0.107;

    return Scaffold(
      backgroundColor: colorsTheme.backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ValueListenableBuilder(
            valueListenable: themeStore.toggle,
            builder: (context, toggle, child) => MenuWidget(
              menuHeight: menuHeight,
              userName: 'Bom dia, Vini',
              number: '+55 (86) 9 9489-4600',
              switchValue: toggle,
              switchOnChanged: (value) {
                themeStore.changeTheme();
                value = toggle;
              },
            ),
          ),
          Container(
            height: size.height - menuHeight,
            decoration: BoxDecoration(border: Border.all()),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const LateralMenuWidget(),
                const MessagesWidget(),
                const ChatWidget(),
                ProfileTodosWidget(taskStore: taskStore)
              ],
            ),
          )
        ],
      ),
    );
  }
}
