

import 'package:core/lang/language.dart';

class Bangla extends Language {
  @override
  // TODO: implement addNote
  String get addNote => "নোট যোগ করুন";

  @override
  // TODO: implement createNote
  String get createNote => "নোট তৈরি করুন";

  @override
  // TODO: implement description
  String get description => "বর্ণনা";

  @override
  // TODO: implement emptyNotes
  String get emptyNotes => "একটি নোট যোগ করতে + বোতামে ক্লিক করুন";

  @override
  // TODO: implement notes
  String get notes => "নোটস";

  @override
  // TODO: implement themes
  List<String> get themes => ["লাল", "নীল", "সবুজ"];

  @override
  // TODO: implement title
  String get title => "শিরোনাম";

  @override
  // TODO: implement languages
  List<String> get languages => ["বাংলা", "ইংলিশ"];

}