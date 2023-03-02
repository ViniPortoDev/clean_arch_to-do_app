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
      appInfo: AppInfo(name: 'Desafio 3 Components'),
      themes: [
        WidgetbookTheme(
          name: 'dark',
          data: Mytheme.myTheme,
        ),
      ],
      categories: [
        WidgetbookCategory(
          name: 'design system',
          widgets: [
            WidgetbookComponent(
              name: 'Search Widget',
              useCases: [
                WidgetbookUseCase.center(
                  name: 'Default',
                  child: SearchWidget(
                      // height: size.width * 0.906,
                      // width: size.width * 0.16,
                      ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Selected Button Widget',
              useCases: [
                WidgetbookUseCase.center(
                  name: 'Default ',
                  child: const SelectedButtonWidget(
                    child: Icon(
                      Icons.done,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Badge Widget',
              useCases: [
                WidgetbookUseCase.center(
                  name: 'Selected',
                  child:
                      const BadgeWidget(isSelected: true, numberMessage: '35'),
                ),
                WidgetbookUseCase.center(
                  name: 'Unselected',
                  child:
                      const BadgeWidget(isSelected: false, numberMessage: '2'),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'List Tile',
              useCases: [
                WidgetbookUseCase.center(
                  name: 'Default',
                  child: ListTileWidget(
                    muted: false,
                    phoneNumber: '(86) 9 9489-4600',
                    numberMessages: '89',
                    timeSent: '17:31',
                    name: 'Nego Ney',
                    message: 'Nego Ney?',
                    onTap: () {},
                    imageNetwork:
                        "https://i.scdn.co/image/ab67616d00001e024e5ccdc94de3657678dd767e",
                  ),
                ),
                WidgetbookUseCase.center(
                  name: 'Chat Muted',
                  child: ListTileWidget(
                    muted: true,
                    phoneNumber: '(86) 9 9489-4600',
                    numberMessages: '89',
                    timeSent: '17:31',
                    name: 'Nego Ney',
                    message: 'Nego Ney?',
                    onTap: () {},
                    imageNetwork:
                        "https://i.scdn.co/image/ab67616d00001e024e5ccdc94de3657678dd767e",
                  ),
                ),
              ],
            ),
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
              name: 'Bottom Navigator',
              useCases: [
                WidgetbookUseCase.center(
                  name: 'Default',
                  child: const NavigatorWidget(),
                )
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
            WidgetbookComponent(
              name: 'AppBar Widget',
              useCases: [
                WidgetbookUseCase.center(
                  name: 'Default',
                  child: LayoutBuilder(builder: (context, constraints) {
                    return AppBarWidget(
                      title: 'Nego Ney',
                      height: constraints.maxWidth * 0.026,
                      networkImage:
                          "https://i.scdn.co/image/ab67616d00001e024e5ccdc94de3657678dd767e",
                    );
                  }),
                )
              ],
            ),
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
