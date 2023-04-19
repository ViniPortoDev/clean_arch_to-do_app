import 'package:design_system/source/themes/extensions/colors_theme.dart';
import 'package:design_system/source/widgets/profile_components/profile_container_info_widget.dart';
import 'package:design_system/source/widgets/task/todo_widget.dart';
import 'package:flutter/material.dart';
import '../../../../states/task_state.dart';
import '../../../../stores/task_store.dart';
import '../../../../utils/image_path.dart';
import '../../mobile/widgets/completed_task_dialog.dart';

class ProfileTodosWidget extends StatefulWidget {
  final TaskStore taskStore;

  const ProfileTodosWidget({Key? key, required this.taskStore})
      : super(key: key);

  @override
  State<ProfileTodosWidget> createState() => _ProfileTodosWidgetState();
}

class _ProfileTodosWidgetState extends State<ProfileTodosWidget> {
  @override
  Widget build(BuildContext context) {
    final colorsTheme = Theme.of(context).extension<ColorsTheme>()!;
    final size = MediaQuery.of(context).size;

    return Container(
      color: colorsTheme.backgroundColor,
      width: size.width * 0.188,
      child: Column(
        children: [
          SizedBox(height: size.height * 0.029),
          const ProfileContainerInfoWidget(
            name: 'Nego Ney',
            description1: 'Chama no zap',
            description2: 'Oi linda aii kawaii',
            imageNetworkAvatar: ImagePath.profileAvatar,
          ),
          ValueListenableBuilder(
            valueListenable: widget.taskStore,
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
                          date: widget.taskStore.dateAndTime(tasks.date),
                          onLongPress: () => widget.taskStore.removeTask(index),
                          overdueTask: widget.taskStore.overdueTask(tasks.date),
                          onTap: () {
                            if (tasks.isDone == false) {
                              showDialog(
                                context: context,
                                builder: (context) => CompletedTaskDialog(
                                  removeTask: () {
                                    widget.taskStore.removeTask(index);
                                    Navigator.pop(context);
                                  },
                                ),
                              );
                            }
                            widget.taskStore.completeTask(
                              index: index,
                              isDone: tasks.isDone,
                            );
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
    );
  }
}
