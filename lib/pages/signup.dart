import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: Column(
          children: [
            Padding(padding: const EdgeInsets.symmetric(vertical: 20.0)),
            SizedBox(
              height: 100,
              child: "Joining Details".text.underline.xl5.make().py24(),
            ),
            SingleChildScrollView(
                //gives scroll bar for smaller devices(bottom overflow error avoided)
                child: Form(
                    //to associate text field together
                    child: Column(children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "Enter First Name",
                          labelText: "First Name"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          //conditioning the text field
                          return "First name can't be empty";
                        }
                        return null; //else no problem
                      },
                    ),
                    TextFormField(
                        decoration: InputDecoration(
                            hintText: "Enter Last Name",
                            labelText: "Last Name"),
                        validator: (value) {
                          if (value!.isEmpty) {
                            //conditioning the text field
                            return "Last name can't be empty";
                          }
                          return null; //else no problem
                        }),
                    TextFormField(
                        decoration: InputDecoration(
                            hintText: "Enter Email id", labelText: "Email id"),
                        validator: (value) {
                          if (value!.isEmpty) {
                            //conditioning the text field
                            return "Email id can't be empty";
                          }
                          return null; //else no problem
                        }),
                    TextFormField(
                        decoration: InputDecoration(
                            hintText: "Enter Phone Number",
                            labelText: "Phone Number"),
                        validator: (value) {
                          if (value!.isEmpty) {
                            //conditioning the text field
                            return "Phone Number can't be empty";
                          }
                          return null; //else no problem
                        }),
                    TextFormField(
                        decoration: InputDecoration(
                            hintText: "Enter Pincode", labelText: "Pincode"),
                        validator: (value) {
                          if (value!.isEmpty) {
                            //conditioning the text field
                            return "Pincode can't be empty";
                          }
                          return null; //else no problem
                        }),
                  ],
                ),
              ),
              SizedBox(
                //box for button gap
                height: 50.0,
              ),
              Material(
                color: Colors.deepPurple, //no decoration in child widget
                borderRadius: BorderRadius.circular(8),
                child: InkWell(
                  onTap: () => Signup(), //using the function made above
                  child: Container(
                      width: 150,
                      height: 50,
                      //color: Colors.deepPurple,//can be used here also and also in the decoration but not in both 'causes error'
                      alignment: Alignment.center,
                      child: "Sign Up".text.bold.xl.white.make()),
                ),
              )
            ]))),
          ],
        ));
  }
}
