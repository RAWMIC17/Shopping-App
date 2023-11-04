import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';


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
              .color(context.theme.colorScheme.secondary)
              .make(), //xl5 is size
          //Text("Catalog App"), same thing as text make
          "Trending Products".text.xl2.make(),
        ],
      ),
    );
  }
}