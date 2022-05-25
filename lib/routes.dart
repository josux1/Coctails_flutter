import 'package:flutter/material.dart';
import 'package:take_home_test/pages/home.dart';
import 'package:take_home_test/pages/info.dart';

Map<String, WidgetBuilder> getAppRoutes() {
  return <String, WidgetBuilder>{
    'home': (context) => const MyHomePage(),
    'page2': (context) => const Information(),
  };
}
