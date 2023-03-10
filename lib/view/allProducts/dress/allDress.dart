import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_shop_app/common/products.dart';
import 'package:online_shop_app/view/home/homeDetail/DetailsPage.dart';
import 'package:online_shop_app/widget/gridItems.dart';

class AllDress extends StatefulWidget {
  const AllDress({Key? key}) : super(key: key);

  @override
  State<AllDress> createState() => _AllDressState();
}

class _AllDressState extends State<AllDress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.pink.shade900,
        elevation: 0,
        title: Text(
          "Dress",
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
                  builder: (context) => DetailsPage(product: products[index], item: "dress"),
                ),
              );
            },
            child: GridItems(
              color: products[index].color,
              image: products[index].dressImage,
              name: products[index].dressName,
              price: "\u{20B9}${products[index].dressPrice}",
            ),
          );
        },
      ),
    );
  }
}
