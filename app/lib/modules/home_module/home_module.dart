import 'package:app/modules/home_module/presenter/pages/components/mobile/info_page_mobile.dart';
import 'package:app/stores/task_store/task_store.dart';
import 'package:app/stores/theme_store/theme_store.dart';
import 'package:app/utils/routes.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'presenter/pages/home_page.dart';

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
    ChildRoute(
      Routes.profilePage,
      child: (context, args) => ProfileMobilePage(
        taskStore: Modular.get<TaskStore>(),
      ),
    ),
  ];
}
