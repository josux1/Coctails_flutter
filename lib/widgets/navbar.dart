import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:take_home_test/globals/colors.dart';
import 'package:take_home_test/routes.dart';

List<PersistentBottomNavBarItem> nav() {
  return [
    PersistentBottomNavBarItem(
      routeAndNavigatorSettings:
          RouteAndNavigatorSettings(routes: getAppRoutes()),
      icon: const Icon(Icons.no_drinks),
      title: ("Cocktails"),
      activeColorPrimary: mainColor,
      inactiveColorPrimary: Colors.grey,
    ),
    PersistentBottomNavBarItem(
      routeAndNavigatorSettings:
          RouteAndNavigatorSettings(routes: getAppRoutes()),
      icon: const Icon(Icons.person),
      title: ("About me"),
      activeColorPrimary: mainColor,
      inactiveColorPrimary: Colors.grey,
    ),
  ];
}
