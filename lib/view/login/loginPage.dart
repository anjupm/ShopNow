import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_shop_app/view/home/homeScreen.dart';
import 'package:online_shop_app/view/signup/signupPage.dart';
import 'package:online_shop_app/widget/bookingFormTextFields.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io' show Platform, exit;
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  late SharedPreferences loginData;
  late bool newUser;
  late String email,password;

  @override
  void initState() {
    // TODO: implement initState
    getSharedPreferenceValue();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.clear();
    passwordController.clear();
    super.dispose();
  }

  void getSharedPreferenceValue() async {
    loginData = await SharedPreferences.getInstance();
    setState(() {
      email = loginData.getString("email")!;
      password = loginData.getString("password")!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()  {
        if (Platform.isAndroid) {
          SystemChannels.platform.invokeMethod('SystemNavigator.pop');
        } else if (Platform.isIOS) {
          exit(0);
        }
        return Future.value(false);
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Image.asset(
                  "assets/icons/logo.png",
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                Text(
                  "Welcome Back!",
                  style: GoogleFonts.openSans(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Login to your existing account",
                  style: GoogleFonts.openSans(
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: BookingFormTextFields(
                    hint: "Email",
                    controller: emailController,
                    maxLines: 1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  child: BookingFormTextFields(
                    hint: "Password",
                    maxLines: 1,
                    controller: passwordController,
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot Password?",
                      style: GoogleFonts.openSans(
                        color: Colors.pink.shade900,
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if(emailController.text.isEmpty && passwordController.text.isEmpty){
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.pink.shade900,
                          content: const Text("Please fill all fields"),
                        ),
                      );
                    }else{
                      String emailData = emailController.text;
                      String passwordData = passwordController.text;

                      if (emailData != "" && passwordData != "" && emailData == email && passwordData == password) {
                        loginData.setBool("newUser", false);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        );
                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.pink.shade900,
                            content: const Text("Incorrect email or password"),
                          ),
                        );
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink.shade700,
                  ),
                  child: Text(
                    "   Login   ",
                    style: GoogleFonts.openSans(
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "or connect using",
                  style: GoogleFonts.openSans(
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink.shade700,
                      ),
                      child: Wrap(
                        children: [
                          const Icon(Icons.facebook, size: 15),
                          const SizedBox(
                            width: 5,
                          ),
                          Center(
                            child: Text(
                              "Facebook",
                              style: GoogleFonts.openSans(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink.shade700,
                      ),
                      child: Wrap(
                        children: [
                          const Icon(
                            Icons.g_mobiledata_rounded,
                            size: 20,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Center(
                            child: Text(
                              "Google",
                              style: GoogleFonts.openSans(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: GoogleFonts.openSans(
                        color: Colors.black,
                        fontSize: 17,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignupPage(),
                          ),
                        );
                      },
                      child: Text(
                        "Sign up",
                        style: GoogleFonts.openSans(
                          color: Colors.pink.shade900,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
