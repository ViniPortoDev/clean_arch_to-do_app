import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

class WidgetbookHotReload extends StatelessWidget {
  const WidgetbookHotReload({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      devices: const [
        Device.mobile(
          type: DeviceType.mobile,
          name: 'Iphone 8',
          resolution: Resolution(
            nativeSize: DeviceSize(width: 375, height: 667),
            scaleFactor: 1,
          ),
        ),
        Device.mobile(
          type: DeviceType.mobile,
          name: 'Iphone 14 Pro Max',
          resolution: Resolution(
            nativeSize: DeviceSize(width: 430, height: 930),
            scaleFactor: 1,
          ),
        ),
      ],
      appInfo: AppInfo(name: 'Desafio 3 Design System'),
      themes: [
        WidgetbookTheme(
          name: 'dark',
          data: Mytheme.myTheme,
        ),
      ],
      categories: [
        WidgetbookCategory(
          name: 'design system',
          folders: [
            WidgetbookFolder(
              name: 'Appbar',
              widgets: [
                WidgetbookComponent(
                  name: 'Appbar',
                  useCases: [
                    WidgetbookUseCase.center(
                      name: 'Default',
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          return AppBarWidget(
                            name: 'Nego Ney',
                            height: constraints.maxWidth * 0.266,
                            networkImageAvatar:
                                'https://m.extra.globo.com/incoming/23560180-ee0-fc1/w533h800/81865188_re-rio-de-janeiro-rj-27-03-2019-nego-ney-o-menino-de-7-anos-que-tem-viralizado-por-seu.jpg',
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
            WidgetbookFolder(
              name: 'Badge',
              widgets: [
                WidgetbookComponent(
                  name: 'Badge',
                  useCases: [
                    WidgetbookUseCase.center(
                      name: 'Selected',
                      child: const BadgeWidget(
                        numberMessage: '31',
                        isSelected: true,
                      ),
                    ),
                    WidgetbookUseCase.center(
                      name: 'Unselected',
                      child: const BadgeWidget(
                        numberMessage: '5',
                        isSelected: false,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            WidgetbookFolder(
              name: 'Buttons',
              widgets: [
                WidgetbookComponent(
                  name: 'Chat filter Button',
                  useCases: [
                    WidgetbookUseCase.center(
                      name: 'Selected',
                      child: const ChatFilterButtonWidget(
                        icon: Icons.chat,
                        filterTypeTextChat: 'All',
                        numberMessage: '35',
                        isSelected: true,
                      ),
                    ),
                    WidgetbookUseCase.center(
                      name: 'Unselected',
                      child: const ChatFilterButtonWidget(
                        icon: Icons.chat,
                        filterTypeTextChat: 'Live Chat',
                        numberMessage: '2',
                        isSelected: false,
                      ),
                    ),
                  ],
                ),
                WidgetbookComponent(
                  name: 'Profile Button',
                  useCases: [
                    WidgetbookUseCase.center(
                      name: 'Avaliable',
                      child: const ProfileButtonWidget(
                        icon: Icons.volume_down,
                        avaliable: true,
                      ),
                    ),
                    WidgetbookUseCase.center(
                      name: 'Unvaliable',
                      child: const ProfileButtonWidget(
                        icon: Icons.volume_off,
                        avaliable: false,
                      ),
                    ),
                  ],
                ),
                WidgetbookComponent(
                  name: 'Selected Button',
                  useCases: [
                    WidgetbookUseCase.center(
                      name: 'Default',
                      child: const SelectedButtonWidget(
                        child: Icon(
                          Icons.done,
                          color: HexColors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            WidgetbookFolder(
              name: 'Chat Components',
              widgets: [
                // WidgetbookComponent(
                //   name: 'Expansion Chat',
                //   useCases: [
                //     WidgetbookUseCase.center(
                //         name: 'Default',
                //         child: const ExpansionWidget(
                //           title: title,
                //           height: height,
                //           isOpen: isOpen,
                //           onTap: onTap,
                //           child: child,
                //         ),),
                //   ],
                // ),
                WidgetbookComponent(
                  name: 'List Tile',
                  useCases: [
                    WidgetbookUseCase.center(
                      name: 'Online',
                      child: ListTileWidget(
                        muted: false,
                        isOnline: true,
                        imageNetwork:
                            'https://m.extra.globo.com/incoming/23560180-ee0-fc1/w533h800/81865188_re-rio-de-janeiro-rj-27-03-2019-nego-ney-o-menino-de-7-anos-que-tem-viralizado-por-seu.jpg',
                        numberMessages: '35',
                        name: 'Nego Ney',
                        dateSent: '13:59',
                        onTap: () {},
                        phoneNumber: '(86) 9 9489-4600',
                        message: 'nego ney nego ney nego nego nego ney',
                      ),
                    ),
                    WidgetbookUseCase.center(
                      name: 'Muted',
                      child: ListTileWidget(
                        muted: true,
                        isOnline: true,
                        imageNetwork:
                            'https://m.extra.globo.com/incoming/23560180-ee0-fc1/w533h800/81865188_re-rio-de-janeiro-rj-27-03-2019-nego-ney-o-menino-de-7-anos-que-tem-viralizado-por-seu.jpg',
                        numberMessages: '35',
                        name: 'Nego Ney',
                        dateSent: '13:59',
                        onTap: () {},
                        phoneNumber: '(86) 9 9489-4600',
                        message: 'nego ney nego ney nego nego nego ney',
                      ),
                    ),
                    WidgetbookUseCase.center(
                      name: 'Message from the day before',
                      child: ListTileWidget(
                        muted: false,
                        isOnline: false,
                        imageNetwork:
                            'https://m.extra.globo.com/incoming/23560180-ee0-fc1/w533h800/81865188_re-rio-de-janeiro-rj-27-03-2019-nego-ney-o-menino-de-7-anos-que-tem-viralizado-por-seu.jpg',
                        numberMessages: '35',
                        name: 'Nego Ney',
                        dateSent: 'fri',
                        onTap: () {},
                        phoneNumber: '(86) 9 9489-4600',
                        message: 'nego ney nego ney nego nego nego ney',
                      ),
                    ),
                  ],
                ),
                WidgetbookComponent(
                  name: 'Message',
                  useCases: [
                    WidgetbookUseCase.center(
                      name: 'My message',
                      child: const MessageWidget(
                        myMessage: true,
                        message: 'Hi my friend!',
                      ),
                    ),
                    WidgetbookUseCase.center(
                      name: 'Message from others',
                      child: const MessageWidget(
                        myMessage: false,
                        message: 'Hello meu brother',
                      ),
                    ),
                  ],
                ),
                WidgetbookComponent(
                  name: 'Chat dialog',
                  useCases: [
                    WidgetbookUseCase.center(
                      name: 'My Messages',
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          return MessagesSent(
                            myMessage: true,
                            name: 'Nego Ney',
                            timeSent: '12:41',
                            imageNetwork:
                                'https://m.extra.globo.com/incoming/23560180-ee0-fc1/w533h800/81865188_re-rio-de-janeiro-rj-27-03-2019-nego-ney-o-menino-de-7-anos-que-tem-viralizado-por-seu.jpg',
                            messageList: [
                              MessageWidget(
                                myMessage: true,
                                message: 'Bora lol?',
                                messageSpacing: constraints.maxWidth * 0.026,
                              ),
                              MessageWidget(
                                myMessage: true,
                                message: 'pegar bronze?',
                                messageSpacing: constraints.maxWidth * 0.026,
                              ),
                              MessageWidget(
                                myMessage: true,
                                message: 'trollar?',
                                messageSpacing: constraints.maxWidth * 0.026,
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    WidgetbookUseCase.center(
                      name: 'Messages from other',
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          return MessagesSent(
                            myMessage: false,
                            name: 'Nego Ney',
                            timeSent: '12:41',
                            imageNetwork:
                                'https://m.extra.globo.com/incoming/23560180-ee0-fc1/w533h800/81865188_re-rio-de-janeiro-rj-27-03-2019-nego-ney-o-menino-de-7-anos-que-tem-viralizado-por-seu.jpg',
                            messageList: [
                              MessageWidget(
                                myMessage: false,
                                message: 'Vo n man',
                                messageSpacing: constraints.maxWidth * 0.026,
                              ),
                              MessageWidget(
                                myMessage: false,
                                message: 'cansei de perder',
                                messageSpacing: constraints.maxWidth * 0.026,
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
            WidgetbookFolder(
              name: 'Navigatorbar',
              widgets: [
                WidgetbookComponent(
                  name: 'Bottom Navigation',
                  useCases: [
                    WidgetbookUseCase.center(
                      name: 'Default',
                      child: const BottomNavigationWidget(),
                    ),
                  ],
                ),
              ],
            ),
            WidgetbookFolder(
              name: 'Task Components',
              widgets: [
                WidgetbookComponent(
                  name: 'Todo Widget',
                  useCases: [
                    WidgetbookUseCase.center(
                      name: 'Selected',
                      child: TodoWidget(
                        title: 'Interview with Lead Designer',
                        description: 'Sep 25, 2022 10:30 AM',
                        isDone: true,
                        dateAndTime: '12/11/20',
                        onTap: () {},
                      ),
                    ),
                    WidgetbookUseCase.center(
                      name: 'Unselected',
                      child: TodoWidget(
                        title: 'Interview with Lead Designer',
                        description: 'Sep 25, 2022 10:30 AM',
                        isDone: false,
                        dateAndTime: '12/11/20',
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
            WidgetbookFolder(
              name: 'Text Fields',
              widgets: [
                WidgetbookComponent(
                  name: 'Search',
                  useCases: [
                    WidgetbookUseCase.center(
                      name: 'Default',
                      child: const SearchWidget(),
                    ),
                  ],
                ),
                WidgetbookComponent(
                  name: 'Send Message',
                  useCases: [
                    WidgetbookUseCase.center(
                      name: 'Default',
                      child: const SendMessageWidget(),
                    ),
                  ],
                ),
              ],
            ),
            WidgetbookFolder(
              name: 'User Components',
              widgets: [],
            ),
          ],
          widgets: [
            WidgetbookComponent(
              name: 'Name Widget',
              useCases: [
                WidgetbookUseCase.center(
                  name: 'Online',
                  child: const NameWidget(name: 'Nego Ney', isOnline: true),
                ),
                WidgetbookUseCase.center(
                  name: 'Offline',
                  child: const NameWidget(name: 'Nego Ney', isOnline: false),
                ),
              ],
            ),

            WidgetbookComponent(
              name: 'Profile Icons',
              useCases: [
                WidgetbookUseCase.center(
                  name: 'Avaliable',
                  child: const ProfileButtonWidget(
                    icon: Icons.phone_in_talk_rounded,
                    avaliable: true,
                  ),
                ),
                WidgetbookUseCase.center(
                  name: 'Unavalible',
                  child: const ProfileButtonWidget(
                    icon: Icons.volume_off,
                    avaliable: false,
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Profile Skills Widget',
              useCases: [
                WidgetbookUseCase.center(
                  name: 'Example 1',
                  child: const ProfileSkillsWidget(
                      colors: Color(0xff454084), text: 'UI/UX Designer'),
                ),
                WidgetbookUseCase.center(
                  name: 'Example 2',
                  child: const ProfileSkillsWidget(
                      colors: Color(0xff454084), text: 'Project Manager'),
                ),
                WidgetbookUseCase.center(
                  name: 'Example 3',
                  child: const ProfileSkillsWidget(
                      colors: Color(0xff8568A9), text: 'Java Script Developer'),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Profile Container Info',
              useCases: [
                WidgetbookUseCase.center(
                    name: 'Default',
                    child: const ProfileContainerInfoWidget(
                      name: 'Nego Ney',
                      description1: "sla",
                      description2: 'sla 2',
                      imageNetworkAvatar:
                          "https://i.scdn.co/image/ab67616d00001e024e5ccdc94de3657678dd767e",
                    )),
              ],
            ),
            WidgetbookComponent(
              name: 'Todo Widget',
              useCases: [
                WidgetbookUseCase.center(
                  name: 'Selected',
                  child: TodoWidget(
                    title: 'Interview with Lead Designer',
                    description: 'Sep 25, 2022 10:30 AM',
                    isDone: true,
                    dateAndTime: 'agora',
                    onTap: () {},
                  ),
                ),
                WidgetbookUseCase.center(
                  name: 'Unselected',
                  child: TodoWidget(
                    title: 'Interview with Lead Designer',
                    description: 'Sep 25, 2022 10:30 AM',
                    isDone: false,
                    dateAndTime: 'agora',
                    onTap: () {},
                  ),
                ),
              ],
            ),
            // WidgetbookComponent(
            //   name: 'AppBar Widget',
            //   useCases: [
            //     WidgetbookUseCase.center(
            //       name: 'Default',
            //       child: LayoutBuilder(builder: (context, constraints) {
            //         return
            //       }),
            //     )
            //   ],
            // ),
            WidgetbookComponent(
              name: 'Message Widget',
              useCases: [
                WidgetbookUseCase.center(
                  name: 'My Message',
                  child: const MessageWidget(
                    myMessage: true,
                    message: 'How does it sound for you?',
                  ),
                ),
                WidgetbookUseCase.center(
                  name: 'Your Message',
                  child: const MessageWidget(
                    myMessage: false,
                    message: 'How does it sound for you?',
                  ),
                ),
              ],
            ),
            // WidgetbookComponent(
            //   name: 'Send Message',
            //   useCases: [
            //     WidgetbookUseCase.center(
            //       name: 'Default',
            //       child: const SendMessageWidget(),
            //     )
            //   ],
            // ),
          ],
        ),
      ],
    );
  }
}

void main() {
  runApp(
    const WidgetbookHotReload(),
  );
}
