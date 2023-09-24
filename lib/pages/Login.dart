import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/routes.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //'_' means private data members or classes

  String name = "";
  //TextEditingController Vaibhav = TextEditingController();
  bool changeButton = false;
  final _formkey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });

      await Future.delayed(Duration(seconds: 1)); //making user wait 1 seconds
      await Navigator.pushNamed(context, MyRoutes.homeRoute);

      setState(() {
        changeButton = false; // to come back and button reset
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        //replace material with scaffold for app bar
        color: Colors.white,
        child: SingleChildScrollView(
          //gives scroll bar for smaller devices(bottom overflow error avoided)
          child: Form(
            //to associate text field together
            key: _formkey,
            child: Column(
              children: [
                Image.asset(
                  "assets/img/undraw_hey_email_liaa.png", //image
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  //gap between image and text
                  height: 40.0,
                ),
                Text(
                  "Welcome $name", //text
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 32.0),
                  child: Column(
                    children: [
                      TextFormField(
                        //textformfield instead of textfield
                        decoration: InputDecoration(
                            hintText: "Enter Username", labelText: "Username"),
                        validator: (value) {
                          if (value!.isEmpty) {
                            //conditioning the text field
                            return "Username can't be empty";
                          }
                          return null; //else no problem
                        },
                        onChanged: (value) {
                          name = value;
                          setState(() {}); //recalling build method
                        },
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: "Enter Password", labelText: "Password"),
                        validator: (value) {
                          if (value!.isEmpty) {
                            //conditioning the text field
                            return "Password can't be empty";
                          } else if (value.length < 8) {
                            //password length validation
                            return "Password length must be atleast 8 alphanumeric characters";
                          } //This validation returns the user to home page
                          return null; //else no problem
                        },
                      ),
                      SizedBox(
                        //box for button
                        height: 20.0,
                      ),
                      Material(
                        //used to give ripple, tap effect, ancestor widget
                        color:
                            Colors.deepPurple, //no decoration in child widget
                        borderRadius:
                            BorderRadius.circular(changeButton ? 50 : 8),
                        child: InkWell(
                          onTap: () => moveToHome(
                              context), //using the function made above
                          child: AnimatedContainer(
                            duration: Duration(
                              seconds: 1, //wait time 1 seconds
                            ),
                            width: changeButton ? 50 : 150,
                            height: 50,
                            //color: Colors.deepPurple,//can be used here also and also in the decoration but not in both 'causes error'
                            alignment: Alignment.center,
                            child: changeButton
                                ? Icon(
                                    Icons.done,
                                    color: Colors.white,
                                  )
                                : //done icon
                                Text(
                                    "Login",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                          ),
                        ),
                      )
                      /*ElevatedButton(  // another alternative for a button 
                        onPressed: () {
                          Navigator.pushNamed(
                              context,
                              MyRoutes
                                  .homeRoute); //routing homepage on button press
                        },
                        child: Text("Login"),
                        style: TextButton.styleFrom(minimumSize: Size(120, 40)),
                      )*/
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
