import 'package:explore_get_it/bloc/home_bloc.dart';
import 'package:explore_get_it/core/db/app_database.dart';
import 'package:explore_get_it/core/db/entity/note.dart';
import 'package:explore_get_it/core/di/injection.dart';
import 'package:explore_get_it/ui/create_note_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

class HomePage extends StatelessWidget with GetItMixin {

  final AppDatabase _database = getIt<AppDatabase>();

  final HomeBloc _bloc = getIt<HomeBloc>();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes"),
      ),
      body: Container(
        child: _getList(watchFuture<AppDatabase, List<Note>>((database) => database.noteDao.findAll(), []), context),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _bloc.clearValidation();
          showDialog(
            context: context,
            builder: (context) => _createNoteDialog(context),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _getList(AsyncSnapshot<List<Note>?> snapshot, BuildContext context){
    if (snapshot.data!.isEmpty){
      return Center(
        child: RichText(
          text: TextSpan(
            text: "Click",
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 18,
            ),
            children: [
              WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: IconButton(
                  onPressed: (){
                    _bloc.clearValidation();
                    showDialog(
                      context: context,
                      builder: (context) => _createNoteDialog(context),
                    );
                  },
                  iconSize: 40,
                  icon: const Icon(Icons.add_circle, color: Colors.black54,),
                ),
              ),
              const TextSpan(
                text: "button to add a note",
              )
            ],
          ),
        ),
      );
    } else {
      return ListView.builder(
        itemCount: snapshot.data!.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(snapshot.data![index].title!),
          trailing: IconButton(
            onPressed: (){
              _bloc.deleteNote(snapshot.data![index].id!);
            },
            icon: const Icon(Icons.delete),
          ),
        ),
      );
    }
  }

  AlertDialog _createNoteDialog(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      content: CreateNoteDialog(callback: (){
        Navigator.pop(context);
      }),
    );
  }
}