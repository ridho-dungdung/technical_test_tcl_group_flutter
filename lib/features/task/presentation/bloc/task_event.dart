part of 'task_bloc.dart';

sealed class TaskEvent {}

class FetchTaskEvent extends TaskEvent {}

class ChangeStatusEvent extends TaskEvent {
  final Task task;
  String updateStatus;
  BuildContext context;

  ChangeStatusEvent(this.task, this.updateStatus, this.context);
}

class CreateTaskEvent extends TaskEvent {
  BuildContext context;

  CreateTaskEvent(this.context);
}

class DeleteTaskEvent extends TaskEvent {
  final Task task;
  BuildContext context;

  DeleteTaskEvent(this.task, this.context);
}

class SelectedStatusEvent extends TaskEvent {
  String status;

  SelectedStatusEvent(this.status);
}

class DetailsTaskEvent extends TaskEvent {
  final Task task;
  BuildContext context;

  DetailsTaskEvent(this.task, this.context);
}
