
import 'package:app/utils/routes.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../repositories/task_repositories.dart';
import '../../service/prefs_service.dart';
import '../../stores/task_store/task_store.dart';
import 'info_page_mobile.dart';

class InfoModule extends Module {
  @override
  final List<Bind> binds = [

  ];
  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Routes.home,
      child: (context, args) => InfoPageMobile(
        taskStore: Modular.get<TaskStore>(),
      ),
    ),
  ];
}
