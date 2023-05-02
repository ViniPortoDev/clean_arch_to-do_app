import 'package:flutter/material.dart';

class ThemeStore extends ValueNotifier<ThemeMode> {
  ThemeStore() : super(ThemeMode.dark);

  void changeTheme() {
    if (value == ThemeMode.dark) {
      value = ThemeMode.light;
    } else {
      value = ThemeMode.dark;
    }
  }
}
