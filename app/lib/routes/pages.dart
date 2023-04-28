import 'package:app/modules/repositories/task_repositories.dart';
import 'package:app/service/prefs_service.dart';
import 'package:app/src/pages/home_page.dart';
import 'package:app/utils/routes.dart';
import 'package:flutter/material.dart';
import '../modules/stores/task_store.dart';
import '../src/pages/mobile/chat_page_mobile.dart';
import '../src/pages/mobile/info_page_mobile.dart';

class Pages {
  static Map<String, Widget Function(BuildContext)> pages = {
    Routes.home: (context) => const HomePage(),
    Routes.chatPage: (context) => const ChatPageMobile(),
    Routes.infoPage: (context) => InfoPageMobile(
          taskStore: TaskStore(
            TaskDataBaseRepository(
              PrefsLocalStorageService(),
            ),
          ),
        ),
  };
}
