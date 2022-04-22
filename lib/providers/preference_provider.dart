import 'package:flutter/cupertino.dart';
import 'package:tamagotchi/bloc/preference_bloc.dart';

class PreferenceProvider with ChangeNotifier{

  PreferenceBloc _bloc = PreferenceBloc();

  PreferenceProvider() {
    _bloc = PreferenceBloc();
    _bloc.loadPreferences();
  }

  PreferenceBloc get bloc => _bloc;

}