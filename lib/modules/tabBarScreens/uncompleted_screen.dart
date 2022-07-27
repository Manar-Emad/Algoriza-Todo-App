import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/modules/tasks_builder.dart';
import 'package:todo/shared/app_cubit/app_cubit.dart';

class UnCompletedScreen extends StatelessWidget {
  const UnCompletedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
        return BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            var tasks=AppCubit.get(context).unCompletedTasks;
            return TasksBuilder(tasks:tasks);
          },
        );
  }
}
