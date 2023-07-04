import 'package:explore_get_it/bloc/home_bloc.dart';
import 'package:core/injectable.dart';

@module
abstract class GetItAppModule {

  @singleton
  FormValidator get validator => FormValidator();

  @singleton
  ThemeSelector get themeSelector => ThemeSelector();
}