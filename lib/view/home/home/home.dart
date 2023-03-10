import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_shop_app/view/allProducts/dress/allDress.dart';
import 'package:online_shop_app/view/allProducts/footwear/allFootwear.dart';
import 'package:online_shop_app/view/allProducts/handbag/allHandbag.dart';
import 'package:online_shop_app/view/home/homeSearch/homeSearch.dart';
import 'package:online_shop_app/view/login/loginPage.dart';
import 'package:online_shop_app/widget/searchFieldWidget.dart';
import 'package:online_shop_app/view/home/homeTabs/dressTab.dart';
import 'package:online_shop_app/view/home/homeTabs/footwearTab.dart';
import 'package:online_shop_app/view/home/homeTabs/handBagTab.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late SharedPreferences loginData;

  @override
  void initState() {
    // TODO: implement initState
    getSharedPreferenceValue();
    super.initState();
  }

  void getSharedPreferenceValue() async {
    loginData = await SharedPreferences.getInstance();
    setState(() {  });
  }

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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.pink.shade900,
              ),
              child: Center(
                child: Image.asset(
                  "assets/icons/logo.png",
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AllHandbag(),
                  ),
                );
              },
              child: ListTile(
                leading: Icon(Icons.shopping_bag, color: Colors.pink.shade900),
                title: const Text('Handbag'),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.pink.shade900, size: 15,),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AllDress(),
                  ),
                );
              },
              child: ListTile(
                leading: Icon(Icons.person_outline, color: Colors.pink.shade900),
                title: const Text('Dress'),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.pink.shade900, size: 15,),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AllFootwear(),
                  ),
                );
              },
              child: ListTile(
                leading: Icon(Icons.person, color: Colors.pink.shade900),
                title: const Text('Footwear'),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.pink.shade900, size: 15,),
              ),
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: ((context) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      title: const Text('Logout',
                          style: TextStyle(color: Colors.black)),
                      content: const Text(
                          'Do you want to logout from this account?'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                          child: Text(
                            'No',
                            style: TextStyle(color: Colors.pink.shade900),
                          ),
                        ),
                        TextButton(
                          onPressed: () async {
                            loginData.setBool("newUser", true);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginPage(),
                              ),
                            );
                          },
                          child: Text(
                            'Yes',
                            style: TextStyle(color: Colors.pink.shade900),
                          ),
                        ),
                      ],
                    );
                  }),
                );
              },
              child: ListTile(
                leading: Icon(Icons.logout, color: Colors.pink.shade900),
                title: const Text('Logout'),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.pink.shade900, size: 15,),
              ),
            ),
          ],
        ),
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
