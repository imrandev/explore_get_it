import 'package:core/lang/bangla.dart';
import 'package:core/lang/english.dart';
import 'package:core/lang/language.dart';
import 'package:core/utils/constant.dart';
import 'package:injectable/injectable.dart';

@injectable
class LanguageFactory {

  Language getLanguage(int type){
    if (type == Constant.bangla){
      return Bangla();
    }
    return English();
  }
}