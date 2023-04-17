import 'package:app/src/pages/desktop/widgets/lateral_menu_widget.dart';
import 'package:app/src/pages/desktop/widgets/menu_widget.dart';
import 'package:flutter/material.dart';

class HomePageDesktop extends StatelessWidget {
  const HomePageDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          const MenuWidget(
            userName: 'Bom dia, Vini',
            number: '+55 (86) 9 9489-4600',
          ),
          Container(
            decoration: BoxDecoration(border: Border.all()),
            child: Column(
              children: [
                const LateralMenuWidget(),
                
              ],
            ),
          )
        ],
      ),
    );
  }
}
