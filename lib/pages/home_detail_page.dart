// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_application_1/models/catalog.dart';

class HomeDetailPage extends StatelessWidget {
  const HomeDetailPage({
    Key? key,
    required this.catalog,
  })  : assert(catalog != null),
        super(key: key);

  final Item catalog;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.canvasColor, //for background
        foregroundColor: Vx.white,
      ), //for back button
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.theme.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: Vx.m0,
          children: [
            "\$${catalog.price}".text.bold.xl4.red800.make(),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(//to change button color
                          context.theme.highlightColor),
                  shape: MaterialStateProperty.all(
                    StadiumBorder(),
                  )),
              child: "Add to Cart".text.xl.make(),
            ).wh(130, 50)
          ],
        ).px20().py32(),
      ), //description is captions
      body: SafeArea(
        bottom: false, //to remove safearea from bottom
        child: Column(
          children: [
            Hero(
                    tag: catalog.id.toString(), //for animation
                    child: Image.asset(catalog.image))
                .h32(context)
                .py8(),
            Expanded(
                child: VxArc(
              height: 30.0,
              arcType: VxArcType.convey, //fro arc shape
              edge: VxEdge.top, //side where shape needed
              child: Container(
                color: context.cardColor,
                width: context.screenWidth, //to keep column wide as per screen
                child: Column(
                  children: [
                    catalog.name.text.xl4
                        .color(context.theme.colorScheme.secondary)
                        .bold
                        .make(),
                    catalog.desc.text.xl
                        .textStyle(context.captionStyle)
                        .make()
                        .py4(),
                    10.heightBox,
                    "Ex dolor nulla qui enim.Ex dolor nulla qui enim.Ex dolor nulla qui enim. Ex dolor nulla qui enim.Ex dolor nulla qui enim.Ex dolor nulla qui enim. Ex dolor nulla qui enim.Ex dolor nulla qui enim.Ex dolor nulla qui enim. Ex dolor nulla qui enim.Ex dolor nulla qui enim Ex dolor nulla qui enim.Ex dolor nulla qui enim"
                        .text
                        .textStyle(context.captionStyle)
                        .make()
                        .px32()
                        .py16(),
                  ],
                ).py32(),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
