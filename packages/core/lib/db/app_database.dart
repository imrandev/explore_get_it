import 'dart:async';

import 'package:core/db/dao/note_dao.dart';
import 'package:core/db/entity/note.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart';

@Database(version: 1, entities: [Note])
abstract class AppDatabase extends FloorDatabase {

  NoteDao get noteDao;
}