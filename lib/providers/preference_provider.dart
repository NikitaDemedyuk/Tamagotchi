import 'package:flutter/cupertino.dart';
import 'package:tamagotchi/bloc/change_theme_bloc.dart';

class PreferenceProvider with ChangeNotifier{

  ChangeThemeBloc _bloc = ChangeThemeBloc();

  PreferenceProvider() {
    _bloc = ChangeThemeBloc();
    _bloc.loadPreferences();
  }

  ChangeThemeBloc get bloc => _bloc;
}