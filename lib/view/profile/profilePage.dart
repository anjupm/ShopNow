import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_shop_app/common/ui/Ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late SharedPreferences loginData;
  late bool newUser;
  late String name, email, phone, address;

  @override
  void initState() {
    // TODO: implement initState
    getSharedPreferenceValue();
    super.initState();
  }

  void getSharedPreferenceValue() async {
    loginData = await SharedPreferences.getInstance();
    setState(() {
      name = loginData.getString("name")!;
      email = loginData.getString("email")!;
      phone = loginData.getString("phone")!;
      address = loginData.getString("address")!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade900,
        elevation: 0,
        title: Text(
          "Profile",
          style: GoogleFonts.openSans(
              fontSize: 18, color: Colors.white, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                "assets/icons/logo.png",
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(left: 15, right: 15),
              decoration:
                  Ui.getBoxDecorationProfile(color: Colors.pink.shade900),
              child: Column(
                children: [
                  UserInfo(
                    title: "Name",
                    text: name,
                    icon: Icons.person,
                  ),
                  UserInfo(
                    title: "Email",
                    text: email,
                    icon: Icons.description,
                  ),
                  UserInfo(
                      title: "Address", text: address, icon: Icons.location_on),
                  UserInfo(
                    title: "Phone",
                    text: phone,
                    icon: Icons.call,
                  ),
                  GestureDetector(
                    child: Container(
                      margin: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          color: Colors.pink.shade900,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      height: 40,
                      width: 150,
                      child: Center(
                        child: Text(
                          "Logout",
                          style: GoogleFonts.openSans(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
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
                                onPressed: () async {},
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
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  const UserInfo({
    Key? key,
    required this.text,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final String title;
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      padding: const EdgeInsets.all(20),
      decoration: Ui.getBoxDecorationProfile(color: Colors.pink.shade900),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.pink.shade900,
            size: 30,
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.openSans(
                    fontWeight: FontWeight.w700, fontSize: 14),
              ),
              SizedBox(
                width: 250,
                child: Text(
                  text,
                  style: GoogleFonts.openSans(
                      fontWeight: FontWeight.w500, fontSize: 12),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
