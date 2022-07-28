import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/modules/tasks_builder.dart';
import 'package:todo/shared/app_cubit/app_cubit.dart';

class CompletedScreen extends StatelessWidget {
  const CompletedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        if (state  is AppCreateDatabaseLoadingState ){
          return const CircularProgressIndicator();
        }
        else {
          return TasksBuilder(tasks: AppCubit.get(context).completedTasks);
        }
      },
    );
  }
}
//test
