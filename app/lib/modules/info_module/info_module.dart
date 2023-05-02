import 'package:app/modules/pages/mobile/info_page_mobile.dart';
import 'package:app/utils/routes.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../repositories/task_repositories.dart';
import '../../service/prefs_service.dart';
import '../../stores/task_store.dart';

class InfoModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => TaskStore(i())),
    Bind.lazySingleton((i) => TaskDataBaseRepository(i())),
    Bind.lazySingleton((i) => PrefsLocalStorageService()),
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
