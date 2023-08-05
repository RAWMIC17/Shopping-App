import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/routes.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //'_' means private data members or classes

  String name = "";
  bool changeButton = false;
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          //gives scroll bar for smaller devices(bottom overflow error avoided)
          child: Column(
            children: [
              Image.asset(
                "assets/img/login_image.png", //image
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
                      decoration: InputDecoration(
                          hintText: "Enter Username", labelText: "Username"),
                      onChanged: (value) {
                        name = value;
                        setState(() {}); //recalling build method
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Enter Password", labelText: "Password"),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    InkWell(
                      onTap: () async {
                        setState(() {
                          changeButton = true;
                        });

                        await Future.delayed(Duration(seconds: 1));//making user wait 1 seconds
                        Navigator.pushNamed(context, MyRoutes.homeRoute);
                      },
                      child: AnimatedContainer(
                        duration: Duration(
                          seconds: 1,
                        ),
                        width: changeButton? 50 : 150,
                        height: 50,
                        //color: Colors.deepPurple,//can be used here also and also in the decoration but not in both 'causes error'
                        alignment: Alignment.center,
                        child:changeButton?Icon(Icons.done, color: Colors.white,): //done icon
                        Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          //shape: changeButton
                          //? BoxShape.circle:BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(changeButton?50:8),
                        ),
                      ),
                    )
                    /*ElevatedButton(
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
        ));
  }
}
