import 'package:app/src/controller/controller.dart';
import 'package:app/src/models/task_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final controller = Controller();

  final testTasks = <TaskModel>[
    TaskModel(
      title: 'tarefa sexta-feira',
      description: 'tarefa 1',
      date: DateTime(2023, 3, 30),
      isDone: false,
    ),
    TaskModel(
      title: 'tarefa segunda-feira',
      description: 'tarefa 2',
      date: DateTime(2023, 3, 25),
      isDone: false,
    ),
  ];
  final orderedList = controller.sortList(testTasks);
  test('A lista deve vim ordenada por data', () {
    expect(
      orderedList[0].title,
      'tarefa segunda-feira',
    );
  });
}
