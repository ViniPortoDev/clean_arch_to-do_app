import 'dart:convert';

import 'package:flutter/material.dart';

class TaskModel {
  final String title;
  final String description;
  final DateTime? date;
  final TimeOfDay? time;

  final String? dateAndTime;
  bool isDone;

  TaskModel({
    required this.title,
    required this.description,
    this.date,
    this.time,
    this.dateAndTime,
    this.isDone = false,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'dateAndTime': dateAndTime,
      'isDone': isDone,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      title: map['title'] as String,
      description: map['description'] as String,
      dateAndTime:
          map['dateAndTime'] != null ? map['dateAndTime'] as String : null,
      isDone: map['isDone'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory TaskModel.fromJson(String source) =>
      TaskModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return '''TaskModel(title: $title, description: $description, dateAndTime: $dateAndTime, isDone: $isDone)''';
  }
}
