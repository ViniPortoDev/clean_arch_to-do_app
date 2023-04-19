import 'package:design_system/source/themes/extensions/colors_theme.dart';
import 'package:design_system/source/widgets/chat_components/message_widget.dart';
import 'package:design_system/source/widgets/chat_components/messenges_sent_widget.dart';
import 'package:design_system/source/widgets/text_fields/send_message_widget.dart';
import 'package:flutter/material.dart';
import '../../../../utils/image_path.dart';
import '../../../../utils/user_name.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorsTheme = Theme.of(context).extension<ColorsTheme>()!;

    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        SizedBox(height: size.height * 0.029),
        Container(
          color: colorsTheme.backgroundChatColor,
          width: size.width * 0.411,
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
      ],
    );
  }
}
