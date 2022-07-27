import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/modules/tasks_builder.dart';
import 'package:todo/shared/app_cubit/app_cubit.dart';
import 'package:todo/shared/components/user_item.dart';
import 'package:todo/shared/constants.dart';
import 'package:todo/shared/constants.dart';

class AllScreen extends StatelessWidget {
  const AllScreen({Key? key,}) : super(key: key);


  @override
  Widget build(BuildContext context) {
        return BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var tasks=AppCubit.get(context).tasks;
            return RefreshIndicator(
                onRefresh: () async {
                  AppCubit.get(context).getDataFromDataBase(AppCubit.get(context).database);
                },
                child: TasksBuilder(tasks:tasks));
          },
        );
  }
}
