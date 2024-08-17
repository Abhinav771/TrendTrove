


import 'package:flutter/material.dart';

ThemeData lightTheme =ThemeData(
  primaryColor: Colors.white,
  secondaryHeaderColor: Colors.black,
  primarySwatch: Colors.blue,
  scaffoldBackgroundColor: Color(0XFFF5F5F5),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.blue[300],
    iconTheme: IconThemeData(
      color: Colors.white,),
  ),
  textTheme: TextTheme(
    headlineLarge: TextStyle(fontWeight: FontWeight.bold,
        fontSize: 32,
        fontFamily: 'LexendDeca',
        color: Colors.black),
    titleLarge: TextStyle(fontWeight: FontWeight.bold,
        fontSize: 25,
        fontFamily: 'LexendDeca',
        color: Colors.black),
    titleSmall:TextStyle(
      fontSize: 18,
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontFamily: 'LexendDeca',),
  ),


);



ThemeData darkTheme =ThemeData(
  primaryColor: Color(0XFF333645),
  secondaryHeaderColor: Colors.white70,

  primarySwatch: Colors.deepPurple,
  scaffoldBackgroundColor: Color(0XFF232531),

  appBarTheme: AppBarTheme(
    backgroundColor: Color(0XFF232531),
    iconTheme: IconThemeData(
      color: Colors.white,),
  ),
  textTheme: TextTheme(
    headlineLarge: TextStyle(fontWeight: FontWeight.bold,
        fontSize: 32,
        fontFamily: 'LexendDeca',
        color: Colors.white),
    titleLarge: TextStyle(fontWeight: FontWeight.bold,
        fontSize: 25,
        fontFamily: 'LexendDeca',
        color: Colors.white),
    titleSmall:TextStyle(
      fontSize: 18,
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontFamily: 'LexendDeca',),
  ),


);