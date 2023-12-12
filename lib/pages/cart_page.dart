import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/cart.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        elevation: 3,
        backgroundColor: context.canvasColor,
        foregroundColor: context.theme.colorScheme.secondary,
        title: "Cart".text.xl3.make().px(100),
      ),
      body: Column(
        children: [
          _CartList().p16().expand(),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({super.key});

  @override
  Widget build(BuildContext context) {
    final _cart = CartModel();
    return SizedBox(
      height: 200,
      child: Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceAround, //better than spacebetween
          children: [
            "\$${_cart.totalPrice}"
                .text
                .xl4
                .color(context.theme.colorScheme.secondary)
                .make(),
            30.widthBox,
            ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        //To display system message
                        content: "Buying not supported yet.".text.make(),
                      ));
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            context.theme.highlightColor)),
                    child: "Buy".text.make())
                .w32(context),
          ]),
    );
  }
}

class _CartList extends StatelessWidget {
  //will be having a remove item button
 _CartList({super.key});

  //@override
  //State<_CartList> createState() => _CartListState();


//class _CartListState extends State<_CartList> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    return _cart.items.isEmpty
        ? "Nothing to show".text.xl3.makeCentered()
        : ListView.builder(
            itemCount: _cart.items?.length,
            itemBuilder: (context, index) => ListTile(
              leading: Icon(Icons.done),
              trailing: IconButton(
                icon: Icon(
                  Icons.remove_circle_outline_outlined,
                  color: Colors.red,
                ),
                onPressed: () {
                  _cart.remove(_cart.items[index]);
                  //setState(() {})
                },
              ),
                  title: _cart.items[index].name.text.make(),
                )
                );
                }
}