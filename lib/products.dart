import 'package:flutter/material.dart';

@immutable
class Products extends StatelessWidget {
  final List<String> products;

  Products(this.products);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: products
            .map((it) => Card(
                  child: Column(
                    children: <Widget>[
                      Image.asset('assets/food.jpg'),
                      Text('Food Paradise')
                    ],
                  ),
                ))
            .toList());
  }
}
