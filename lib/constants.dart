import 'package:flutter/material.dart';

const kProjectID = 'urban-kinetics-dd3fd';
const Color kPrimaryColor = Color(0xFF454E9E);

const kWelcomeTextFieldDeco = InputDecoration(
  hintText: 'Enter a value',
  hintStyle: TextStyle(
    color: Colors.black26,
  ),
  contentPadding: EdgeInsets.symmetric(
    horizontal: 20,
    vertical: 10,
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(20)),
    borderSide: BorderSide(
      width: 1.5,
      color: Colors.blueAccent,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(20)),
    borderSide: BorderSide(
      width: 2.5,
      color: Colors.blue,
    ),
  ),
);

const kFillTextFieldDeco = InputDecoration(
  hintText: 'Enter value',
  hintStyle: TextStyle(
    color: Colors.black26,
  ),
  contentPadding: EdgeInsets.symmetric(
    horizontal: 20,
    vertical: 0,
  ),
  // border: OutlineInputBorder(
  //   borderSide: BorderSide(color: Color(0xffaa2244)),
  // ),
  // enabledBorder: OutlineInputBorder(
  //   borderRadius: BorderRadius.all(Radius.circular(20)),
  //   borderSide: BorderSide(
  //     width: 1.5,
  //     color: Color(0xaaAA2244),
  //   ),
  // ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    borderSide: BorderSide(
      width: 2,
      color: Color(0xffAA2244),
    ),
  ),
);
