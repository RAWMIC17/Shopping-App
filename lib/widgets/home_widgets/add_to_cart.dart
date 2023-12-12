import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/cart.dart';
import '../../models/catalog.dart';

class AddtoCart extends StatelessWidget {
  final Item catalog;
  AddtoCart({
    super.key,
    required this.catalog,
  });

  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    bool inInCart = _cart.items.contains(catalog) ??
        false; //creating a check for items in cart
    return ElevatedButton(
        onPressed: () {
          if (!inInCart) {
            inInCart = inInCart.toggle();
            final _catalog = CatalogModel();

            _cart.add(catalog);
            _cart.catalog = _catalog; //setting catalog
            //setState(() {});
          }
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(//to change button color
                context.theme.highlightColor),
            shape: MaterialStateProperty.all(
              StadiumBorder(),
            )),
        child: inInCart ? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus),);
  }
}
