import 'package:app/src/mocks/chat_filter_mock.dart';
import 'package:app/utils/image_path.dart';
import 'package:app/utils/user_name.dart';
import 'package:design_system/source/themes/extensions/colors_theme.dart';
import 'package:design_system/source/widgets/buttons/chat_filter_button_widget.dart';
import 'package:design_system/source/widgets/chat_components/expansion_chats_widget.dart';
import 'package:design_system/source/widgets/chat_components/list_tile_widget.dart';
import 'package:design_system/source/widgets/navigatorbar/navigator_widget.dart';
import 'package:design_system/source/widgets/text_fields/search_widget.dart';
import 'package:flutter/material.dart';
import '../controller/controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Controller();
  final chatFilterMock = ChatFilterMock();

  @override
  Widget build(BuildContext context) {
    final colorsTheme = Theme.of(context).extension<ColorsTheme>()!;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        color: colorsTheme.backgroundColor,
        height: size.height,
        child: Stack(
          children: [
            SizedBox(
              height: size.height,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: size.width * 0.128),
                    const SearchWidget(),
                    SizedBox(height: size.width * 0.037),
                    SizedBox(
                      height: size.width * 0.133,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.only(left: size.width * 0.042),
                        itemCount: chatFilterMock.chatFilter.length,
                        itemBuilder: (context, index) {
                          final filterList = chatFilterMock.chatFilter[index];
                          return ChatFilterButtonWidget(
                            icon: controller.getIcon(filterList),
                            filterTypeTextChat: filterList.textTypeChat,
                            isSelected: filterList.isSelected,
                            numberMessage: filterList.numberMessage,
                          );
                        },
                      ),
                    ),
                    SizedBox(height: size.width * 0.042),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.048),
                      child: ExpansionWidget(
                        title: 'Unread',
                        itemCount: 1,
                        child: Padding(
                          padding: EdgeInsets.only(top: size.width * 0.037),
                          child: const ListTileWidget(
                            name: UserName.name,
                            numberMessages: '20',
                            dateSent: '10:56',
                            phoneNumber: '(86) 9 9489-4600',
                            message: 'nego ney nego ney nego nego nego',
                            imageNetworkAvatar: ImagePath.imageAvatar,
                            isOnline: true,
                            muted: false,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: size.width * 0.33)
                  ],
                ),
              ),
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: BottomNavigationWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
