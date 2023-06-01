
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

}
