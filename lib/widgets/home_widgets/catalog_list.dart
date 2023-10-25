import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home_detail_page.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/catalog.dart';
import '../theme.dart';
import 'catalog_image.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: CatalogModel.items.length,
        itemBuilder: (context, index) {
          final catalog = CatalogModel.items[index];
          return InkWell(
          onTap: () => Navigator.push(context, MaterialPageRoute(
            builder: (context)=> HomeDetailPage(
              catalog: catalog)
              )
            ),
              child: CatalogItem(catalog: catalog)
           );
        }
        );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem({
    Key? key,
    required this.catalog,
  // ignore: unnecessary_null_comparison
  })  : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Hero( tag: catalog.id.toString(),  //for animation
          child: CatalogImage(image: catalog.image)),
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