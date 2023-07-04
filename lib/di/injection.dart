import 'package:core/di/injection.dart';
import 'package:core/injectable.dart';
import 'injection.config.dart';

@InjectableInit()
Future<void> configureDependencies() async {
  await configureCoreDependencies();
  getIt.init();
}