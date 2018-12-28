import 'package:flutter/material.dart';
import 'package:flutter_course_application/product_manager.dart';

class ProductsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      Scaffold(appBar: AppBar(title: Text('EasyList')), body: ProductManager());
}
