import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamcolor,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        foregroundColor:  Colors.black,
        title: "Cart".text.xl3.make().px(100),
      ),
    );
  }
}
