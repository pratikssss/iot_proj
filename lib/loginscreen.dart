import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iot_project/constants.dart';
import 'package:iot_project/orderpage.dart';
import 'package:iot_project/page.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = '';
  String password = '';
  bool showSpinner = false;
  // final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 30,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Hero(
                  tag: 'homeText',
                  child: Material(
                    type: MaterialType.transparency,
                    child: Text(
                      'Inventory Management!!!',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.alegreya(
                        // ignore: prefer_const_constructors
                        textStyle: TextStyle(
                          fontSize: 40,
                          color: const Color(0xFF48A9A6),
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  'Login to your id!',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.alegreya(
                    // ignore: prefer_const_constructors
                    textStyle: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    email = value.trim();
                  },
                  decoration: kWelcomeTextFieldDeco.copyWith(
                    hintText: 'Enter e-mail',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    password = value.trim();
                  },
                  obscureText: true,
                  decoration: kWelcomeTextFieldDeco.copyWith(
                    hintText: 'Enter password',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextButton(
                  // final newUser =

                  //
                  onPressed: () {
                    Navigator.pushNamed(context, page.id);
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.all(15)),
                    elevation: MaterialStateProperty.all(5),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xFF4A7B9D)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
