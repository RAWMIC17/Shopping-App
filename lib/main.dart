import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/Login.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: Homepage(), //Removing the comment slasshes will result in errors
      themeMode: ThemeMode.light, //Thememode dark or light
      theme: ThemeData(primarySwatch: Colors.deepPurple),//primaryswatch library contains colors
      darkTheme: ThemeData(
       brightness: Brightness.dark,//overrides all colors to dark mode
        primarySwatch: Colors.green,
        fontFamily: GoogleFonts.lato().fontFamily,
        ),//Dark theme properties
        initialRoute: "/home",//changes the default the route
        routes: { //"/" is show on screen first by default
          "/" : (context)=>  HomePage(),//generates error, home also points to homepage, have to remove one
          "/home":(context)=> LoginPage(),
          "/login":(context)=> LoginPage()
        },
    );
  }
}
