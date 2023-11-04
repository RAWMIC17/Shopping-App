//doesn't work for me
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      //brightness: Brightness.dark, //overrides all colors to dark mode
      primarySwatch: Colors.deepPurple,
      fontFamily: GoogleFonts.poppins().fontFamily,
      cardColor: Colors.white,
      canvasColor: creamcolor,
      //accentColor: darkbluishcolor,
      colorScheme: ColorScheme.fromSwatch(brightness: Brightness.light).copyWith(secondary: darkbluishcolor),//alternative for accent color
      highlightColor: darkbluishcolor,//buttoncolor alternative
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
//          textTheme: Theme.of(context).textTheme,
      ));

  


  static ThemeData darkTheme(BuildContext context) => ThemeData(
      brightness: Brightness.dark,
      fontFamily: GoogleFonts.poppins().fontFamily,
      cardColor: Colors.black,
      canvasColor: darkCreamcolor,
      //accentColor: darkbluishcolor,
      colorScheme: ColorScheme.fromSwatch(brightness: Brightness.dark).copyWith(secondary: Colors.white),
      highlightColor: lightBluishcolor,
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.white),
        //textTheme: Theme.of(context).textTheme,
      ));

  static Color creamcolor = Color(0xfff5f5f5);
  static Color darkCreamcolor = Vx.gray900;
  static Color darkbluishcolor = Color(0xff403b58);
  static Color lightBluishcolor = Vx.indigo500;
  static Color buttoncolorwhite = Vx.white;
}
