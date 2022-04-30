import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iot_project/constants.dart';
import 'package:iot_project/loginscreen.dart';
import 'package:iot_project/widgets/welcomeelevatedbutton.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool showSpinner = false;
  String email = '';
  String password = '';
  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pushNamed(context, LoginScreen.id);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Message"),
      content: Text(
          "You have registered successfully.Go to login page to continue!"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

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
                  'Create a new id!',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.alegreya(
                    // ignore: prefer_const_constructors
                    textStyle: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 20,
                ),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    email = value.trim();
                  },
                  decoration: kWelcomeTextFieldDeco.copyWith(
                    hintText: 'Enter e-mail',
                  ),
                ),
                // ignore: prefer_const_constructors
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
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 20,
                ),
                TextButton(
                  onPressed: () {
                    showAlertDialog(context);
                  },
                  child: Text(
                    'Register',
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

// onPressed: () async {
//   setState(() {
//     showSpinner = true;
//   });
//
//   try {
//     // final newUser =
//     await _auth.createUserWithEmailAndPassword(
//         email: email, password: password);
//     Navigator.pushNamed(context, RegistrationDetails.id);
//   } catch (e) {
//     print(e);
//   } finally {
//     setState(() {
//       showSpinner = false;
//     });
//   }
// },
