import 'package:design_system/source/widgets/chat_components/expansion_chats_widget.dart';
import 'package:design_system/source/widgets/chat_components/list_tile_widget.dart';
import 'package:design_system/source/widgets/text_fields/search_widget.dart';
import 'package:flutter/material.dart';

import '../../../../utils/image_path.dart';
import '../../../../utils/routes.dart';
import '../../../../utils/user_name.dart';

class MessagesWidget extends StatelessWidget {
  const MessagesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const itemHeight = 70.0;
    const expansionHeight = 90.0;

    return SizedBox(
      width: size.width * 0.218,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.013),
          child: Column(
            children: [
              SizedBox(height: size.height * 0.029),
              const SearchWidget(),
              SizedBox(height: size.height * 0.035),
              ExpansionWidget(
                title: 'Unread',
                itemCount: 3,
                isOpen: true,
                childHeight: expansionHeight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: ListTileWidget(
                    height: itemHeight,
                    name: UserName.name,
                    numberMessages: '20',
                    dateSent: '10:56',
                    phoneNumber: '(86) 9 9489-4600',
                    message: 'nego ney nego ney nego nego nego',
                    imageNetworkAvatar: ImagePath.imageAvatar,
                    isOnline: true,
                    muted: false,
                    onTap: () => Navigator.pushNamed(context, Routes.chatPage),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.042),
              ExpansionWidget(
                title: 'From team',
                itemCount: 3,
                childHeight: expansionHeight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: ListTileWidget(
                    height: itemHeight,
                    name: UserName.name,
                    numberMessages: '20',
                    dateSent: '10:56',
                    phoneNumber: '(86) 9 9489-4600',
                    message: 'nego ney nego ney nego nego nego',
                    imageNetworkAvatar: ImagePath.imageAvatar,
                    isOnline: true,
                    muted: false,
                    onTap: () => Navigator.pushNamed(context, Routes.chatPage),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.042),
              ExpansionWidget(
                title: 'From Companies',
                itemCount: 3,
                childHeight: expansionHeight,
                isOpen: true,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: ListTileWidget(
                    height: itemHeight,
                    name: UserName.name,
                    numberMessages: '20',
                    dateSent: '10:56',
                    phoneNumber: '(86) 9 9489-4600',
                    message: 'nego ney nego ney nego nego nego',
                    imageNetworkAvatar: ImagePath.imageAvatar,
                    isOnline: true,
                    muted: false,
                    onTap: () => Navigator.pushNamed(context, Routes.chatPage),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
