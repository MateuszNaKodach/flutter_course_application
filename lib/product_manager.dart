import 'package:flutter/material.dart';
import 'package:flutter_course_application/product_control.dart';
import 'package:flutter_course_application/products.dart';

@immutable
class ProductManager extends StatefulWidget {

  final String startingProduct;

  ProductManager({this.startingProduct = 'Sweets Tester'});

  @override
  State createState() {
    return _ProductManagerState();
  }
}

class _ProductManagerState extends State<ProductManager> {
  List<String> _products = [];

  @override
  void initState() {
    this._products.add(widget.startingProduct);
    super.initState();
  }

  void _addProduct(String product){
    setState(() {
      _products.add(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(10.0),
          child: ProductControl(_addProduct)
        ),
        Products(_products)
      ],
    );
  }
}