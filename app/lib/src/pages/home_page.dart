import 'package:app/src/pages/desktop/home_page_desktop.dart';
import 'package:app/src/pages/mobile/home_page_mobile.dart';
import 'package:app/utils/screen_helper.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ScreenHelper(
      desktop: HomePageDesktop(),
      mobile: HomePageMobile(),
    );
  }
}
