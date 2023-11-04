import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/theme.dart';
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
        foregroundColor:  context.theme.colorScheme.secondary,
        title: "Cart".text.xl3.make().px(100),
      ),
    );
  }
}
