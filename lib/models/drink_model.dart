import 'package:take_home_test/globals/utils.dart';

class Cocktail {
  String idDrink;
  String strDrink;
  String strDrinkAlternate;
  String strTags;
  List<Ingredients> ingredientsList;
  String strVideo;
  String strCategory;
  String strIBA;
  String strAlcoholic;
  String strGlass;
  String strInstructions;
  String strDrinkThumb;
  String strCreativeCommonsConfirmed;

  Cocktail(
      {required this.idDrink,
      required this.strDrink,
      required this.strDrinkAlternate,
      required this.strTags,
      required this.ingredientsList,
      required this.strVideo,
      required this.strCategory,
      required this.strIBA,
      required this.strAlcoholic,
      required this.strGlass,
      required this.strInstructions,
      required this.strDrinkThumb,
      required this.strCreativeCommonsConfirmed});

  factory Cocktail.fromJson(Map<String, dynamic> jsonResponse) {
    return Cocktail(
        idDrink: jsonResponse["idDrink"].toString(),
        strDrink: jsonResponse["strDrink"].toString(),
        strDrinkAlternate: jsonResponse["strDrinkAlternate"].toString(),
        strTags: jsonResponse["strTags"].toString(),
        ingredientsList: _getIngredientList(
            jsonResponse, jsonResponse["idDrink"].toString()),
        strVideo: jsonResponse["strVideo"].toString(),
        strCategory: jsonResponse["strCategory"].toString(),
        strIBA: jsonResponse["strIBA"].toString(),
        strAlcoholic: jsonResponse["strAlcoholic"].toString(),
        strGlass: jsonResponse["strGlass"].toString(),
        strInstructions: jsonResponse["strInstructions"].toString(),
        strDrinkThumb: jsonResponse["strDrinkThumb"].toString(),
        strCreativeCommonsConfirmed:
            jsonResponse["strCreativeCommonsConfirmed"].toString());
  }

  static List<Ingredients> _getIngredientList(
      Map<String, dynamic> jsonResponse, String drinkId) {
    List<Ingredients> ingredientList = [];

    for (var i = 1; i <= 15; i++) {
      if (jsonResponse["strIngredient$i"].toString() != "null" &&
          jsonResponse["strIngredient$i"].toString().isNotEmpty) {
        var ingredient = Ingredients(
            strIngredientName: jsonResponse["strIngredient$i"].toString(),
            strMeasure: jsonResponse["strMeasure$i"].toString(),
            image: Util.getImageUrl(jsonResponse["strIngredient$i"].toString()),
            id: drinkId);
        ingredientList.add(ingredient);
      }
    }
    return ingredientList;
  }

  @override
  String toString() {
    return 'Cocktail{idDrink: $idDrink, strDrink: $strDrink, strDrinkAlternate: $strDrinkAlternate,'
        ' strTags: $strTags, ingredientsList: $ingredientsList, strVideo: $strVideo,'
        ' strCategory: $strCategory, strIBA: $strIBA, strAlcoholic: $strAlcoholic,'
        ' strGlass: $strGlass, strInstructions: $strInstructions, strDrinkThumb: $strDrinkThumb,'
        ' strCreativeCommonsConfirmed: $strCreativeCommonsConfirmed}';
  }
}

//----------------------------------------------------------------------//
class Ingredients {
  String strIngredientName;
  String strMeasure;
  String image;
  String id;

  Ingredients(
      {required this.strIngredientName,
      required this.strMeasure,
      required this.image,
      required this.id});
}
