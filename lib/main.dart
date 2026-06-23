import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_tcl_group/core/themes/theme_light.dart';
import 'package:test_tcl_group/features/task/data/datasources/task_api_datasource.dart';
import 'package:test_tcl_group/features/task/data/repositories/task_repository_impl.dart';
import 'package:test_tcl_group/features/task/domain/usecases/task_usecase.dart';
import 'package:test_tcl_group/features/task/presentation/pages/task_page.dart';

import 'features/task/presentation/bloc/task_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task Tracker App',
      theme: themeLight,
      home: BlocProvider(
        create: (context) => TaskBloc(
            TaskUseCase(TaskRepositoryImpl(TaskApiDatasource()))
        )..add(FetchTaskEvent()),
        child: TaskPage(),
      ),
    );
  }
}
