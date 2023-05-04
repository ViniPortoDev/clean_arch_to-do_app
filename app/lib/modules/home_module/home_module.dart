import 'package:app/stores/task_store/task_store.dart';
import 'package:app/stores/theme_store/theme_store.dart';
import 'package:app/utils/routes.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [];
  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Routes.home,
      child: (context, args) => HomePage(
        themeStore: Modular.get<ThemeStore>(),
        taskStore: Modular.get<TaskStore>(),
      ),
    ),
  ];
}
