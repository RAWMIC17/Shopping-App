import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    //final imageUrl=""  for network image
    final imageUrl = "assets/img/Tony.jpg";

    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                padding: EdgeInsets.zero, //to remove white borders
                child: UserAccountsDrawerHeader(
                  margin: EdgeInsets.zero,
                  /*decoration: BoxDecoration(
                    color: Colors.orange.shade700
                  ),*/
                  accountName: Text("Stark"),
                  accountEmail: Text("StarkLovesToRock@pappu.com"),
                  currentAccountPicture: CircleAvatar(                          //Image.network(imageUrl)
                    foregroundImage: AssetImage(imageUrl),                      //NetworkImage for network image
                    radius: 50.0,
                    //backgroundColor: Colors.amber,                    
                ),
                ),
                ),
                ListTile(
                  leading: Icon(
                    CupertinoIcons.home,
                    color: Colors.white),
                    title: Text("Home",
                    textScaleFactor: 1.2,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    ),
                ),
                ListTile(
                  leading: Icon(
                    CupertinoIcons.profile_circled,
                    color: Colors.white),
                    title: Text("Profile",
                    textScaleFactor: 1.2,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    ),
                ),
                ListTile(
                  leading: Icon(
                    CupertinoIcons.settings,
                    color: Colors.white),
                    title: Text("Settings",
                    textScaleFactor: 1.2,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    ),
                )
         ], //similar to column
        ),
      ),
    );
  }
}
