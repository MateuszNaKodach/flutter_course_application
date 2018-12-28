import 'package:flutter/material.dart';
import 'package:flutter_course_application/product_control.dart';
import 'package:flutter_course_application/products.dart';

@immutable
class ProductManager extends StatelessWidget {
  final List<Map<String,String>> products;
  final Function addProduct;
  final Function deleteProduct;

  ProductManager(this.products, this.addProduct, this.deleteProduct);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          margin: EdgeInsets.all(10.0), child: ProductControl(addProduct)),
      //Container(height: 350, child: Products(_products))
      Expanded(child: Products(products, deleteProduct: deleteProduct))
    ]);
  }
}
