import 'package:flutter/material.dart';

import '../widgets/drawer.dart';//importing is necessary

class HomePage extends StatelessWidget {
  final int days = 30;
  final String name = "Stark";

  const HomePage({super.key});

  /*double a = 3.14;
    bool isMale = true;
    num b = 30.5;        //takes both int and double
    var b = "Tuesday";  //automatically understands that it's a string
    const pi = 3.14;    //value can't be changed
    */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(// theme code 
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,  // for appbar shadow
        iconTheme: IconThemeData(color: Colors.black),
        title: const Text("First App",
        textScaleFactor: 1.2,
        style: TextStyle(color: Colors.black),
      ),
      ),
      body: Center(
        child: Container(
          child: Text("$name's catalog app!! ",textScaleFactor: 2,),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
