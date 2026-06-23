import 'package:test_tcl_group/features/task/domain/entities/response_entitie.dart';
import 'package:test_tcl_group/features/task/domain/entities/task_entitie.dart';

abstract class TaskRepository {
  Future<List<Task>> getTasks();
  Future<Response> updateTask(int id, Map<String, dynamic> payload);
  Future<Response> createdTask(Map<String, dynamic> payload);
  Future<Response> deletedTask(int id);
}