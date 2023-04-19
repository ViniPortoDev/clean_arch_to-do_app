import 'package:app/src/pages/desktop/home_page_desktop.dart';
import 'package:app/src/pages/mobile/home_page_mobile.dart';
import 'package:app/utils/screen_helper.dart';
import 'package:flutter/material.dart';

import '../../repositories/task_repositories.dart';
import '../../service/prefs_service.dart';
import '../../stores/task_store.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenHelper(
      desktop: HomePageDesktop(
        taskStore: TaskStore(
          TaskDataBaseRepository(
            PrefsLocalStorageService(),
          ),
        ),
      ),
      mobile: const HomePageMobile(),
    );
  }
}
