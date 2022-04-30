import 'package:flutter/material.dart';

class WelcomeElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPress;
  final Color buttonColor;
  WelcomeElevatedButton(this.text, this.buttonColor, this.onPress);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(text),
      onPressed: onPress,
      style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.all(15)),
        elevation: MaterialStateProperty.all(5),
        backgroundColor: MaterialStateProperty.all<Color>(buttonColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
