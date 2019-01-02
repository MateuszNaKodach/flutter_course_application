import 'package:flutter/material.dart';
import 'package:flutter_course_application/models/product.dart';
import 'package:flutter_course_application/widgets/products/product_card.dart';

@immutable
class Products extends StatelessWidget {
  final List<Product> products;

  Products(this.products);

  @override
  Widget build(BuildContext context) => products.length > 0
      ? ListView.builder(
          itemCount: products.length, itemBuilder: _buildProductItem)
      : Center(child: Text('No products found, please add some.'));

  Widget _buildProductItem(BuildContext context, int index) =>
      ProductCard(product: products[index], productIndex: index);
}
