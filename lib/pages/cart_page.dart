import 'package:flutter/material.dart';
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
    return SizedBox(
      height: 200,
      child: Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceAround, //better than spacebetween
          children: [
            "\$9999".text.xl4.color(context.theme.colorScheme.secondary).make(),
            30.widthBox,
            ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(//To display system message
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

class _CartList extends StatefulWidget {
  //will be having a remove item button
  const _CartList({super.key});

  @override
  State<_CartList> createState() => _CartListState();
}

class _CartListState extends State<_CartList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.done),
        trailing: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.remove_circle_outline_outlined,
              color: Colors.red,
            )),
        title: "Item 1".text.make(),
      ),
    );
  }
}
