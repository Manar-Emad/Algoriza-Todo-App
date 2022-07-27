import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/modules/tasks_builder.dart';
import 'package:todo/shared/app_cubit/app_cubit.dart';

class FavouritiesScreen extends StatelessWidget {
  const FavouritiesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
        return BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            var tasks=AppCubit.get(context).favouriteTasks;
            return TasksBuilder(tasks:tasks);
          },
        );
  }
}
