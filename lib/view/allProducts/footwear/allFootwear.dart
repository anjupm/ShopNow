import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_shop_app/common/products.dart';
import 'package:online_shop_app/view/home/homeDetail/DetailsPage.dart';
import 'package:online_shop_app/widget/gridItems.dart';

class AllFootwear extends StatefulWidget {
  const AllFootwear({Key? key}) : super(key: key);

  @override
  State<AllFootwear> createState() => _AllFootwearState();
}

class _AllFootwearState extends State<AllFootwear> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.pink.shade900,
        elevation: 0,
        title: Text(
          "Footwear",
          style: GoogleFonts.openSans(
              fontSize: 18, color: Colors.white, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: GridView.builder(
        shrinkWrap: true,
        itemCount: products.length - 1,
        padding: const EdgeInsets.all(10.0),
        physics: const BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: MediaQuery.of(context).size.width /
              (MediaQuery.of(context).size.height / 1.6),
        ),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsPage(product: products[index], item: "footwear"),
                ),
              );
            },
            child: GridItems(
              color: products[index].color,
              image: products[index].footwearImage,
              name: products[index].footwearName,
              price: "\u{20B9}${products[index].footwearPrice}",
            ),
          );
        },
      ),
    );
  }
}
