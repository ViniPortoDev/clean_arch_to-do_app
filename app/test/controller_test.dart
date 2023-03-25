import 'package:app/src/controller/controller.dart';
import 'package:app/src/models/task_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
    final controller = Controller();
 
  final testTasks = <TaskModel>[
    TaskModel(
      title: 'tarefa sexta-feira',
      description: 'tarefa 1',
      date: DateTime(2023, 3, 30),
      time: const TimeOfDay(hour: 1,minute: 5),
    ),
    TaskModel(
      title: 'tarefa segunda-feira',
      description: 'tarefa 2',
      date: DateTime(2023, 3, 25),
       time: const TimeOfDay(hour: 1,minute: 5),
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
