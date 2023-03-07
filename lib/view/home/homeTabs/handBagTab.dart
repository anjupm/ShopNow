import 'package:flutter/material.dart';
import 'package:online_shop_app/common/products.dart';
import 'package:online_shop_app/view/home/homeDetail/DetailsPage.dart';
import 'package:online_shop_app/widget/gridItems.dart';

class HandBagTab extends StatefulWidget {
  const HandBagTab({Key? key}) : super(key: key);

  @override
  State<HandBagTab> createState() => _HandBagTabState();
}

class _HandBagTabState extends State<HandBagTab> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: products.length,
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
                builder: (context) => DetailsPage(product: products[index], item: "handbag"),
              ),
            );
          },
          child: GridItems(
            color: products[index].color,
            image: products[index].image,
            name: products[index].title,
            price: products[index].price,
          ),
        );
      },
    );
  }
}
