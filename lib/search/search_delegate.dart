import 'package:flutter/material.dart';
import 'package:take_home_test/models/drink_model.dart';
import 'package:take_home_test/pages/detail2.dart';
import 'package:take_home_test/providers/cocktail_provider.dart';

class DataSearch extends SearchDelegate {
  String select = '';
  final cocktailProvider = CocktailProvider();

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Container(
        height: 120,
        color: Colors.amber,
        child: Text(select),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return Container();
    }

    return FutureBuilder(
      builder: (context, AsyncSnapshot<List<Cocktail>> snapshot) {
        if (snapshot.hasData) {
          final cocktails = snapshot.data;

          return ListView(
            physics: const BouncingScrollPhysics(),
            children: cocktails!.map((cocktail) {
              return ListTile(
                leading: FadeInImage(
                    fadeInDuration: const Duration(milliseconds: 150),
                    fadeOutDuration: const Duration(milliseconds: 300),
                    placeholder: const AssetImage('assets/load.gif'),
                    image: NetworkImage(cocktail.strDrinkThumb),
                    width: 60,
                    fit: BoxFit.cover,
                    placeholderFit: BoxFit.cover),
                title: Text(cocktail.strDrink),
                subtitle: Text(cocktail.strCategory),
                onTap: () {
                  close(context, null);
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DetailPage2(
                            drink: cocktail,
                          )));
                },
              );
            }).toList(),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
      future: cocktailProvider.searchDrink(query),
    );
  }
}
