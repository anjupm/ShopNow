import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GridItems extends StatelessWidget {
  final Color color;
  final String image;
  final String name;
  final String price;

  const GridItems({
    Key? key,
    required this.color,
    required this.image,
    required this.name,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Stack(
        children: [
          Center(
            child: Container(
              height: 120,
              margin: const EdgeInsets.all(10.0),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0, bottom: 5.0),
              child: Text(
                name,
                style: GoogleFonts.openSans(
                  color: Colors.white,
                  fontSize: 13,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20, left: 10.0, right: 12.0),
              child: Text(
                price,
                style: GoogleFonts.openSans(
                  color: Colors.white,
                  fontSize: 11,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
