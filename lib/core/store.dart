// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_application_1/models/cart.dart';
import 'package:flutter_application_1/models/catalog.dart';
//basically store all data and provide wherever needed
class MyStore extends VxStore {
  //need objecs of manipulated models-> catalog and cart model
  CatalogModel catalog;
  CartModel cart;

  MyStore() {
    CatalogModel catalog = CatalogModel();
    CartModel cart = CartModel();
    cart.catalog = catalog; //to fetch catalog details
  }

  //CartModel get cart => _cart;

}
