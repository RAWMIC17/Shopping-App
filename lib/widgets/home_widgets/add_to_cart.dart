import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/store.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/cart.dart';
import '../../models/catalog.dart';

class AddtoCart extends StatelessWidget {
  final Item catalog;
  AddtoCart({
    super.key,
    required this.catalog,
  });

  @override
  Widget build(BuildContext context) {
    VxState.watch(context,
        on: [AddMutation]); //alternative to set state with mutations
    final CartModel _cart = (VxState.store as MyStore).cart;
    //final CatalogModel _catalog = (VxState.store as MyStore).catalog;

    bool inInCart = _cart.items.contains(catalog)??false; //creating a check for items in cart
    return ElevatedButton(
      onPressed: () {
        if (!inInCart) {
          //inInCart = inInCart.toggle();
          //final _catalog = CatalogModel();

          // _cart.add(catalog);
          //_cart.catalog = _catalog;
          AddMutation(catalog as int);
          //setting catalog
          //setState(() {});
        }
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(//to change button color
              context.theme.highlightColor),
          shape: MaterialStateProperty.all(
            StadiumBorder(),
          )),
      child: inInCart ? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus),
    );
  }
}
