import 'package:flutter/material.dart';
import 'package:flutter_course_application/product_control.dart';
import 'package:flutter_course_application/products.dart';

@immutable
class ProductManager extends StatefulWidget {
  final Map<String, String> startingProduct;

  ProductManager({this.startingProduct});

  @override
  State createState() {
    return _ProductManagerState();
  }
}

class _ProductManagerState extends State<ProductManager> {
  List<Map<String, String>> _products = [];

  @override
  void initState() {
    if (widget.startingProduct != null) {
      this._products.add(widget.startingProduct);
    }
    super.initState();
  }

  void _addProduct(Map<String, String> product) {
    setState(() {
      _products.add(product);
    });
  }

  void _deleteProduct(int index) {
    setState(() {
      _products.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          margin: EdgeInsets.all(10.0), child: ProductControl(_addProduct)),
      //Container(height: 350, child: Products(_products))
      Expanded(child: Products(_products, deleteProduct: _deleteProduct))
    ]);
  }
}
