import 'package:flutter/material.dart';
import 'package:iot_project/loginscreen.dart';
import 'package:iot_project/mailtesting.dart';
import 'package:iot_project/mqtt.dart';
import 'package:iot_project/orderpage.dart';
import 'package:iot_project/page.dart';
import 'package:iot_project/registrationscreen.dart';
import 'package:iot_project/welcomescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        orderpage.id: (context) => orderpage(),
        mail.id: (context) => mail(),
        mqtt.id: (context) => mqtt(),
        page.id: (context) => page(),
      },
    );
  }
}
