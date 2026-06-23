import 'package:test_tcl_group/features/task/domain/entities/response_entitie.dart';
import 'package:test_tcl_group/features/task/domain/repositories/task_respository.dart';

import '../entities/task_entitie.dart';

class TaskUseCase {
  final TaskRepository repository;

  TaskUseCase(this.repository);

  Future<List<Task>> all() {
    return repository.getTasks();
  }

  Future<Response> changeStatus(int id, Map<String, dynamic> payload) {
    return repository.updateTask(id, payload);
  }

  Future<Response> createTask(Map<String, dynamic> payload) {
    return repository.createdTask(payload);
  }

  Future<Response> deleteTask(int id) {
    return repository.deletedTask(id);
  }
}