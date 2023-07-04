import 'package:explore_get_it/bloc/home_bloc.dart';
import 'package:explore_get_it/core/di/injection.dart';
import 'package:explore_get_it/core/lang/language_factory.dart';
import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

class CreateNoteDialog extends StatelessWidget with GetItMixin {

  final HomeBloc _bloc = getIt<HomeBloc>();

  final LanguageFactory _language = getIt<LanguageFactory>();

  final Function callback;

  CreateNoteDialog({super.key, required this.callback});

  @override
  Widget build(BuildContext context) {
    final errorMessage = watchX<FormValidator, String?>((validator) => validator.error);

    final langType = watchOnly<LanguageSelector, int>((selector) => selector.type);

    return SizedBox(
      height: 300.0,
      width: 300.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            _language.getLanguage(langType).createNote,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 12.0,),
          TextField(
            decoration: InputDecoration(
              hintText: _language.getLanguage(langType).title,
              errorText: errorMessage,
            ),
            onChanged: (value) {
              _bloc.title = value;
            },
          ),
          const SizedBox(height: 16.0,),
          TextField(
            decoration: InputDecoration(
              hintText: _language.getLanguage(langType).description,
            ),
            onChanged: (value) {
              _bloc.description = value;
            },
          ),
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              child: TextButton.icon(
                onPressed: () async {
                  bool validate  = await _bloc.createNote();
                  if (validate){
                    callback();
                  }
                },
                icon: const Icon(Icons.add_circle),
                label: Text(_language.getLanguage(langType).addNote),
              ),
            ),
          ),
        ],
      ),
    );
  }
}