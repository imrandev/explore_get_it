// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:core/db/app_database.dart' as _i3;
import 'package:core/di/app_module.dart' as _i8;
import 'package:core/lang/language_factory.dart' as _i4;
import 'package:core/session/pref_manager.dart' as _i6;
import 'package:core/session/session_manager.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i5;

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
    gh.factory<_i4.LanguageFactory>(() => _i4.LanguageFactory());
    await gh.factoryAsync<_i5.SharedPreferences>(
      () => appModule.prefs,
      preResolve: true,
    );
    gh.factory<_i6.PrefManager>(
        () => _i6.PrefManager(gh<_i5.SharedPreferences>()));
    gh.factory<_i7.SessionManager>(
        () => _i7.SessionManager(gh<_i6.PrefManager>()));
    return this;
  }
}

class _$AppModule extends _i8.AppModule {}
