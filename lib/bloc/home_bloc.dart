import 'package:explore_get_it/core/db/app_database.dart';
import 'package:explore_get_it/core/db/entity/note.dart';
import 'package:explore_get_it/core/di/injection.dart';
import 'package:explore_get_it/core/session/session_manager.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeBloc {

  final AppDatabase _database = getIt<AppDatabase>();

  final SessionManager _sessionManager = getIt<SessionManager>();

  String title = "";

  String description = "";

  Future<bool> createNote() async {
    if (title.isEmpty){
      getIt<FormValidator>().error.value = "Title cannot be empty";
      return false;
    }
    await _database.noteDao.insert(
      Note(
        null,
        title,
        description,
        DateTime.now().toIso8601String(),
      ),
    );
    return true;
  }

  void clearValidation(){
    getIt<FormValidator>().error.value = null;
  }

  Future<void> deleteNote(int id) async {
    await _database.noteDao.delete(id);
  }

  void changeTheme(String selectedTheme) {
    // change state using ValueNotifier
    getIt<ThemeSelector>().theme.value = selectedTheme;
    _sessionManager.defaultTheme = selectedTheme;
  }

  void changeLanguage(String selectedLang) {
    // change state using ChangeNotifier
    getIt<LanguageSelector>().type = selectedLang == "Bangla" || selectedLang == "বাংলা" ? 1 : 0;
    _sessionManager.defaultLanguage = selectedLang == "Bangla" || selectedLang == "বাংলা" ? 1 : 0;
  }
}

class FormValidator {
  final error = ValueNotifier<String?>(null);
}

class ThemeSelector {
  final theme = ValueNotifier<String>("");
}

@injectable
class LanguageSelector extends ChangeNotifier {

  final SessionManager _sessionManager;

  LanguageSelector(this._sessionManager);

  int _type = 0;

  int get type => _sessionManager.defaultLanguage ?? _type;

  set type(int type){
    _type = type;
    notifyListeners();
  }
}