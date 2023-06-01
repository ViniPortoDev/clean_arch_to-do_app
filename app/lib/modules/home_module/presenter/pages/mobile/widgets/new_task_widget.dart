import 'package:app/modules/home_module/presenter/pages/mobile/widgets/task_error_dialog.dart';
import 'package:flutter/material.dart';
import '../../../../infra/models/task_model.dart';
import '../../../stores/task_store/task_store.dart';



class NewTaskWidget extends StatefulWidget {
  final TaskStore taskStore;

  const NewTaskWidget({
    Key? key,
    required this.taskStore,
  }) : super(key: key);

  @override
  State<NewTaskWidget> createState() => _NewTaskWidgetState();
}

class _NewTaskWidgetState extends State<NewTaskWidget> {
  final formKey = GlobalKey<FormState>();
  TimeOfDay timeOfDay = TimeOfDay.now();
  DateTime dateTime = DateTime.now();
  TextEditingController titleTaskController = TextEditingController();
  TextEditingController descriptionTaskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.width * 1.2,
      child: Form(
        key: formKey,
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
                controller: titleTaskController,
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
                controller: descriptionTaskController,
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
                      final newDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2026),
                      );
                      if (newDate != null) {
                        setState(() {
                          dateTime = newDate;
                        });
                      }
                    },
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    child: const Text('escolha as horas'),
                    onPressed: () async {
                      final newTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );
                      if (newTime != null) {
                        setState(() {
                          final date = dateTime;
                          dateTime = DateTime(
                            date.year,
                            date.month,
                            date.day,
                            newTime.hour,
                            newTime.minute,
                          );
                        });
                      }
                    },
                  )
                ],
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Text(
                    widget.taskStore.dateAndTime(dateTime),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                child: const Text('Salvar'),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    if (dateTime.compareTo(DateTime.now()) == -1) {
                      showDialog(
                        context: context,
                        builder: (context) => const TaskErrorDialog(
                          message: 'Insira a data corretamente!!!',
                        ),
                      );
                    } else {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Adicionando tarefa...'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                      widget.taskStore.addTask(
                        TaskModel(
                          title: titleTaskController.text,
                          description: descriptionTaskController.text,
                          date: dateTime,
                          isDone: false,
                        ),
                      );
                    }
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
