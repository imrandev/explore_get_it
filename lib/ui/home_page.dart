import 'package:explore_get_it/bloc/home_bloc.dart';
import 'package:explore_get_it/core/db/app_database.dart';
import 'package:explore_get_it/core/db/entity/note.dart';
import 'package:explore_get_it/core/di/injection.dart';
import 'package:explore_get_it/core/lang/language_factory.dart';
import 'package:explore_get_it/ui/create_note_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

class HomePage extends StatelessWidget with GetItMixin {

  final HomeBloc _bloc = getIt<HomeBloc>();

  final LanguageFactory _language = getIt<LanguageFactory>();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    final langType = watchOnly<LanguageSelector, int>((selector) => selector.type);

    return Scaffold(
      appBar: AppBar(
        title: Text(_language.getLanguage(langType).notes),
        actions: [
          PopupMenuButton<String>(
            itemBuilder: (context) => _language.getLanguage(langType).themes.map((e) => PopupMenuItem<String>(value: e,child: Text(e))).toList(),
            icon: const Icon(Icons.color_lens),
            onSelected: (value) {
              _bloc.changeTheme(value);
            },
          ),
          PopupMenuButton<String>(
            itemBuilder: (context) => _language.getLanguage(langType).languages.map((e) => PopupMenuItem<String>(value: e,child: Text(e))).toList(),
            icon: const Icon(Icons.language),
            onSelected: (value) {
              _bloc.changeLanguage(value);
            },
          ),
        ],
      ),
      body: Container(
        child: _getList(watchFuture<AppDatabase, List<Note>>((database) => database.noteDao.findAll(), []), context, langType),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _bloc.clearValidation();
          showDialog(
            context: context,
            builder: (context) => _createNoteDialog(context),
          );
        },
        child: const Icon(Icons.note_add_outlined),
      ),
    );
  }

  Widget _getList(AsyncSnapshot<List<Note>?> snapshot, BuildContext context, int langType){
    if (snapshot.data!.isEmpty){
      return Center(
        child: RichText(
          text: TextSpan(
            text: _language.getLanguage(langType).emptyNotes.split(" + ")[0],
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
                  icon: const Icon(Icons.note_add_outlined, color: Colors.black54,),
                ),
              ),
              TextSpan(
                text: _language.getLanguage(langType).emptyNotes.split(" + ")[1],
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
          leading: const Icon(Icons.note_alt_outlined),
          subtitle: Text(
            snapshot.data![index].description!,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
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