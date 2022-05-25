import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:take_home_test/globals/colors.dart';
import 'package:take_home_test/routes.dart';
import 'package:take_home_test/widgets/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cocktail Cookbook',
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.light(
            brightness: Brightness.dark,
            primary: mainColor,
            onPrimary: bakColor),
        scaffoldBackgroundColor: bakColorDark,
      ),
      home: EasySplashScreen(
        logo: Image.asset('assets/beer.png'),
        logoSize: 150,
        backgroundColor: bakColorDark,
        showLoader: true,
        loadingText: const Text("Loading Data..."),
        loaderColor: mainColor,
        navigator: const Menu(),
        durationInSeconds: 3,
      ),
      routes: getAppRoutes(),
    );
  }
}
