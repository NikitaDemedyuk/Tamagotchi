import 'package:flutter/cupertino.dart';
import 'package:tamagotchi/bloc/change_theme_bloc.dart';

class ThemeProvider with ChangeNotifier{

  ChangeThemeBloc _bloc = ChangeThemeBloc();

  ThemeProvider() {
    _bloc = ChangeThemeBloc();
    _bloc.loadPreferencesTheme();
  }

  ChangeThemeBloc get bloc => _bloc;
}