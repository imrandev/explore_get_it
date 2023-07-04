import 'package:explore_get_it/bloc/home_bloc.dart';
import 'package:explore_get_it/core/di/injection.dart';
import 'package:explore_get_it/core/session/session_manager.dart';
import 'package:explore_get_it/core/utils/constant.dart';
import 'package:explore_get_it/ui/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(GetItApp());
}

class GetItApp extends StatelessWidget with GetItMixin {

  final SessionManager _sessionManager = getIt<SessionManager>();

  GetItApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constant.appName,
      theme: ThemeData(
        primarySwatch: _switchTheme(watchX<ThemeSelector, String>((themeSelector) => themeSelector.theme)),
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }

  MaterialColor _switchTheme(String selectedTheme){
    if (selectedTheme.isEmpty){
      selectedTheme = _sessionManager.defaultTheme ?? "Blue";
    }

    switch(selectedTheme){
      case "Red":
      case "লাল":
        return Colors.red;
      case "Green":
      case "সবুজ":
        return Colors.green;
      default:
        return Colors.blue;
    }
  }
}
