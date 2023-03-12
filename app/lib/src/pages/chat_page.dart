import 'package:app/utils/image_path.dart';
import 'package:app/utils/user_name.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';




class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorsTheme = Theme.of(context).extension<ColorsTheme>()!;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBarWidget(
        height: size.width * 0.266,
        name: UserName.name,
        networkImageAvatar: ImagePath.imageAvatar,
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            color: colorsTheme.backgroundColor,
            height: size.height,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.042),
                child: Column(
                  children: [
                    SizedBox(height: size.width * 0.042),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: size.width * 0.021),
                        const MessageWidget(
                          myMessage: false,
                          message: 'Eu to com muito sono',
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(height: size.width * 0.021),
                        const MessageWidget(
                          myMessage: true,
                          message: 'Eu tbm to com muito sono',
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const MessagesSent(
                          name: UserName.name,
                          myMessage: false,
                          timeSent: '10:48',
                          imageNetwork: ImagePath.imageAvatar,
                          messageList: [
                            MessageWidget(
                              myMessage: false,
                              message: 'Eu to com muito sono',
                            ),
                          ],
                        ),
                        SizedBox(height: size.width * 0.021),
                        const MessageWidget(
                          myMessage: false,
                          message: 'Eu to com muito sono',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: size.width * 0.05,
            child: const SendMessageWidget(),
          ),
        ],
      ),
    );
  }
}
