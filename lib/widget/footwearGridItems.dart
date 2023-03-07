import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_shop_app/common/ui/Ui.dart';

class FootwearGridItems extends StatelessWidget {
  final Color color;
  final String image;
  final String name;
  final String price;

  const FootwearGridItems({
    Key? key,
    required this.color,
    required this.image,
    required this.name,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {

          },
          child: Container(
            width: double.infinity,
            decoration: Ui.getBoxDecoration(color: Colors.white),
            child: Column(
              children: [
                Container(
                  height: 90,
                  margin: const EdgeInsets.all(10.0),
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 2.0),
                    child: Text(
                      name,
                      style: GoogleFonts.openSans(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 5.0),
                    child: Text(
                      price,
                      style: GoogleFonts.openSans(
                        color: Colors.black,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}