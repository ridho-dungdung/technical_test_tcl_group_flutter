import 'package:test_tcl_group/features/task/data/datasources/task_api_datasource.dart';
import 'package:test_tcl_group/features/task/domain/entities/response_entitie.dart';
import 'package:test_tcl_group/features/task/domain/entities/task_entitie.dart';
import 'package:test_tcl_group/features/task/domain/repositories/task_respository.dart';

class TaskRepositoryImpl extends TaskRepository{
  final TaskApiDatasource apiDatasource;

  TaskRepositoryImpl(this.apiDatasource);

  @override
  Future<List<Task>> getTasks() async {
    return apiDatasource.getTasks();
  }

  @override
  Future<Response> updateTask(int id, Map<String, dynamic> payload) async {
    return apiDatasource.updateTask(id, payload);
  }

  @override
  Future<Response> createdTask(Map<String, dynamic> payload) async {
    return apiDatasource.createdTask(payload);
  }

  @override
  Future<Response> deletedTask(int id) async {
    return apiDatasource.deletedTask(id);
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}


