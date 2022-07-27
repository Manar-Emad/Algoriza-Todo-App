import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo/modules/add_task_screen.dart';
import 'package:todo/modules/schedule_screen.dart';
import 'package:todo/modules/tabBarScreens/all_screen.dart';
import 'package:todo/modules/tabBarScreens/completed_screen.dart';
import 'package:todo/modules/tabBarScreens/favourities_screen.dart';
import 'package:todo/modules/tabBarScreens/uncompleted_screen.dart';
import 'package:todo/shared/app_cubit/app_cubit.dart';
import 'package:todo/shared/components/buttons.dart';
import 'package:todo/shared/components/divider.dart';
import 'package:todo/shared/components/navigate.dart';
import 'package:todo/shared/constants.dart';
import 'package:todo/shared/styles/colors.dart';
import 'package:todo/shared/styles/styles.dart';

class BoardScreen extends StatelessWidget {
  const  BoardScreen({Key? key,}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is AppCreateDatabaseState ){
          print("database AppCreateDatabaseState manar test");
        }

        if (state is AppGetDatabaseState ){
          print("database opened manar test");
        }

        if(state is AppInsertDatabaseState){
          print("manar before navigate");
          navigateTo(context, BoardScreen());
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: DefaultTabController(
            length: 4,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      top: 30, bottom: 20, right: 10, left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Board', style: black20bold(),),
                      IconButton(onPressed: () {
                        navigateTo(context, ScheduleScreen());
                      }, icon: const Icon(Icons.calendar_today_outlined))
                    ],),
                ),
                const MyDivider(),
                Container(
                  child: const TabBar(
                      indicatorWeight: 2,
                      indicatorPadding: EdgeInsets.symmetric(
                          horizontal: 30.0),
                      indicatorColor: secondColor,
                      labelColor: secondColor,
                      unselectedLabelColor: greyColor,
                      tabs: [
                        Tab(text: 'All'),
                        Tab(text: 'Completed'),
                        Tab(text: 'UnCompleted'),
                        Tab(text: 'Favourities'),
                      ]),
                ),
                const MyDivider(),
                const Expanded(
                  child: TabBarView(
                      children: [
                        AllScreen(),
                        CompletedScreen(),
                        UnCompletedScreen(),
                        FavouritiesScreen(),
                      ]),
                ),
                DefaultButton(onTap: () {
                  ///AppCubit.get(context).insertTaskData();
                  navigateTo(context, AddTaskScreen());
                }, text: 'Add a task'),
              ],
            ),
          ),

        );
      },
    );
  }


}
