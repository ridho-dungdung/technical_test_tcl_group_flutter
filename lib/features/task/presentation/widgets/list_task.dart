import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_tcl_group/features/task/domain/entities/task_entitie.dart';
import 'package:test_tcl_group/features/task/presentation/bloc/task_bloc.dart';
import 'package:test_tcl_group/features/task/presentation/widgets/modal_bottom_sheet_change_status.dart';
import 'package:test_tcl_group/features/task/presentation/widgets/modal_bottom_sheet_delete.dart';

Widget listTasks(BuildContext context, TaskLoaded state) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 40),
    child: ListView.builder(
        itemCount: state.tasks.length,
        itemBuilder: (context, idx) {
          Task task = state.tasks[idx];
          return Card(
            color: Colors.blue.shade100,
            elevation: 2,
            shadowColor: Colors.blue.shade100,
            margin: EdgeInsets.only(top: 14, right: 12, left: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 14, right: 14, top: 12, bottom: 8),
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(task.title,
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          )
                      ),
                      Text(task.status,
                        style: TextStyle(
                            color: state.tasks[idx].status.toLowerCase() == 'pending'
                                ? Colors.red
                                : Colors.lightBlue,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Divider(color: Colors.white, endIndent: 4, indent: 4, thickness: 2,),
                Padding(
                  padding: const EdgeInsets.only(left: 14, right: 14, top: 12, bottom: 12),
                  child: Text(task.description,
                    style: TextStyle(fontSize: 14),
                    textAlign: TextAlign.start,
                  ),
                ),
                // Row(
                //   children: [
                //
                //   ],
                // ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 4, right: 4),
                  child: Row(
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(12),
                                    bottomRight: Radius.circular(4),
                                    topRight: Radius.circular(4),
                                    topLeft: Radius.circular(4)
                                  )
                              )
                          ),
                          onPressed: () async {
                            final result = await showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) => modalBottomSheetDelete(context, task.title)
                            );
                            if(result == null) return;
                            return context.read<TaskBloc>().add(DeleteTaskEvent(task, context));
                          },
                          child: Text('Delete',
                            style: TextStyle(fontSize: 14),
                          )
                      ),
                      VerticalDivider(width: 4, color: Colors.white,),
                      Expanded(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.lightBlue,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(4),
                                        bottomRight: Radius.circular(4),
                                        topRight: Radius.circular(4),
                                        topLeft: Radius.circular(4)
                                    )
                                )
                            ),
                            onPressed: () async {
                              final result = await showModalBottomSheet(
                                  context: context,
                                  builder: (BuildContext context) => modalBottomSheetChangeStatus(context)
                              );
                              if(result == null) return;
                              return context.read<TaskBloc>().add(ChangeStatusEvent(task, result, context));
                            },
                            child: Text('Change Status',
                              style: TextStyle(fontSize: 14),
                            )
                        ),
                      ),
                      VerticalDivider(width: 4, color: Colors.white,),
                      Expanded(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(4),
                                        bottomRight: Radius.circular(12),
                                        topRight: Radius.circular(4),
                                        topLeft: Radius.circular(4)
                                    )
                                )
                            ),
                            onPressed: () {
                              context.read<TaskBloc>().add(DetailsTaskEvent(task, context));
                            },
                            child: Text('Details',
                              style: TextStyle(fontSize: 14),
                            )
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        }
    ),
  );
}