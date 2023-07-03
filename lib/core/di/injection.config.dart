// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:explore_get_it/bloc/home_bloc.dart' as _i4;
import 'package:explore_get_it/core/db/app_database.dart' as _i3;
import 'package:explore_get_it/core/di/app_module.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    await gh.factoryAsync<_i3.AppDatabase>(
      () => appModule.appDatabase,
      preResolve: true,
    );
    gh.singleton<_i4.FormValidator>(appModule.validator);
    gh.factory<_i4.HomeBloc>(() => _i4.HomeBloc());
    return this;
  }
}

class _$AppModule extends _i5.AppModule {}
