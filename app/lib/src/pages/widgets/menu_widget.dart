import 'package:app/src/pages/widgets/logo_widget.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class MenuWidget extends StatelessWidget {
  final double width;

  const MenuWidget({
    Key? key,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: size.width * 0.01),
          SizedBox(
            width: size.width * 0.6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const LogoWidget(),
                MenuButtonsWidget(
                  height: size.height * 0.15,
                  width: size.height * 0.15,
                  isSelected: true,
                  iconData: Icons.add,
                  title: 'resume',
                ),
                MenuButtonsWidget(
                  height: size.height * 0.15,
                  width: size.height * 0.15,
                  isSelected: true,
                  iconData: Icons.add,
                  title: 'resume',
                ),
                MenuButtonsWidget(
                  height: size.height * 0.15,
                  width: size.height * 0.15,
                  isSelected: true,
                  iconData: Icons.add,
                  title: 'resume',
                ),
                MenuButtonsWidget(
                  height: size.height * 0.15,
                  width: size.height * 0.15,
                  isSelected: true,
                  iconData: Icons.add,
                  title: 'resume',
                ),
                MenuButtonsWidget(
                  height: size.height * 0.15,
                  width: size.height * 0.15,
                  isSelected: true,
                  iconData: Icons.add,
                  title: 'resume',
                ),
              ],
            ),
          ),
          SizedBox(width: size.width * 0.01),
          SizedBox(
            width: size.width * 0.1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomSwitchWidget(value: true, onChanged: (a) {}, width: 90),
                const Icon(Icons.phone),
                const Icon(Icons.notifications),
              ],
            ),
          ),
          SizedBox(
            width: size.width * 0.2,
            child: Text('USERRRRRRRRRRRRRRRRRRRR'),
          )
        ],
      ),
    );
  }
}
