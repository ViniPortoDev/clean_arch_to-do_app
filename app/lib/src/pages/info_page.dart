import 'package:app/src/controller/controller.dart';
import 'package:app/states/task_error_state.dart';
import 'package:app/states/task_loading_state.dart';
import 'package:app/states/task_sucess_state.dart';
import 'package:app/stories/task_story.dart';
import 'package:app/utils/image_path.dart';
import 'package:design_system/source/themes/extensions/colors_theme.dart';
import 'package:design_system/source/widgets/profile_components/profile_container_info_widget.dart';
import 'package:design_system/source/widgets/task/todo_widget.dart';
import 'package:flutter/material.dart';
import '../../service/prefs_service.dart';


class InfoPage extends StatefulWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  void initState() {
    super.initState();
    store.prefsLoad();
    controller.addListener(() {
      setState(() {});
    });
  }

  final store = TaskStory(PrefsService());
  final controller = Controller();
  @override
  Widget build(BuildContext context) {
    final colorsTheme = Theme.of(context).extension<ColorsTheme>()!;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: colorsTheme.backgroundSelectedColor,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return NewTaskWidget(
                controller: controller,
              );
            },
          );
        },
        child: Icon(
          Icons.add,
          size: size.width * 0.064,
        ),
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
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.048,
                ),
                child: ValueListenableBuilder(
                  valueListenable: store,
                  builder: (_, state, __) {
                    if (state is TaskLoadingState) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (state is TaskErrorState) {
                      return Center(
                        child: Text(state.message),
                      );
                    }
                    if (state is TaskSucessState) {
                      return ListView.builder(
                        padding: EdgeInsets.only(
                          top: size.width * 0.064,
                          bottom: size.width * 0.021,
                        ),
                        itemCount: state.tasks.length,
                        itemBuilder: (BuildContext context, int index) {
                          final taskList = state.tasks[index];
                          return TodoWidget(
                            title: taskList.title,
                            description: taskList.description,
                            dateAndTime: taskList.dateAndTime,
                            isDone: taskList.isDone,
                            onTap: () {
                              setState(() {
                                taskList.isDone = !taskList.isDone;
                              });
                            },
                          );
                        },
                      );
                    }
                    return Container();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class NewTaskWidget extends StatefulWidget {
  final Controller controller;

  const NewTaskWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<NewTaskWidget> createState() => _NewTaskWidgetState();
}

class _NewTaskWidgetState extends State<NewTaskWidget> {
  final formKey = GlobalKey<FormState>();
  // ValueNotifier oi = ValueNotifier(_value)
  TextEditingController titleTaskController = TextEditingController();
  TextEditingController descriptionTaskController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.width * 0.9,
      child: Form(
        key: widget.controller.formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Titulo:'),
              const SizedBox(height: 8),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                  ),
                ),
                controller: widget.controller.titleTaskController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor insira um titulo válido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              const Text('Descrição:'),
              const SizedBox(height: 8),
              TextFormField(
                controller: widget.controller.descriptionTaskController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor insira uma descrição válida';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      widget.controller.newDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2026),
                      );
                      if (widget.controller.newDate != null) {
                        setState(() {
                          widget.controller.dateTime =
                              widget.controller.newDate!;
                        });
                      }
                    },
                    child: const Text('escolha a data'),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () async {
                      widget.controller.newTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );
                      if (widget.controller.newTime != null) {
                        setState(() {
                          widget.controller.timeOfDay =
                              widget.controller.newTime!;
                        });
                      }
                    },
                    child: const Text('escolha as horas'),
                  )
                ],
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Visibility(
                    visible: widget.controller
                        .showInitialDate(widget.controller.dateTime),
                    child: Text(
                      widget.controller.formatedDate(),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Visibility(
                    visible: widget.controller
                        .showInitialTime(widget.controller.timeOfDay),
                    child: Text(widget.controller.formatedTime()),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                child: const Text('Salvar'),
                onPressed: () {
                  if (widget.controller.formKey.currentState!.validate()) {
                    widget.controller.addTask();
                    widget.controller.cleanFields();
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Adicionando tarefa...'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

