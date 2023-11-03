// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/widgets/theme.dart';

import '../widgets/home_widgets/catalog_header.dart';
import '../widgets/home_widgets/catalog_list.dart'; //importing is necessary

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  final String name = "Stark";

  @override
  void initState() {
    //calling data before the build
    super.initState();
    loadData(); //declaring load data method
  }

  loadData() async {
    //creating method
    await Future.delayed(Duration(seconds: 2));
    final catalogJson = await rootBundle.loadString(
        "assets/files/catalog.json"); //file may take time to load, so wait
    //print(catalogJson);  //to check if the file loaded
    final decodeData =
        jsonDecode(catalogJson); //decoding the string provide by json to object
    //print(decodeData);
    var productData = decodeData["products"];
    CatalogModel.items = List.from(productData)
        .map<Item>((item) => Item.fromMap(item))
        .toList(); //returns list of items
    setState(() {}); //calling build method
    //print(productData);
  }

  /*double a = 3.14;
    bool isMale = true;
    num b = 30.5;        //takes both int and double
    var b = "Tuesday";  //automatically understands that it's a string
    const pi = 3.14;    //value can't be changed
    */
  @override
  Widget build(BuildContext context) {
    //context is element(stateless)
    //final dummyList = List.generate(
    //  15, (index) => CatalogModel.items[0]); //creating 15 items from one item
    return Scaffold(
      //appBar: AppBar(),
      backgroundColor: MyTheme.creamcolor,
      floatingActionButton: FloatingActionButton(//for floating stationary button
        onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
        backgroundColor: MyTheme.darkbluishcolor,
        child:Icon(CupertinoIcons.cart),),
      body: SafeArea(
        child: Container(
          padding: Vx.m20, //edgeinsects.all32
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, //to keep text to left
            children: [
              CatalogHeader(), //linking catalog header widget
              if (CatalogModel.items.isNotEmpty)
                CatalogList().py16().expand()
              else
                 CircularProgressIndicator().centered().expand(),//center and expand for indicator to be in center
            ],
          ),
        ),
      ),
      /*appBar: AppBar(
        // theme code
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0, // for appbar shadow
        iconTheme: IconThemeData(color: Colors.black),
        title: const Text(
          "Shopping App",
          textScaleFactor: 1.2,
          style: TextStyle(color: Colors.black),
        ),
      ),*/
      /*body: Container(     
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
        */),*/
      /* body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: (CatalogModel.items.isNotEmpty)
            ? GridView.builder(
                //list view in day10
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,    //no. of items in 1 row
                    mainAxisSpacing: 16,  //vertical spacing
                    crossAxisSpacing: 16),//horizontal spacing
                itemBuilder: (context, index) {
                  final item = CatalogModel.items[index];
                  return Card(elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                                clipBehavior: Clip.antiAlias,
                    child: GridTile(header: Container(child: Text(item.name,style: TextStyle(color: Colors.white),),
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Colors.deepPurple,
                                ),
                      ),
                           child: Image.asset(item.image),
                           footer: Container(child: Text(item.price.toString(),style: TextStyle(color: Colors.white),),
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                ),
                      ),
                           )
                          );
                },
                itemCount: CatalogModel.items.length,
              )
            : Center(
                child: CircularProgressIndicator(), //else
              ),
      ),
      drawer: MyDrawer(),*/
    );
  }
}
