part of 'task_bloc.dart';

sealed class TaskState {

}

class TaskInitial extends TaskState {}

class TaskLoading extends TaskState {}

class TaskLoaded extends TaskState {
  final List<Task> tasks;
  TaskLoaded(this.tasks);

  TaskLoaded copyWith(List<Task>? tasks) {
    return TaskLoaded(tasks ?? this.tasks);
  }

  @override
  List<Object?> get props => [tasks];
}

class TaskEmpty extends TaskState {}

class CreateTask extends TaskState {
  String status;

  CreateTask(this.status);
}

// class TaskError extends TaskState {}
