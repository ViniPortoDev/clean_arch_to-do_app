import 'package:app/src/pages/widgets/menu_widget.dart';
import 'package:flutter/material.dart';

class HomePageDesktop extends StatelessWidget {
  const HomePageDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          MenuWidget(
            width: size.width,
          ),
        ],
      ),
    );
  }
}
