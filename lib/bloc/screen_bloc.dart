import 'package:bloc/bloc.dart';
import 'package:tamagotchi/theme/theme_constants.dart';
import '../model/screen.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationState(NavbarItem.home, 0));

  void getNavBarItem(NavbarItem navbarItem) {
    switch (navbarItem) {
      case NavbarItem.home:
        emit(NavigationState(NavbarItem.home, 0));
        break;
      case NavbarItem.feedList:
        emit(NavigationState(NavbarItem.feedList, 1));
        break;
      case NavbarItem.settings:
        emit(NavigationState(NavbarItem.settings, 2));
        break;
    }
  }
}