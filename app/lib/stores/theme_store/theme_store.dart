import 'package:flutter/material.dart';

class ThemeStore extends ValueNotifier<ThemeMode> {
  final toggle = ValueNotifier(true);
  ThemeStore() : super(ThemeMode.dark);

  void changeTheme() {
    toggle.value = !toggle.value;
    print(toggle.value);

    if (toggle.value == true) {
      value = ThemeMode.dark;
    } else {
      value = ThemeMode.light;
    }
    print(value);
  }
}
