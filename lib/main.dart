import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/store.dart';
import 'package:flutter_application_1/pages/Login.dart';
import 'package:flutter_application_1/pages/cart_page.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/pages/signup.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:flutter_application_1/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(VxState(
    store: MyStore(),
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: Homepage(), //Removing the comment slashes will result in errors
      themeMode: ThemeMode.system, //Thememode dark or light
      theme: MyTheme.lightTheme(context),//ThemeData(primarySwatch: Colors.deepPurple), //primaryswatch library contains colors
      darkTheme: MyTheme.darkTheme(context),//ThemeData(brightness: Brightness.dark, //overrides all colors to dark mode
          ///primarySwatch: Colors.green,
           //Dark theme properties
      debugShowCheckedModeBanner: false, //to remove debug banner
      initialRoute: MyRoutes.homeRoute, //changes the default the route
      routes: {
        //"/" is show on screen first by default
        "/": (context) =>
            LoginPage(), //generates error, home also points to homepage, have to remove one
        MyRoutes.homeRoute: (context) => HomePage(), //route to homepage
        MyRoutes.loginRoute: (context) => LoginPage(), //route to loginpage
        MyRoutes.signupRoute: (context) => Signup(), //route to signuppage
        MyRoutes.cartRoute: (context) => CartPage(),
      },
    );
  }
}
