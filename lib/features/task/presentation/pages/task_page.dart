import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_tcl_group/features/task/presentation/widgets/list_task.dart';

import '../bloc/task_bloc.dart';

class TaskPage extends StatelessWidget{
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Tracker App'),
        centerTitle: true,
      ),
      body: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          if(state is TaskLoading) {
            return Center(
              child: CircularProgressIndicator(color: Colors.blue.shade400)
            );
          } else if(state is TaskLoaded) {
            return listTasks(context, state);
          } else if(state is TaskEmpty) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.do_not_disturb, color: Colors.blue.shade400, size: 70,),
                Divider(height: 4,),
                Text('Empty', style: TextStyle(color: Colors.grey, fontSize: 18),)
              ],
            );
          }
          return Center(
              child: CircularProgressIndicator(color: Colors.blue.shade400,)
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<TaskBloc>().add(CreateTaskEvent(context));
        },
        child: Icon(Icons.create, size: 30, color: Colors.white,),
      ),
    );
  }
}