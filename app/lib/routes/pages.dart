import 'package:app/repositories/task_repositories.dart';
import 'package:app/service/prefs_service.dart';
import 'package:app/src/pages/chat_page.dart';

import 'package:app/src/pages/info_page.dart';
import 'package:app/stores/task_store.dart';
import 'package:app/utils/routes.dart';
import 'package:flutter/material.dart';

import '../src/pages/home_page.dart';

class Pages {
  static Map<String, Widget Function(BuildContext)> pages = {
    Routes.home: (context) => const HomePage(),
    Routes.infoPage: (context) => InfoPage(
          taskStore: TaskStore(
            TaskDataBaseRepository(
              PrefsLocalStorageService(),
            ),
          ),
        ),
    Routes.chatPage: (context) => const ChatPage(),
  };
}
