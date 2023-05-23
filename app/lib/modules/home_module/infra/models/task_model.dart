import 'dart:convert';
import 'package:app/modules/home_module/domain/entities/task_entity.dart';

class TaskModel extends TaskEntity {
  TaskModel({
    required super.title,
    required super.description,
    required super.date,
    required super.isDone,
  });

  TaskModel copyWith({
    String? title,
    String? description,
    DateTime? date,
    bool? isDone,
  }) {
    return TaskModel(
      title: title ?? this.title,
      description: description ?? this.description,
      date: date ?? this.date,
      isDone: isDone ?? this.isDone,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'date': date.millisecondsSinceEpoch,
      'isDone': isDone,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      title: map['title'] as String,
      description: map['description'] as String,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      isDone: map['isDone'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory TaskModel.fromJson(String source) =>
      TaskModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
