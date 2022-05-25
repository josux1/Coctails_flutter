import 'package:flutter/material.dart';
import 'package:take_home_test/globals/colors.dart';
import 'package:take_home_test/providers/cocktail_provider.dart';
import 'package:take_home_test/search/search_delegate.dart';
import 'package:take_home_test/widgets/card_swipe.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

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
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: DataSearch());
                },
                icon: const Icon(Icons.search))
          ],
        ),
        body: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Cocktails of the day',
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    fontSize: 26),
              ),
            ),
            cocktail(size),
            cocktail(size),
            cocktail(size),
            cocktail(size),
          ],
        ));
  }

  Widget cocktail(size) {
    final drink = CocktailProvider();

    return FutureBuilder(
      future: drink.getRandomCocktail(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return CardSwipe(
            drinks: snapshot.data,
          );
        } else {
          return SizedBox(
              height: size.height * 0.4,
              width: size.width * 0.9,
              child: const Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
}//
