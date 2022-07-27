part of 'app_cubit.dart';

@immutable
abstract class AppStates {}

class AppInitial extends AppStates {}

class AppCreateDatabaseState extends AppStates {}

class AppCreateDatabaseLoadingState extends AppStates {}

class AppGetDatabaseState extends AppStates {}

class AppInsertDatabaseState extends AppStates {}

class AppUpdateDatabaseState extends AppStates {}

class AppDeleteDatabaseState extends AppStates {}

class ChangeColorState extends AppStates {}
