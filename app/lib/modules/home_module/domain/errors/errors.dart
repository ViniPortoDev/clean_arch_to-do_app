abstract class DomainExeption implements Exception {
  final String message;

  const DomainExeption(this.message);
}

class AddTaskError implements DomainExeption {
  @override
  final String message;
  const AddTaskError(this.message);
}

class CompletedTaskError implements DomainExeption {
  @override
  final String message;
  const CompletedTaskError(this.message);
}

class GetTaskListError implements DomainExeption {
  @override
  final String message;
  const GetTaskListError(this.message);
}

class DatasourceError implements DomainExeption {
  @override
  final String message;
  const DatasourceError(this.message);
}
class FireStoreError implements DomainExeption {
  @override
  final String message;
  const FireStoreError(this.message);
}
