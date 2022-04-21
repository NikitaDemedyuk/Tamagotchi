import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:tamagotchi/theme/theme_constants.dart';

enum NavbarItem {
  home,
  feedList,
  settings,
}

class NavigationState extends Equatable {
  final NavbarItem navbarItem;
  final int index;

  const NavigationState(this.navbarItem, this.index);

  @override
  List<Object> get props => [navbarItem, index];
}