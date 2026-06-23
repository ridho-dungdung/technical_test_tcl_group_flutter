import 'package:flutter/material.dart';
import 'package:test_tcl_group/features/task/domain/entities/task_entitie.dart';

class CreateTaskPage extends StatelessWidget{
  const CreateTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CreateTask();
  }
}

class CreateTask extends StatefulWidget{
  const CreateTask({super.key,});

  @override
  State<CreateTask> createState() => CreateTaskState();
}

class CreateTaskState extends State<CreateTask> {
  String? selected;
  final form = GlobalKey<FormState>();
  final title = TextEditingController();
  final description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Task',),
      ),
      body: Form(
        key: form,
        child: Padding(
          padding: const EdgeInsets.only(top: 18, right: 14, left: 14),
          child: Column(
            children: [
              TextFormField(
                controller: title,
                decoration: InputDecoration(
                  labelText: 'Title',
                  hintText: 'Enter title task',
                  prefixIcon: Icon(Icons.drive_file_rename_outline),
                  prefixIconColor: Colors.blue,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide(color: Colors.lightBlue)
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide(color: Colors.lightBlue)
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Title is required';
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
              ),
              Divider(height: 14,),
              TextFormField(
                controller: description,
                decoration: InputDecoration(
                  labelText: 'Description',
                  hintText: 'Enter description task',
                  prefixIcon: Icon(Icons.note_alt_outlined),
                  prefixIconColor: Colors.blue,

                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide(color: Colors.lightBlue)
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide(color: Colors.lightBlue)
                  ),
                ),
                minLines: 2,
                maxLines: 2,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Description is required';
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
              ),
              Divider(height: 14,),
              DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Status Task',
                    prefixIcon: Icon(Icons.task),
                    prefixIconColor: Colors.lightBlue,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(color: Colors.lightBlue)
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(color: Colors.lightBlue)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: const BorderSide(color: Colors.lightBlue, width: 2),
                    ),
                  ),
                  validator: (String? value) {
                    if (value == null || value == '') {
                      return 'Status is required';
                    }
                    return null;
                  },
                  items: ['Pending', 'Done'].map((String value) => DropdownMenuItem<String>(
                      value: value,
                      child: Text(value)
                  )).toList(),
                  onChanged: (String? value) {
                    print('COGSS ${value}');
                    if(value != null) {
                      setState(() {
                        selected = value;
                      });
                    }
                  }
              )
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        color: Colors.white,
        padding: EdgeInsets.only(bottom: 44, left: 14, right: 14),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14)
                      )
                  ),
                  onPressed: () {
                    if(form.currentState!.validate()){
                      Navigator.pop(context,
                        Task(id: 0, title: title.value.text, description: description.value.text, status: selected!));
                    }
                  },
                  child: Text('Save',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}