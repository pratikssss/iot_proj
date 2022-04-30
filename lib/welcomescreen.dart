import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iot_project/constants.dart';
import 'package:iot_project/loginscreen.dart';
import 'package:iot_project/registrationscreen.dart';
import 'package:iot_project/welcomelevatedbutton.dart';

class WelcomeScreen extends StatelessWidget {
  static const String id = 'welcome_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/images/waveBackground.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
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
                          color: Color(0xFF48A9A6),
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  'Maintain your stock',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.alegreya(
                    // ignore: prefer_const_constructors
                    textStyle: TextStyle(
                      color: Color(0xFF48A9A6),
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),

                // ignore: prefer_const_constructors
                SizedBox(
                  height: 30,
                ),
                WelcomeElevatedButton('Login', Color(0xFF4A7B9D), () {
                  Navigator.pushNamed(context, LoginScreen.id);
                }),
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 15,
                ),
                WelcomeElevatedButton('Register', Color(0xFF4A7B9D), () {
                  Navigator.pushNamed(context, RegistrationScreen.id);
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
