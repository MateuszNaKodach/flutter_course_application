import 'package:flutter/material.dart';

@immutable
class Products extends StatelessWidget {
  final List<String> products;

  Products(this.products);

  @override
  Widget build(BuildContext context) => products.length > 0
      ? ListView.builder(
          itemCount: products.length, itemBuilder: _buildProductItem)
      : Center(child: Text('No products found, please add some.'));

  Widget _buildProductItem(BuildContext context, int index) => Card(
        child: Column(
          children: <Widget>[
            Image.asset('assets/food.jpg'),
            Text(products[index])
          ],
        ),
      );
}
