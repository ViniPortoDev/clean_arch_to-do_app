import 'package:app/modules/chat_module/chat_module.dart';
import 'package:app/modules/home_module/home_module.dart';
import 'package:app/modules/info_module/info_module.dart';
import 'package:app/utils/routes.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [


  ];
  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Routes.home, module: HomeModule()),
    ModuleRoute(Routes.chatPage, module: ChatModule()),
    ModuleRoute(Routes.infoPage, module: InfoModule()),
  ];
}
