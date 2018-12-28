import 'package:flutter/material.dart';
import 'package:flutter_course_application/models/product.dart';
import 'package:flutter_course_application/products.dart';

@immutable
class ProductManager extends StatelessWidget {
  final List<Product> products;

  ProductManager(this.products);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(child: Products(products))
    ]);
  }
}
