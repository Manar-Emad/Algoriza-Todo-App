import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/modules/board_screen.dart';
import 'package:todo/shared/app_cubit/app_cubit.dart';
import 'my_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  BlocOverrides.runZoned(
    () {AppCubit();},
    blocObserver: MyBlocObserver(),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppCubit>(
            create: (context) => AppCubit()..createBatabase()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BoardScreen(),
      ),
    );
  }
}
