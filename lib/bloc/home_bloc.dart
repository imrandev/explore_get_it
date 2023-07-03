import 'package:explore_get_it/core/db/app_database.dart';
import 'package:explore_get_it/core/db/entity/note.dart';
import 'package:explore_get_it/core/di/injection.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeBloc {

  final AppDatabase _database = getIt<AppDatabase>();

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
}

class FormValidator {
  final error = ValueNotifier<String?>(null);
}