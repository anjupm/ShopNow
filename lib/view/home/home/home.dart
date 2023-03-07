import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_shop_app/view/home/homeSearch/homeSearch.dart';
import 'package:online_shop_app/widget/searchFieldWidget.dart';
import 'package:online_shop_app/view/home/homeTabs/dressTab.dart';
import 'package:online_shop_app/view/home/homeTabs/footwearTab.dart';
import 'package:online_shop_app/view/home/homeTabs/handBagTab.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade900,
        elevation: 0,
        title: Text(
          "ShopNow",
          style: GoogleFonts.openSans(
              fontSize: 18, color: Colors.white, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(height:20),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: SearchFieldWidget(
                hintText: "Search by Dress, Footwear & more...",
                readOnly: true,
                autofocus: false,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeSearch(),
                    ),
                  );
                },
              ),
            ),
            itemName("Footwear"),
            const FootwearTab(),
            itemName("Dress"),
            const DressTab(),
            itemName("Hand Bag"),
            const HandBagTab(),
          ],
        ),
      ),
    );
  }

  Widget itemName(String name){
    return Container(
      margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
      alignment: Alignment.centerLeft,
      child: Text(name,
        style: GoogleFonts.openSans(
          color: Colors.black,
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
