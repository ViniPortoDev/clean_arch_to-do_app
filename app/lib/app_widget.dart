import 'package:app/stores/theme_store/theme_store.dart';
import 'package:design_system/source/themes/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeStore = Modular.get<ThemeStore>();
    return ValueListenableBuilder(
      valueListenable: themeStore,
      builder: (context, value, child) => MaterialApp.router(
        routeInformationParser: Modular.routeInformationParser,
        routerDelegate: Modular.routerDelegate,
        debugShowCheckedModeBanner: false,
        theme: Mytheme.customLightTheme,
        darkTheme: Mytheme.customDarkTheme,
        themeMode: themeStore.value,
      ),
    );
  }
}
