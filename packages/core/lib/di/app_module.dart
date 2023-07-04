import 'package:core/db/app_database.dart';
import 'package:core/utils/constant.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class AppModule {

  @preResolve
  Future<SharedPreferences> get prefs async => await SharedPreferences.getInstance();

  @preResolve // or @singleton
  Future<AppDatabase> get appDatabase async => await $FloorAppDatabase.databaseBuilder(Constant.db).build();
}