
import 'package:app/modules/home_module/desktop/widgets/chat_widget.dart';
import 'package:app/modules/home_module/desktop/widgets/lateral_menu_widget.dart';
import 'package:app/modules/home_module/desktop/widgets/menu_widget.dart';
import 'package:app/modules/home_module/desktop/widgets/messages_widget.dart';
import 'package:app/modules/home_module/desktop/widgets/profile_todos_widget.dart';
import 'package:design_system/design_system.dart';
import 'package:design_system/source/themes/extensions/colors_theme.dart';
import 'package:flutter/material.dart';

import '../../../stores/task_store/task_store.dart';



class HomePageDesktop extends StatelessWidget {
  final TaskStore taskStore;
  const HomePageDesktop({Key? key, required this.taskStore}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final colorsTheme = Theme.of(context).extension<ColorsTheme>()!;
    final menuHeight = size.height * 0.107;
    final mode = ValueNotifier<bool>(true);
    return Scaffold(
      backgroundColor: colorsTheme.backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ValueListenableBuilder(
            valueListenable: mode,
            builder: (context, value, child) => MenuWidget(
              menuHeight: menuHeight,
              userName: 'Bom dia, Vini',
              number: '+55 (86) 9 9489-4600',
              switchValue: mode.value,
              switchOnChanged: (value) {
                mode.value = value;
                taskStore.switchMode(value: value);
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
