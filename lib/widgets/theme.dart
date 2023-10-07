//doesn't work for me
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme{
  static ThemeData get lightTheme (BuildContext context) => ThemeData(
       brightness: Brightness.dark,//overrides all colors to dark mode
        primarySwatch: Colors.green,
        fontFamily: GoogleFonts.lato().fontFamily,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
//          textTheme: Theme.of(context).textTheme,
        )
  );
}