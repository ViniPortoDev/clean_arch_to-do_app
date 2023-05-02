
import 'package:app/utils/screen_helper.dart';
import 'package:flutter/material.dart';
import '../../stores/task_store/task_store.dart';
import 'desktop/home_page_desktop.dart';
import 'mobile/home_page_mobile.dart';

class HomePage extends StatelessWidget {
  
  final TaskStore taskStore;
  const HomePage({Key? key, required this.taskStore }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenHelperWidget(
      desktop: HomePageDesktop(
        taskStore: taskStore,
      ),
      tablet: const Center(
        child: Text('EM CONSTRUÇÃO'),
      ),
      mobile: const HomePageMobile(),
    );
  }
}