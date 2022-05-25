import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:take_home_test/globals/colors.dart';

class Information extends StatelessWidget {
  const Information({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Cocktail Cookbook',
            style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
                fontSize: 26),
          ),
          backgroundColor: bakColorDark,
          foregroundColor: mainColor,
        ),
        body: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            SizedBox(
              height: 200,
              child: SvgPicture.asset('assets/beer.svg'),
            ),
            const Padding(
              padding:
                  EdgeInsets.only(left: 20.0, right: 20.0, top: 20, bottom: 8),
              child: Text(
                'About the app',
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0),
              child: Text(
                'This app reprecent the "Take Home Test" you sented to me. I deveop it with flutter 3.0.0(latest version abiable today). This test should have no problems. It runs from flutter version 2.0 onwards. \nThis app is able to conect with "thecocktaildb.com" APIs. I specific conect 2 Endpoints to this app. \n-The "Random" Daily Cocktail. It returns a random cocktail object. \n-And I implement a serch delegate function. Youre able to search any cocktail you like.   ',
                style: TextStyle(fontFamily: 'Montserrat', fontSize: 18),
                textAlign: TextAlign.justify,
              ),
            ),
            const Padding(
              padding:
                  EdgeInsets.only(left: 20.0, right: 20.0, top: 20, bottom: 8),
              child: Text(
                'About me',
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 45),
              child: Text(
                'I am a web and flutter mobile apps programmer  with More than 4 years of total experience in the industry. Successful in constant delivery of a service of the highest quality. Quick worker who always goes the extra mile to develope more and keep customers happy. \nBy the way, Im also happy to have the oportunity and be able to participate with you in this process. ',
                style: TextStyle(fontFamily: 'Montserrat', fontSize: 18),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ));
  }
}
