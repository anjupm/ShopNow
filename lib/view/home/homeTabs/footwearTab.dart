import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_shop_app/common/products.dart';
import 'package:online_shop_app/common/ui/Ui.dart';
import 'package:online_shop_app/view/home/homeDetail/DetailsPage.dart';
import 'package:online_shop_app/widget/footwearGridItems.dart';
import 'package:online_shop_app/widget/gridItems.dart';

class FootwearTab extends StatefulWidget {
  const FootwearTab({Key? key}) : super(key: key);

  @override
  State<FootwearTab> createState() => _FootwearTabState();
}

class _FootwearTabState extends State<FootwearTab> {

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: products.length,
      shrinkWrap: true,
      padding: const EdgeInsets.all(10.0),
      physics: const BouncingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: MediaQuery.of(context).size.width / (MediaQuery.of(context).size.height / 1.6),
      ),
      itemBuilder: (BuildContext context, int index) {
        return Stack(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsPage(product: products[index], item: "footwear"),
                  ),
                );
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
                        products[index].footwearImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 2.0),
                        child: Text(
                          products[index].footwearName,
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
                          products[index].price,
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
      },
    );
  }
}