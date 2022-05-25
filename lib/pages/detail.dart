import 'package:flutter/material.dart';
import 'package:take_home_test/globals/colors.dart';
import 'package:take_home_test/models/drink_model.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key, required this.drinks, required this.index})
      : super(key: key);

  final List<Cocktail> drinks;
  final int index;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool flag = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Material(
      color: bakColorDark,
      child: ListView(
        physics: const ScrollPhysics(),
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: size.height * 0.02),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Ink(
                      height: size.height * 0.5,
                      width: size.width,
                      child: FittedBox(
                          fit: BoxFit.cover,
                          child: Image.network(
                              widget.drinks[widget.index].strDrinkThumb))),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: size.height * 0.02),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    color: Colors.black26,
                    height: size.height * 0.5,
                    width: size.width,
                  ),
                ),
              ),
              Positioned(
                  left: size.width * 0.05,
                  top: size.height * 0.4,
                  child: Text(
                    widget.drinks[widget.index].strDrink,
                    style: const TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        fontSize: 28),
                  )),
              Positioned(
                  left: size.width * 0.05,
                  top: size.height * 0.45,
                  child: Text(
                    widget.drinks[widget.index].strCategory,
                    style: TextStyle(
                        color: mainColor,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  )),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: size.width * 0.05),
            child: const Text(
              'Ingredients:',
              style: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                  fontSize: 26),
            ),
          ),
          getIngredients(widget.drinks, size),
          Padding(
            padding: EdgeInsets.only(
                left: size.width * 0.05, top: size.width * 0.05),
            child: const Text(
              'Steps:',
              style: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                  fontSize: 26),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0, bottom: 50, left: 15),
            child: Text(
              widget.drinks[widget.index].strInstructions,
              style: const TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }

  Widget getIngredients(List<Cocktail> drinks, size) {
    List<Ingredients> myList = drinks[widget.index].ingredientsList;

    validateIngredient(index) {
      String _name = myList[index].strIngredientName;
      if (_name != null || _name.isNotEmpty) {
        return _name;
      } else {
        return 'Ingredient';
      }
    }

    validateMeasure(measure) {
      if (measure == null || measure.isEmpty) {
        return 'To taste';
      } else {
        return measure;
      }
    }

    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: myList.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Text(
                '-${validateIngredient(index)}',
                style: const TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              Text(
                validateMeasure(myList[index].strMeasure),
                style: const TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ],
          );
        });
  }
}//
