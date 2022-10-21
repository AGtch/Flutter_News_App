import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bottom_navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationState(NavbarItem.news, 0));

  void getNavBarItem(NavbarItem navbarItem) {
    switch (navbarItem) {
      case NavbarItem.news:
        emit(NavigationState(NavbarItem.news, 0));
        break;
      case NavbarItem.search:
        emit(NavigationState(NavbarItem.search, 1));
        break;
      case NavbarItem.settings:
        emit(NavigationState(NavbarItem.settings, 2));
        break;
    }
  }
}
