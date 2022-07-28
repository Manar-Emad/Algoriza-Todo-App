import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo/modules/board_screen.dart';
import 'package:todo/modules/tabBarScreens/all_screen.dart';
import 'package:todo/modules/tabBarScreens/completed_screen.dart';
import 'package:todo/modules/tabBarScreens/uncompleted_screen.dart';
import 'package:todo/shared/components/navigate.dart';
import 'package:todo/shared/components/snack_bar.dart';
import 'package:todo/shared/constants.dart';
import 'package:todo/shared/styles/colors.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitial());

  static AppCubit get(context) => BlocProvider.of(context);

  late Database database;
  List<Map>tasks = [];
  List<Map>Scudeling = [];
  List<Map>completedTasks = [];
  List<Map>unCompletedTasks = [];
  List<Map>favouriteTasks = [];

  ///create DB
  void createBatabase() {
    openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database, version) {
        debugPrint('database created');
        database.execute(
            'CREATE TABLE tasks(id INTEGER PRIMARY KEY,title TEXT,date TEXT,tstart TEXT,tend TEXT,reminder TEXT,repeat TEXT,status TEXT,fav Text,color TEXT )'
        ).then((value) {
          debugPrint('table created');
        }).catchError((error) {
          debugPrint('error when creating table ${error.toString()}');
        });
      },
      onOpen: (database) {
        getDataFromDataBase(database);

        debugPrint('database opened');
      },
    ).then((value) {
      database = value;
      emit(AppCreateDatabaseState());
    });
  }

  ///insert into DB
  insertToDatabase(BuildContext context, {
    required String title,
    required String date,
    required String tstart,
    required String tend,
    required String repeat,
    required String reminder,
    String? status,
    String? fav,
    String? taskColor,

  }) async {
    print("jjj$taskColor");

    print("manarrrrrrrrrr${database}");
    await database.transaction((txn) async {
      print('uuuuu');
      txn.rawInsert(
          'INSERT INTO tasks(title,date,tstart,tend,reminder,repeat,status,fav,color)VALUES("$title","$date","$tstart","$tend","$reminder","$repeat","new","unfavourite","$taskColor") ')
          .then((value) {
        debugPrint('$value inserted successfully');
        emit(AppInsertDatabaseState());
        getDataFromDataBase(database);
      }).catchError((error) {
        debugPrint('Error When Inserting New Record ${error.toString()}');
      });

      print('$tasks ins');
    });
  }

  ///get data from DB
  void getDataFromDataBase(database) {
    emit(AppCreateDatabaseLoadingState());
    database.rawQuery('SELECT * FROM tasks').then((value) {
      completedTasks = [];
      unCompletedTasks = [];
      favouriteTasks = [];
      print('compeleteTask${completedTasks
          .length}unCompletedTask${unCompletedTasks
          .length}favourite${favouriteTasks.length}');
      tasks = value;
      var i = 1;
      debugPrint('$tasks');

      value.forEach((element) {
        print("asdas ${i++}");
        if (element['fav'] == 'favourite') {
          favouriteTasks.add(element);
        }
        if (element['status'] == 'completed') {
          completedTasks.add(element);
        }
        else if (element['status'] == 'unCompleted') {
          unCompletedTasks.add(element);
        }
        debugPrint(element['status']);
        print('compeleteTask===${completedTasks
            .length}unCompletedTask===${unCompletedTasks
            .length}favourite===${favouriteTasks.length}');
      });
      emit(AppGetDatabaseState());
    });
  }

  ///getData on specific day
  void getDataFromByDataBaseSchedaling(String date) {
    Scudeling = [];

    emit(getScedualingLoading());
    database.rawQuery('SELECT * FROM tasks WHERE date = "$date" ').then((value) {
      Scudeling = value;
      debugPrint('schedule tasks $Scudeling');

      emit(getScedualingsucess());
    });
  }

  ///update Data
  void updateData({
    String? status,
    String? fav,
    required int id,
  }) async {
    if (status != null) {
      database.rawUpdate(
          'UPDATE tasks SET status = ? WHERE id = ?',
          ['${status}', '$id']).then((value) {
        getDataFromDataBase(database);
        emit(AppUpdateDatabaseState());
      });
    }
    else if (fav != null) {
      database.rawUpdate(
          'UPDATE tasks SET fav =? WHERE id = ?',
          ['${fav}', '$id']).then((value) {
        getDataFromDataBase(database);
        emit(AppUpdateDatabaseState());
      });
    }
  }

  ///delete data
  void deleteData({
    required int id,
  }) async {
    database.rawDelete('DELETE FROM tasks WHERE id = ?',
        [id]).then((value) {
      getDataFromDataBase(database);
      emit(AppDeleteDatabaseState());
    });
  }


// List<Color>colors=[
// Colors.amber,
// Colors.blue,
// Colors.teal,
// Colors.red,
// ];
//
//  changeContainerColor(index){
//   Color(index);
//   emit(ChangeColorState());
// }
}
