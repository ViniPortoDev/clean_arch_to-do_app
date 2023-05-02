import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import '../../../../stores/states/task_state.dart';
import '../../../../stores/task_store.dart';
import '../../../../utils/image_path.dart';
import '../../mobile/widgets/completed_task_dialog.dart';
import '../../mobile/widgets/new_task_widget.dart';

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

    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          color: colorsTheme.backgroundColor,
          height: size.height * 0.9,
          width: size.width * 0.188,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
              child: Column(
                children: [
                  SizedBox(height: size.height * 0.029),
                  ProfileContainerInfoWidget(
                    width: size.width * 0.17,
                    height: size.height * 0.298,
                    borderRadius: 22,
                    name: 'Nego Ney',
                    description1: 'Chama no zap',
                    description2: 'Oi linda aii kawaii',
                    imageNetworkAvatar: ImagePath.profileAvatar,
                  ),
                  SizedBox(height: size.height * 0.017),
                  const ExpansionWidget(
                    title: 'Attachments',
                    childHeight: 0,
                    itemCount: 0,
                  ),
                  SizedBox(height: size.height * 0.017),
                  const ExpansionWidget(
                    title: 'Links',
                    childHeight: 0,
                    itemCount: 0,
                  ),
                  SizedBox(height: size.height * 0.017),
                  const ExpansionWidget(
                    title: 'All Vacancies',
                    childHeight: 0,
                    itemCount: 0,
                  ),
                  SizedBox(height: size.height * 0.017),
                  const ExpansionWidget(
                    title: 'Appointments',
                    childHeight: 0,
                    itemCount: 0,
                  ),
                  ValueListenableBuilder(
                    valueListenable: widget.taskStore,
                    builder: (_, taskList, __) {
                      if (taskList is TaskLoadingState) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (taskList is TaskErrorState) {
                        return Center(child: Text(taskList.message));
                      }
                      if (taskList is TaskSucessState) {
                        return ListView.separated(
                          shrinkWrap: true,
                          separatorBuilder: (context, index) =>
                              const Divider(color: Colors.transparent),
                          padding: EdgeInsets.only(
                            top: size.height * 0.032,
                            bottom: size.height * 0.032,
                          ),
                          itemCount: taskList.tasks.length,
                          itemBuilder: (BuildContext context, int index) {
                            final tasks = taskList.tasks[index];
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.012,
                              ),
                              child: TodoWidget(
                                title: tasks.title,
                                description: tasks.description,
                                isDone: tasks.isDone,
                                date: widget.taskStore.dateAndTime(tasks.date),
                                onLongPress: () =>
                                    widget.taskStore.removeTask(index),
                                overdueTask:
                                    widget.taskStore.overdueTask(tasks.date),
                                taskHeight: size.height * 0.09,
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
                              ),
                            );
                          },
                        );
                      }
                      return Container();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: FloatingActionButton(
            backgroundColor: colorsTheme.backgroundSelectedColor,
            child: const Icon(Icons.add),
            onPressed: () => showModalBottomSheet(
              context: context,
              builder: (context) {
                return NewTaskWidget(taskStore: widget.taskStore);
              },
            ),
          ),
        )
      ],
    );
  }
}
