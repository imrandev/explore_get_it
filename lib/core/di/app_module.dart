import 'package:explore_get_it/bloc/home_bloc.dart';
import 'package:explore_get_it/core/db/app_database.dart';
import 'package:explore_get_it/core/utils/constant.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {
  @preResolve // or @singleton
  Future<AppDatabase> get appDatabase async => await $FloorAppDatabase.databaseBuilder(Constant.db).build();

  @singleton
  FormValidator get validator => FormValidator();
}