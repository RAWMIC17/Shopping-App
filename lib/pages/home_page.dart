// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_application_1/models/catalog.dart';
import 'package:flutter_application_1/widgets/theme.dart';

import '../widgets/drawer.dart';
import '../widgets/item_widget.dart'; //importing is necessary

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
      backgroundColor: MyTheme.creamcolor,
      body: SafeArea(
        child: Container(
          padding: Vx.m20, //edgeinsects.all32
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, //to keep text to left
            children: [
              CatalogHeader(), //linking catalog header widget
              if (CatalogModel.items.isNotEmpty)
                CatalogList().expand()
              else
                Center(
                  child: CircularProgressIndicator(),
                )
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

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Vx.m24, //edgeinsects.all32
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, //to keep text to left
        children: [
          "Catalog App"
              .text
              .xl5
              .bold
              .color(MyTheme.darkbluishcolor)
              .make(), //xl5 is size
          //Text("Catalog App"), same thing as text make
          "Trending Products".text.xl2.make(),
        ],
      ),
    );
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: CatalogModel.items.length,
        itemBuilder: (context, index) {
          final catalog = CatalogModel.items[index];
          return CatalogItem(catalog: catalog);
        });
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem({
    Key? key,
    required this.catalog,
  })  : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        CatalogImage(image: catalog.image),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalog.name.text.lg.color(MyTheme.darkbluishcolor).bold.make(),
            catalog.desc.text.textStyle(context.captionStyle).make().py4(),
            10.heightBox, //sized box to have space between items in the box
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: Vx.m0,
              children: [
                "\$${catalog.price}".text.bold.xl.make(),
                ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(//to change button color
                                MyTheme.darkbluishcolor),
                        shape: MaterialStateProperty.all(
                          StadiumBorder(),
                        )),
                    child: "Buy".text.lg.make())
              ],
            ).pOnly(right: 8.0) //description is captions
          ],
        ))
      ],
    )).white.roundedLg.square(150).make().py16(); //container
  }
}

class CatalogImage extends StatelessWidget {
  const CatalogImage({
    Key? key,
    required this.image,
  }) : super(key: key);
  final String image;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
    ).box.rounded.p8.color(MyTheme.creamcolor).make().p16().w40(context);
  }
}
