import 'package:flutter/material.dart';
import 'package:test_tcl_group/features/task/domain/entities/task_entitie.dart';

class TaskDetailsPage extends StatefulWidget{
  Task task;

  TaskDetailsPage(this.task, {super.key,});

  @override
  State<TaskDetailsPage> createState() => _TaskDetailsPageState();
}

class _TaskDetailsPageState extends State<TaskDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Details'),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 12, bottom: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(text: TextSpan(
                      children: [
                        TextSpan(
                            text: 'Title : ',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)
                        ),
                        TextSpan(
                            text: widget.task.title,
                            style: TextStyle(fontSize: 18, color: Colors.black)
                        ),
                      ]
                  )),
                  Divider(height: 8,),
                  RichText(text: TextSpan(
                      children: [
                        TextSpan(
                            text: 'Status : ',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)
                        ),
                        TextSpan(
                            text: widget.task.status,
                            style: TextStyle(fontSize: 18, color: Colors.black)
                        ),
                      ]
                  )),
                ],
              ),
            ),
            Divider(height: 16, color: Colors.grey, indent: 8, endIndent: 8,),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Column(
                  children: [
                    Text('Description : ',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)
                    ),
                    Text(widget.task.description,
                        style: TextStyle(fontSize: 18, color: Colors.black)
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}