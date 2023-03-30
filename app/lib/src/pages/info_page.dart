import 'package:app/src/controller/controller.dart';
import 'package:app/src/pages/widgets/completed_task_dialog.dart';
import 'package:app/src/pages/widgets/new_task_widget.dart';
import 'package:app/stores/task_story.dart';
import 'package:app/utils/image_path.dart';
import 'package:design_system/source/themes/extensions/colors_theme.dart';
import 'package:design_system/source/widgets/profile_components/profile_container_info_widget.dart';
import 'package:design_system/source/widgets/task/todo_widget.dart';
import 'package:flutter/material.dart';

import '../../states/task_state.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  void initState() {
    super.initState();
    store.loadTasks();
  }

  final store = TaskStore(controller: Controller());

  @override
  Widget build(BuildContext context) {
    final colorsTheme = Theme.of(context).extension<ColorsTheme>()!;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: colorsTheme.backgroundSelectedColor,
        onPressed: () => showModalBottomSheet(
          context: context,
          builder: (context) {
            return NewTaskWidget(
              store: store,
            );
          },
        ),
        child: Icon(Icons.add, size: size.width * 0.064),
      ),
      body: Container(
        color: colorsTheme.backgroundColor,
        height: size.height,
        child: Column(
          children: [
            const ProfileContainerInfoWidget(
              name: 'Nego Ney',
              description1: 'Chama no zap',
              description2: 'Oi linda aii kawaii',
              imageNetworkAvatar: ImagePath.profileAvatar,
            ),
            ValueListenableBuilder(
              valueListenable: store,
              builder: (_, taskList, __) {
                if (taskList is TaskLoadingState) {
                  return const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                if (taskList is TaskErrorState) {
                  return Expanded(child: Center(child: Text(taskList.message)));
                }
                if (taskList is TaskSucessState) {
                  return Expanded(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.048),
                      child: ListView.separated(
                        separatorBuilder: (context, index) =>
                            const Divider(color: Colors.transparent),
                        padding: EdgeInsets.only(
                          top: size.width * 0.064,
                          bottom: size.width * 0.021,
                        ),
                        itemCount: taskList.tasks.length,
                        itemBuilder: (BuildContext context, int index) {
                          final tasks = taskList.tasks[index];
                          return TodoWidget(
                            title: tasks.title,
                            description: tasks.description,
                            isDone: tasks.isDone,
                            date: store.controller.dateAndTime(tasks.date),
                            onLongPress: () => store.removeTask(index),
                            onTap: () {
                              if (tasks.isDone == false) {
                                showDialog(
                                  context: context,
                                  builder: (context) => CompletedTaskDialog(
                                    removeTask: () {
                                      store.removeTask(index);
                                      Navigator.pop(context);
                                    },
                                  ),
                                );
                              }
                              store.completeTask(index);
                            },
                          );
                        },
                      ),
                    ),
                  );
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
