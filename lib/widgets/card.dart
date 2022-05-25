import 'package:flutter/material.dart';
import 'package:take_home_test/globals/colors.dart';

class MyCardd extends StatelessWidget {
  const MyCardd({
    Key? key,
    required this.title,
    required this.description,
    required this.imgpath,
    // required this.ontap,
  }) : super(key: key);

  final String title;
  final String description;
  final String imgpath;
  // late Function ontap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Ink(
        height: size.height * 0.20,
        width: size.width * 0.38,
        decoration: BoxDecoration(
          color: bakColor,
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: SizedBox(
                    height: size.height * 0.16,
                    width: size.width * 0.29,
                    //color: Colors.amber,
                    child: SizedBox.expand(
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: SizedBox(
                          child: Image.network(
                            imgpath.toString(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 5),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  title,
                  maxLines: 2,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                      fontSize: size.height * 0.018,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
