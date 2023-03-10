import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_shop_app/view/home/home/home.dart';
import 'package:online_shop_app/view/profile/profilePage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  List screens = [
    const Home(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        showDialog(
            context: context,
            builder: ((context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                title: const Text('Exit'),
                content: const Text('Do you want to exit from this app?'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: Text(
                      'No',
                      style: GoogleFonts.openSans(
                          fontSize: 15,
                          color: Colors.pink.shade900,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      SystemChannels.platform
                          .invokeMethod('SystemNavigator.pop');
                    },
                    child: Text(
                      'Yes',
                      style: GoogleFonts.openSans(
                          fontSize: 15,
                          color: Colors.pink.shade900,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              );
            }));
        return Future.value(false);
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomNavyBar(
          selectedIndex: _selectedIndex,
          itemCornerRadius: 24,
          curve: Curves.easeIn,
          showElevation: true,
          onItemSelected: (index) => setState(() {
            _selectedIndex = index;
            // _pageController.animateToPage(index, duration: const Duration(milliseconds: 300), curve: Curves.ease);
          }),
          items: [
            BottomNavyBarItem(
              icon: const Icon(Icons.home),
              title: const Text('Home'),
              activeColor: Colors.pink.shade900,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: const Icon(Icons.person),
              title: const Text('Profile'),
              activeColor: Colors.pink.shade900,
              textAlign: TextAlign.center,
            ),
          ],
        ),
        body: screens[_selectedIndex],
      ),
    );
  }
}
