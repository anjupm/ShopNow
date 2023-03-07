import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:online_shop_app/common/products.dart';
import 'package:online_shop_app/common/ui/Ui.dart';
import 'package:online_shop_app/view/home/homeDetail/DetailsPage.dart';

class DressTab extends StatefulWidget {
  const DressTab({Key? key}) : super(key: key);

  @override
  State<DressTab> createState() => _DressTabState();
}

class _DressTabState extends State<DressTab> {

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: 2.0,
        height: 225,
        viewportFraction: 0.80,
        enlargeCenterPage: true,
      ),
      items: products.map((i) {
        return Builder(builder: (BuildContext context) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsPage(product: i, item: "dress"),
                ),
              );
            },
            child: Container(
                height: 450,
                width: 450,
                margin: const EdgeInsets.only(bottom: 10, top: 10),
                clipBehavior: Clip.hardEdge,
                decoration: Ui.getBoxDecoration(color: Colors.grey),
                child: Image.asset(i.dressImage)
            ),
          );
        });
      }).toList(),
    );
  }
}
