import 'package:app/modules/chat_module/chat_module.dart';
import 'package:app/modules/home_module/home_module.dart';
import 'package:app/modules/home_module/presenter/stores/theme_store/theme_store.dart';
import 'package:app/utils/routes.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_module/external/service/firestore_service.dart';
import 'home_module/presenter/stores/task_store/task_store.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ThemeStore()),
    Bind.lazySingleton((i) => TaskStore(i(), i(), i())),
    Bind.lazySingleton((i) => FirestoreStorageService()),
  ];
  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Routes.home, module: HomeModule()),
    ModuleRoute(Routes.chatPage, module: ChatModule()),
  ];
}
