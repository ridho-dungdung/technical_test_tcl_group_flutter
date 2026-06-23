import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_tcl_group/core/components/loading_dialog.dart';
import 'package:test_tcl_group/core/components/snackbar_scaffold_error.dart';
import 'package:test_tcl_group/core/components/snackbar_scaffold_success.dart';
import 'package:test_tcl_group/features/task/data/models/task_model.dart';
import 'package:test_tcl_group/features/task/domain/entities/response_entitie.dart';
import 'package:test_tcl_group/features/task/domain/entities/task_entitie.dart';
import 'package:test_tcl_group/features/task/domain/usecases/task_usecase.dart';
import 'package:test_tcl_group/features/task/presentation/pages/task_create_page.dart';
import 'package:test_tcl_group/features/task/presentation/pages/task_details_page.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskUseCase taskUseCase;

  TaskBloc(this.taskUseCase) : super(TaskInitial()) {
    on<FetchTaskEvent>((event, emit) async {
      emit(TaskLoading());
      await Future.delayed(Duration(seconds: 1));
      try{
        final tasks = await taskUseCase.all();

        if(tasks.isEmpty) {
          emit(TaskEmpty());
        } else {
          emit(TaskLoaded(tasks));
        }
      } catch(e) {
        print(e);
      }
    });

    on<ChangeStatusEvent>((event, emit) async {
      loadingDialog(event.context);

      final Task task = event.task;
      final String updateStatus = event.updateStatus;
      Map<String, dynamic> payload = {
        'title': task.title,
        'description': task.description,
        'status': updateStatus
      };

      try{
        final Response response = await taskUseCase.changeStatus(task.id, payload);
        Task taskUpdate = TaskModel.fromJson(response.data);
        Navigator.pop(event.context);
        if(response.success) {
          final currentState = state;
          snackbarScaffoldSuccess(event.context, message: 'Update status');
          if(currentState is TaskLoaded){
            final updateTasks = currentState.tasks
                .map((task) => task.id == taskUpdate.id ? taskUpdate : task)
                .toList();
            emit(TaskLoaded(updateTasks));
          }
        } else {
          snackbarScaffoldError(event.context, message: 'update status failed');
        }
      } catch(err) {
        print(err);
      }
    });

    on<CreateTaskEvent>((event, emit) async {
      final result = await Navigator.of(event.context).push(
        MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: event.context.read<TaskBloc>(),
            child: CreateTaskPage(),
          )
        )
      );

      if(result == null) return;

      loadingDialog(event.context);
      Task taskNew = result;
      Map<String, dynamic> payload = {
        'title': taskNew.title,
        'description': taskNew.description,
        'status': taskNew.status
      };

      try{
        final Response response = await taskUseCase.createTask(payload);
        Task taskUpdate = TaskModel.fromJson(response.data);

        Navigator.pop(event.context);
        if(response.success) {
          final currentState = state;
          snackbarScaffoldSuccess(event.context, message: 'Created task');
          if(currentState is TaskLoaded){
            emit(TaskLoaded([...currentState.tasks, taskUpdate]));
          }
        } else {
          snackbarScaffoldError(event.context, message: 'created task failed');
        }
      } catch(err) {
        print(err);
      }
    });

    on<DeleteTaskEvent>((event, emit) async {
      loadingDialog(event.context);
      Task taskEvent = event.task;

      try{
        final Response response = await taskUseCase.deleteTask(taskEvent.id);

        Navigator.pop(event.context);
        if(response.success) {
          final currentState = state;
          snackbarScaffoldSuccess(event.context, message: 'Deleted task');
          if(currentState is TaskLoaded){
            final updateTasks = currentState.tasks.where((task) => task.id != taskEvent.id).toList();
            emit(TaskLoaded(updateTasks));
          }
        } else {
          snackbarScaffoldError(event.context, message: 'deleted task failed');
        }
      } catch(err) {
        print(err);
      }
    });

    on<DetailsTaskEvent>((event, emit) async {
      final result = await Navigator.of(event.context).push(
          MaterialPageRoute(
              builder: (_) => BlocProvider.value(
                value: event.context.read<TaskBloc>(),
                child: TaskDetailsPage(event.task),
              )
          )
      );

      if(result == null) return;
    });

    on<SelectedStatusEvent>((event, emit) {
      emit(CreateTask(event.status));
    });
  }
}
