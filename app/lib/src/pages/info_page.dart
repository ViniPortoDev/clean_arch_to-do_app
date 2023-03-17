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
        onPressed: () => showModalBottomSheet(
          context: context,
          builder: (context) {
            return NewTaskWidget(controller: controller);
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
              valueListenable: controller.taskList,
              builder: (cont, taskList, __) => Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.048),
                  child: ListView.builder(
                    padding: EdgeInsets.only(
                      top: size.width * 0.064,
                      bottom: size.width * 0.021,
                    ),
                    itemCount: taskList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return TodoWidget(
                        title: taskList[index].title,
                        description: taskList[index].description,
                        dateAndTime: taskList[index].dateAndTime,
                        isDone: taskList[index].isDone,
                        onTap: () => setState(
                          () =>
                              taskList[index].isDone = !taskList[index].isDone,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

///
///
///
///
///
///

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
      height: size.width * 1.2,
      child: Form(
        key: widget.controller.formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Titulo:'),
              const SizedBox(height: 4),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(14),
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
              const Text('Descrição:'),
              const SizedBox(height: 4),
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
                      Radius.circular(14),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  ElevatedButton(
                    child: const Text('escolha a data'),
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
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    child: const Text('escolha as horas'),
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
                  )
                ],
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Text(widget.controller.formatedDate()),
                  const SizedBox(width: 12),
                  Text(widget.controller.formatedTime()),
                  const SizedBox(width: 30),
                  // Text(widget.controller.validatorTask())
                ],
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                child: const Text('Salvar'),
                onPressed: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Adicionando tarefa...'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                  widget.controller.addTask();
                  // widget.controller.cleanFields();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
