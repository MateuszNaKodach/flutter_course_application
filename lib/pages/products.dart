import 'package:flutter/material.dart';
import 'package:flutter_course_application/main.dart';
import 'package:flutter_course_application/models/product.dart';
import 'package:flutter_course_application/product_manager.dart';

class ProductsPage extends StatelessWidget {
  final List<Product> products;

  ProductsPage(this.products);

  @override
  Widget build(BuildContext context) => Scaffold(
      drawer: _buildNavigationDrawer(context),
      appBar: AppBar(title: Text('EasyList')),
      body: ProductManager(this.products));

  Widget _buildNavigationDrawer(BuildContext context) {
    return Drawer(child: Column(
        children: [
          AppBar(title: Text('Choose'), automaticallyImplyLeading: false),
          ListTile(title: Text('Manage Products'), onTap: ()=>_navigateToProductsAdminPage(context))
        ]
    ));
  }

  void _navigateToProductsAdminPage(BuildContext context){
    Navigator.pushReplacementNamed(context, Routes.ADMIN);
  }
}
