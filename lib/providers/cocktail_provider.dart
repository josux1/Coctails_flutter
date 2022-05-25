// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:take_home_test/models/drink_model.dart';
import 'package:http/http.dart' as http;

class CocktailProvider {
  static const apiKey = "1";
  static const apiVersion = "v1";
  static const baseUrl =
      "https://www.thecocktaildb.com/api/json/$apiVersion/$apiKey";
  static const String randomCocktail = "$baseUrl/random.php";
  static const String allCocktails = "$baseUrl/filter.php?c=Cocktail";
  static const String popularUrl = "$baseUrl/popular.php";

  Future<List<Cocktail>> getRandomCocktail() async {
    final response = await http.get(Uri.parse(randomCocktail));

    print("GET----> $randomCocktail");
    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body);
      print("RESPONSE-----> $responseJson");
      return (responseJson['drinks'] as List)
          .map((p) => Cocktail.fromJson(p))
          .toList();
    } else {
      print("STATUSCODE-----> ${response.statusCode}  $response");
      throw Exception('Failed to load Cocktails');
    }
  }

  Future<List<Cocktail>> getAllCocktails() async {
    final response = await http.get(Uri.parse(allCocktails));

    print("GET----> $allCocktails");
    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body);
      print("RESPONSE-----> $responseJson");
      return (responseJson['drinks'] as List)
          .map((p) => Cocktail.fromJson(p))
          .toList();
    } else {
      print("STATUSCODE-----> ${response.statusCode}  $response");
      throw Exception('Failed to load Cocktails');
    }
  }

  Future<List<Cocktail>> searchDrink(String query) async {
    String search =
        'https://www.thecocktaildb.com/api/json/v1/1/search.php?s=$query';
    final response = await http.get(Uri.parse(search));

    print("GET----> $search");
    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body);
      print("RESPONSE-----> $responseJson");
      return (responseJson['drinks'] as List)
          .map((p) => Cocktail.fromJson(p))
          .toList();
    } else {
      print("STATUSCODE-----> ${response.statusCode}  $response");
      throw Exception('Failed to load Cocktails');
    }
  }
}//