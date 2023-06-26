import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  final int days = 30;
   final String name = "Harsh";
    /*double a = 3.14;
    bool isMale = true;
    num b = 30.5;        //takes both int and double
    var b = "Tuesday";  //automatically understands that it's a string
    const pi = 3.14;    //value can't be changed
    */

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text("First App"),
      ),
        body: Center(
          child: Container(
            child: Text("$days days of flutter by $name "),
          ),
        ),
       drawer: Drawer(),  
      );
  }
}