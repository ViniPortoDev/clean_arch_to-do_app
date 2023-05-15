
import 'package:app/utils/image_path.dart';
import 'package:app/utils/routes.dart';
import 'package:app/utils/user_name.dart';
import 'package:design_system/source/themes/extensions/colors_theme.dart';
import 'package:design_system/source/widgets/buttons/chat_filter_button_widget.dart';
import 'package:design_system/source/widgets/chat_components/expansion_chats_widget.dart';
import 'package:design_system/source/widgets/chat_components/list_tile_widget.dart';
import 'package:design_system/source/widgets/navigatorbar/navigator_widget.dart';
import 'package:design_system/source/widgets/text_fields/search_widget.dart';
import 'package:flutter/material.dart';

import 'mocks/chat_filter_mock.dart';

class HomePageMobile extends StatefulWidget {
  const HomePageMobile({Key? key}) : super(key: key);

  @override
  State<HomePageMobile> createState() => _HomePageMobileState();
}

class _HomePageMobileState extends State<HomePageMobile> {
  final chatFilterMock = ChatFilterMock();

  @override
  Widget build(BuildContext context) {
    final colorsTheme = Theme.of(context).extension<ColorsTheme>()!;
    final size = MediaQuery.of(context).size;
    final itemHeight = size.height * 0.103;

    return Scaffold(
      backgroundColor: colorsTheme.backgroundColor,
      body: SizedBox(
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
                    return SizedBox(
                      child: ChatFilterButtonWidget(
                        icon: chatFilterMock.getIcon(filterList),
                        filterTypeTextChat: filterList.textTypeChat,
                        isSelected: filterList.isSelected,
                        numberMessage: filterList.numberMessage,
                        unselectedButtonWidth: size.width * 0.42,
                        iconSize: size.width * 0.069,
                        padding: size.width * 0.042,
                        spacing: size.width * 0.02,
                        selectedButtonBorderRadius: size.width * 0.034,
                        selectedWidth: size.width * 0.33,
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: size.width * 0.042),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.048),
                child: ExpansionWidget(
                  title: 'Unread',
                  itemCount: 3,
                  isOpen: true,
                  childHeight: itemHeight,
                  child: Padding(
                    padding: EdgeInsets.only(top: size.width * 0.037),
                    child: ListTileWidget(
                      name: UserName.name,
                      numberMessages: '20',
                      dateSent: '10:56',
                      phoneNumber: '(86) 9 9489-4600',
                      message: 'nego ney nego ney nego nego nego',
                      imageNetworkAvatar: ImagePath.imageAvatar,
                      isOnline: true,
                      muted: false,
                      onTap: () =>
                          Navigator.pushNamed(context, Routes.chatPage),
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.width * 0.064),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.048),
                child: ExpansionWidget(
                  title: 'From team',
                  itemCount: 3,
                  childHeight: itemHeight,
                  child: Padding(
                    padding: EdgeInsets.only(top: size.width * 0.037),
                    child: ListTileWidget(
                      name: UserName.name,
                      numberMessages: '20',
                      dateSent: '10:56',
                      phoneNumber: '(86) 9 9489-4600',
                      message: 'nego ney nego ney nego nego nego',
                      imageNetworkAvatar: ImagePath.imageAvatar,
                      isOnline: true,
                      muted: false,
                      onTap: () =>
                          Navigator.pushNamed(context, Routes.chatPage),
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.width * 0.064),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.048),
                child: ExpansionWidget(
                  title: 'From Companies',
                  itemCount: 3,
                  isOpen: true,
                  childHeight: itemHeight,
                  child: Padding(
                    padding: EdgeInsets.only(top: size.width * 0.037),
                    child: ListTileWidget(
                      name: UserName.name,
                      numberMessages: '20',
                      dateSent: '10:56',
                      phoneNumber: '(86) 9 9489-4600',
                      message: 'nego ney nego ney nego nego nego',
                      imageNetworkAvatar: ImagePath.imageAvatar,
                      isOnline: true,
                      muted: false,
                      onTap: () =>
                          Navigator.pushNamed(context, Routes.chatPage),
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.width * 0.33)
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationWidget(
        onPressed: () => Navigator.pushNamed(context, Routes.infoPage),
      ),
    );
  }
}
