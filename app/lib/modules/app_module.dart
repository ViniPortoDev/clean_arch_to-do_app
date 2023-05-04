import 'package:app/modules/chat_module/chat_module.dart';
import 'package:app/modules/home_module/home_module.dart';
import 'package:app/modules/info_module/info_module.dart';
import 'package:app/stores/theme_store/theme_store.dart';
import 'package:app/utils/routes.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../repositories/task_repositories.dart';
import '../service/prefs_service.dart';
import '../stores/task_store/task_store.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ThemeStore()),
    Bind.lazySingleton((i) => TaskStore(i())),
    Bind.lazySingleton((i) => TaskDataBaseRepository(i())),
    Bind.lazySingleton((i) => PrefsLocalStorageService()),
  ];
  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Routes.home, module: HomeModule()),
    ModuleRoute(Routes.chatPage, module: ChatModule()),
    ModuleRoute(Routes.infoPage, module: InfoModule()),
  ];
}
