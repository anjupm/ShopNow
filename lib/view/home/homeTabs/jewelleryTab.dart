import 'package:flutter/material.dart';
import 'package:online_shop_app/widget/gridItems.dart';

class JewelleryTab extends StatefulWidget {
  const JewelleryTab({Key? key}) : super(key: key);

  @override
  State<JewelleryTab> createState() => _JewelleryTabState();
}

class _JewelleryTabState extends State<JewelleryTab> {

  var images = [
    "assets/icons/canada.webp",
    "assets/icons/England.jpg",
    "assets/icons/france.jpg",
    "assets/icons/italy.jpg",
    "assets/icons/italy.jpg",
    "assets/icons/russia.jpg",
    "assets/icons/USA.jpg",
    "assets/icons/italy.jpg",
  ];

  var color = [
    Colors.pink.shade700,
    Colors.blueGrey,
    Colors.red.shade900,
    Colors.grey,
    Colors.blueGrey,
    Colors.red.shade700,
    Colors.brown.shade400,
    Colors.grey.shade700,
  ];

  var names = [
    "Canada",
    "England",
    "France",
    "Italy",
    "Russia",
    "USA",
    "Germany",
    "America"
  ];

  var price = [
    "250.0",
    "340.0",
    "790.0",
    "500.0",
    "630.0",
    "180.0",
    "740.0",
    "5200.0",
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: images.length,
      padding: const EdgeInsets.all(10.0),
      physics: const BouncingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 1.30),
      ),
      itemBuilder: (BuildContext context, int index) {
        return GridItems(
          color: color[index],
          image: images[index],
          name: names[index],
          price: price[index],
        );
      },
    );
  }
}
