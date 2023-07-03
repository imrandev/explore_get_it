import 'package:explore_get_it/core/db/entity/note.dart';
import 'package:floor/floor.dart';

@dao
abstract class NoteDao {

  @Query('SELECT * FROM Note')
  Future<List<Note>> findAll();

  @Query('SELECT * FROM Note WHERE id = :id')
  Future<Note?> findById(String id);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insert(Note note);

  @Query('DELETE FROM Note WHERE id = :id')
  Future<Note?> delete(int id);

  @Query('DELETE FROM Note')
  Future<void> deleteAll();

  @Query('SELECT COUNT (*) FROM Note')
  Future<int?> getCount();

  @Update(onConflict: OnConflictStrategy.replace)
  Future<void> update(Note note);
}