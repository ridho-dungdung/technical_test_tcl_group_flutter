import 'package:test_tcl_group/core/network.dart';
import 'package:test_tcl_group/features/task/data/models/response_model.dart';
import 'package:test_tcl_group/features/task/data/models/task_model.dart';
import 'package:test_tcl_group/features/task/domain/entities/response_entitie.dart';

class TaskApiDatasource {
  Future<List<TaskModel>> getTasks() async {
    return await DioClient().get('/api/tasks')
        .then((res) => List.from(res['data']
        .map((json) => TaskModel.fromJson(json))));
  }
  
  Future<Response> updateTask(int id, Map<String, dynamic> payload) async {
    return await DioClient()
        .put('/api/task/$id', data: payload)
        .then((res) => ResponseModel.fromJson(res));
  }

  Future<Response> createdTask(Map<String, dynamic> payload) async {
    return await DioClient()
        .post('/api/task', data: payload)
        .then((res) => ResponseModel.fromJson(res));
  }

  Future<Response> deletedTask(int id) async {
    return await DioClient()
        .delete('/api/task/$id')
        .then((res) => ResponseModel.fromJson(res));
  }
}