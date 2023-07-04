import 'package:core/session/pref_manager.dart';
import 'package:core/utils/constant.dart';
import 'package:injectable/injectable.dart';

@injectable
class SessionManager {

  final PrefManager _prefManager;

  SessionManager(this._prefManager);

  String? get defaultTheme => _prefManager.getStringValue(Constant.defaultTheme);

  set defaultTheme(String? value) => _prefManager.saveString(Constant.defaultTheme, value ?? Constant.blue);

  int? get defaultLanguage => _prefManager.getIntValue(Constant.defaultLanguage);

  set defaultLanguage(int? value) => _prefManager.saveInt(Constant.defaultLanguage, value ?? Constant.english);

  void logout() => _prefManager.logOut();
}