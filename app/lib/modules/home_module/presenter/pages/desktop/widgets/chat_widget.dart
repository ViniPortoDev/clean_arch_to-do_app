import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import '../../../../../../../utils/image_path.dart';
import '../../../../../../../utils/user_name.dart';
import 'appbar_desktop_widget.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorsTheme = Theme.of(context).extension<ColorsTheme>()!;
    final textStyleTheme = Theme.of(context).extension<TextStyleTheme>()!;

    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width * 0.411,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              Container(
                color: colorsTheme.backgroundColor,
                height: size.height * 0.029,
              ),
              AppbarDesktopWidget(
                height: size.height * 0.09,
                name: UserName.name,
                networkImageAvatar: ImagePath.imageAvatar,
              ),
              Container(
                color: colorsTheme.backgroundChatColor,
                height: size.height * 0.77,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        MessagesSent(
                          nameColor: textStyleTheme.nameMediumStyle.color,
                          name: UserName.name,
                          myMessage: false,
                          timeSent: '10:48',
                          imageNetwork: ImagePath.imageAvatar,
                          messageList: [
                            MessageWidget(
                              paddingHorizontal: size.height * 0.032,
                              paddingVertical: size.width * 0.015,
                              borderRadius: 18,
                              myMessage: false,
                              message: 'Eu to com muito sono',
                            ),
                          ],
                        ),
                        MessagesSent(
                          name: UserName.name,
                          nameColor: textStyleTheme.nameMediumStyle.color,
                          myMessage: true,
                          timeSent: '10:48',
                          imageNetwork: ImagePath.imageAvatar,
                          messageList: [
                            MessageWidget(
                              paddingHorizontal: size.height * 0.032,
                              paddingVertical: size.width * 0.015,
                              borderRadius: 18,
                              myMessage: true,
                              message: 'Eu to com muito sono',
                            ),
                            MessageWidget(
                              paddingHorizontal: size.height * 0.032,
                              paddingVertical: size.width * 0.015,
                              borderRadius: 18,
                              myMessage: true,
                              message: 'Eu to com muito sono',
                            ),
                          ],
                        ),
                        MessagesSent(
                          name: UserName.name,
                          nameColor: textStyleTheme.nameMediumStyle.color,
                          myMessage: false,
                          timeSent: '10:48',
                          imageNetwork: ImagePath.imageAvatar,
                          messageList: [
                            MessageWidget(
                              paddingHorizontal: size.height * 0.032,
                              paddingVertical: size.width * 0.015,
                              borderRadius: 18,
                              myMessage: false,
                              message: 'Eu to com muito sono',
                            ),
                          ],
                        ),
                        MessagesSent(
                          name: UserName.name,
                          nameColor: textStyleTheme.nameMediumStyle.color,
                          myMessage: false,
                          timeSent: '10:48',
                          imageNetwork: ImagePath.imageAvatar,
                          messageList: [
                            MessageWidget(
                              paddingHorizontal: size.height * 0.032,
                              paddingVertical: size.width * 0.015,
                              borderRadius: 18,
                              myMessage: false,
                              message: 'Eu to com muito sono',
                            ),
                          ],
                        ),
                        MessagesSent(
                          name: UserName.name,
                          nameColor: textStyleTheme.nameMediumStyle.color,
                          myMessage: false,
                          timeSent: '10:48',
                          imageNetwork: ImagePath.imageAvatar,
                          messageList: [
                            MessageWidget(
                              paddingHorizontal: size.height * 0.032,
                              paddingVertical: size.width * 0.015,
                              borderRadius: 18,
                              myMessage: false,
                              message: 'Eu to com muito sono',
                            ),
                          ],
                        ),
                        MessagesSent(
                          name: UserName.name,
                          nameColor: textStyleTheme.nameMediumStyle.color,
                          myMessage: true,
                          timeSent: '10:48',
                          imageNetwork: ImagePath.imageAvatar,
                          messageList: [
                            MessageWidget(
                              paddingHorizontal: size.height * 0.032,
                              paddingVertical: size.width * 0.015,
                              borderRadius: 18,
                              myMessage: true,
                              message: 'Eu to com muito sono',
                            ),
                          ],
                        ),
                        SizedBox(height: size.height * 0.1)
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 18),
            child: SizedBox(
              child: SendMessageWidget(
                height: size.height * 0.068,
                width: size.width * 0.38,
                iconsSize: size.width * 0.016,
                selectedItemheight: size.height * 0.048,
                selectedItemWidth: size.width * 0.027,
                borderRadius: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
