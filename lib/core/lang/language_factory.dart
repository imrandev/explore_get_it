import 'package:explore_get_it/core/lang/bangla.dart';
import 'package:explore_get_it/core/lang/english.dart';
import 'package:explore_get_it/core/lang/language.dart';
import 'package:explore_get_it/core/utils/constant.dart';
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