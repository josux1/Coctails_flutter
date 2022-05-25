import 'package:flutter/material.dart';
import 'package:take_home_test/globals/colors.dart';
import 'package:take_home_test/pages/detail.dart';
import '../models/drink_model.dart';

class CardSwipe extends StatelessWidget {
  const CardSwipe({Key? key, required this.drinks}) : super(key: key);

  final List<Cocktail> drinks;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: drinks.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DetailPage(
                        index: index,
                        drinks: drinks,
                      )));
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: size.height * 0.02),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Ink(
                        height: size.height * 0.4,
                        width: size.width * 0.9,
                        child: FittedBox(
                            fit: BoxFit.cover,
                            child: Image.network(drinks[index].strDrinkThumb))),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: size.height * 0.02),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      color: Colors.black26,
                      height: size.height * 0.4,
                      width: size.width * 0.9,
                    ),
                  ),
                ),
                Align(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: size.height * 0.02),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: SizedBox(
                        height: size.height * 0.4,
                        width: size.width * 0.9,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: size.width * 0.05,
                            top: size.height * 0.3,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                drinks[index].strDrink,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 28),
                              ),
                              Text(
                                drinks[index].strCategory,
                                style: TextStyle(
                                    color: mainColor,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
