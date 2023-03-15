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
      backgroundColor: colorsTheme.backgroundColor,
      appBar: AppBarWidget(
        height: size.width * 0.266,
        name: UserName.name,
        networkImageAvatar: ImagePath.imageAvatar,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.053),
                child: Column(
                  children: [
                    SizedBox(height: size.width * 0.042),
                    SizedBox(
                      width: size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: size.width * 0.021),
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
                        ],
                      ),
                    ),
                    SizedBox(
                      width: size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(height: size.width * 0.021),
                          MessagesSent(
                            name: UserName.name,
                            myMessage: true,
                            timeSent: '10:48',
                            imageNetwork: ImagePath.imageAvatar,
                            messageList: [
                              const MessageWidget(
                                myMessage: true,
                                message: 'Eu to com muito sono',
                              ),
                              SizedBox(height: size.width * 0.032),
                              const MessageWidget(
                                myMessage: true,
                                message: 'Eu to com muito sono',
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: size.width * 0.042),
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
                        SizedBox(
                          width: size.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: const [
                              MessagesSent(
                                name: UserName.name,
                                myMessage: true,
                                timeSent: '10:48',
                                imageNetwork: ImagePath.imageAvatar,
                                messageList: [
                                  MessageWidget(
                                    myMessage: true,
                                    message: 'Eu to com muito sono',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                top: size.width * 1.48,
                child: SizedBox(
                  width: size.width * 0.906,
                  child: SendMessageWidget(
                    height: size.width * 0.16,
                    width: size.width * 0.906,
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
