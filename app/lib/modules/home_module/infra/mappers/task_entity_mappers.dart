import 'package:app/modules/home_module/domain/entities/task_entity.dart';

class TaskEntityMappers {
 static Map<String, dynamic> toMap(TaskEntity task) {
    return <String, dynamic>{
      'id' : task.id,
      'title': task.title,
      'description' :task.description,
      'date': task.date.toIso8601String(),
      'isDone': task.isDone,
    };
  }

}
