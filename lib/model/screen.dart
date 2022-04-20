import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

enum NavbarItem {
  home,
  settings,
  profile,
}


class NavigationState extends Equatable {
  final NavbarItem navbarItem;
  final int index;

  NavigationState(this.navbarItem, this.index);

  @override
  List<Object> get props => [navbarItem, index];
}