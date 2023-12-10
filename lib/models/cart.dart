import 'package:flutter_application_1/models/catalog.dart';

class CartModel{
  static final cartModel = CartModel._internal();   //make class singleton
  CartModel._internal();
  factory CartModel() => cartModel;

  //catalog field
  late CatalogModel _catalog; // its private due to underscore, we need a getter

  //collection of IDs- store Ids of each item
  final List<int> _itemIds = [];

  //get catalog
  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  //Get items in the cart
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  //get Total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  //add items
  void add(Item item) {
    _itemIds.add(item.id);
  }

  //Remove items
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
