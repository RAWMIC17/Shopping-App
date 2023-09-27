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
//Widgets are immutable , they are replaced with newer versions when an update is made
//elements can be updated and changed

  @override
  Widget build(BuildContext context) {  //context is element(stateless)
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
      body: Container(     
        //height: 400,         //dimensions of parent will be enforced on child
        //width: 400,
         constraints: BoxConstraints(//another way of assigning sizes
          minHeight: 70,       //constraints of parents will be enforced on children
          maxHeight: 200,
          minWidth: 70,
          maxWidth: 200,
         ),     
        color: Colors.green,     //Won't show green until child has it's own color
        child: Container(
          height: 100,     //these dimensions will be of no use if parent specify sizes
          width: 100,      //but in case of constraints, they lie within the range so they will be applicable here
          color: Colors.red,     //This will be rendered instead of green
        ),
      
      /*body: Center(
        child: Container(
          child: Text(context.runtimeType.toString()), //to know about context
        ),*/
        /*body: Center(
        child: Container(
          child: Text("$name 's catalog app"), //to know about context
        ),
      ),*/
      ),
      drawer: MyDrawer(),
    );
  }
}
