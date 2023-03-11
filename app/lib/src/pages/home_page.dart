
import 'package:flutter/material.dart';
import '../../theme/extensions/colors_theme.dart';
import '../controller/controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  final controller = Controller();

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
                        itemCount: controller.chatFilterMock.chatFilter.length,
                        itemBuilder: (context, index) {
                          final filterList =
                              controller.chatFilterMock.chatFilter[index];
                          return ChatFilterButtonWidget(
                            filterIcon: filterList,
                            filterTypeTextChat: filterList.textTypeChat,
                            isSelected: filterList.isSelected,
                            numberMessage: filterList.numberMessage,
                          );
                        },
                      ),
                    ),
                    SizedBox(height: size.width * 0.042),
                    ExpansionWidget(
                      title: 'Unread',
                      height: controller.altura[0],
                      isOpen: controller.isOpen[0],
                      onTap: () {
                        setState(() {
                          controller.isOpen[0] = !controller.isOpen[0];
                          controller.isOpen[0] == true
                              ? controller.altura[0] = size.width * 0.693
                              : controller.altura[0] = 0;
                        });
                      },
                      child: const ListTileWidget(muted: false),
                    ),
                    SizedBox(height: size.width * 0.064),
                    ExpansionWidget(
                      title: 'From team',
                      height: controller.altura[1],
                      isOpen: controller.isOpen[1],
                      onTap: () {
                        setState(() {
                          controller.isOpen[1] = !controller.isOpen[1];
                          controller.isOpen[1] == true
                              ? controller.altura[1] = size.width * 0.693
                              : controller.altura[1] = 0;
                        });
                      },
                      child: const ListTileWidget(muted: false),
                    ),
                    SizedBox(height: size.width * 0.064),
                    ExpansionWidget(
                      title: 'From companies',
                      height: controller.altura[2],
                      isOpen: controller.isOpen[2],
                      onTap: () {
                        setState(() {
                          controller.isOpen[2] = !controller.isOpen[2];
                          controller.isOpen[2] == true
                              ? controller.altura[2] = size.width * 0.693
                              : controller.altura[2] = 0;
                        });
                      },
                      child: const ListTileWidget(muted: false),
                    ),
                    SizedBox(height: size.width * 0.33)
                  ],
                ),
              ),
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: NavigatorWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
