import 'package:flutter/material.dart';
import 'package:flutter_widgets/models/models.dart';
import 'package:intl/intl.dart';

class ProductCard extends StatelessWidget {
  final Products product;
  ProductCard({this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: ListTile(
        contentPadding: EdgeInsets.all(10),
        leading: CircleAvatar(
          backgroundColor: Colors.white,
          backgroundImage: NetworkImage(
            product.image,
            scale: 40,
          ),
          child: Text(
            product.name[0],
            style: TextStyle(fontSize: 20),
          ),
        ),
        subtitle: Text(
            NumberFormat.currency(locale: 'id', decimalDigits: 0, symbol: 'Rp ')
                .format(product.price)),
        // subtitle: Text(product.price),
        title: Text(
          product.name,
          style: TextStyle(fontSize: 20),
        ),
        onTap: () {
          //bagian kita membuat detail product
        },
      ),
    );
  }
}
