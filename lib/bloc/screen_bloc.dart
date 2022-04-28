import 'package:bloc/bloc.dart';
import '../model/screen.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(const NavigationState(NavbarItem.home, 0));

  void getNavBarItem(NavbarItem navbarItem) {
    switch (navbarItem) {
      case NavbarItem.home:
        emit(const NavigationState(NavbarItem.home, 0));
        break;
      case NavbarItem.feedList:
        emit(const NavigationState(NavbarItem.feedList, 1));
        break;
      case NavbarItem.settings:
        emit(const NavigationState(NavbarItem.settings, 2));
        break;
    }
  }
}