// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:core/session/session_manager.dart' as _i4;
import 'package:explore_get_it/bloc/home_bloc.dart' as _i3;
import 'package:explore_get_it/di/app_module.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final getItAppModule = _$GetItAppModule();
    gh.singleton<_i3.FormValidator>(getItAppModule.validator);
    gh.factory<_i3.HomeBloc>(() => _i3.HomeBloc());
    gh.factory<_i3.LanguageSelector>(
        () => _i3.LanguageSelector(gh<_i4.SessionManager>()));
    gh.singleton<_i3.ThemeSelector>(getItAppModule.themeSelector);
    return this;
  }
}

class _$GetItAppModule extends _i5.GetItAppModule {}
