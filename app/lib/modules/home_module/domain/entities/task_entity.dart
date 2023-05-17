import 'dart:convert';

class TaskEntity {
  final int? id;
  final String title;
  final String description;
  final DateTime date;
  final bool isDone;

  const TaskEntity({
    this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.isDone,
  });

  TaskEntity copyWith({
    String? title,
    String? description,
    DateTime? date,
    bool? isDone,
  }) {
    return TaskEntity(
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

  factory TaskEntity.fromMap(Map<String, dynamic> map) {
    return TaskEntity(
      title: map['title'] as String,
      description: map['description'] as String,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      isDone: map['isDone'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory TaskEntity.fromJson(String source) =>
      TaskEntity.fromMap(json.decode(source) as Map<String, dynamic>);


}
