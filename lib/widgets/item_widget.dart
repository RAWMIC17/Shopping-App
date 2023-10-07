// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import '../models/catalog.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({super.key, required this.item})
  :assert(item!=null);   //condition for item to not be returned null

  @override
  Widget build(BuildContext context) {
    return Card(
      //elevation: 0.0,
      child: ListTile(
        onTap: () {
          print("${item.name} pressed");
        },
            leading:SizedBox(child: Image.asset(item.image), height: 50,width: 50,),
            title: Text(item.name),
            subtitle: Text(item.desc),
            trailing: Text(
              "\$${item.price}",
              textScaleFactor: 1.5,
            style: TextStyle(
              color: Colors.deepPurple,
              fontWeight: FontWeight.bold,
            ),
            )
      ),
    );
  }
}
