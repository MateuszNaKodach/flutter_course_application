import 'package:flutter/material.dart';
import 'package:flutter_course_application/main.dart';
import 'package:flutter_course_application/product_manager.dart';

class ProductsPage extends StatelessWidget {
  final List<Map<String,String>> products;
  final Function addProduct;
  final Function deleteProduct;

  ProductsPage(this.products, this.addProduct, this.deleteProduct);

  @override
  Widget build(BuildContext context) => Scaffold(
      drawer: _buildNavigationDrawer(context),
      appBar: AppBar(title: Text('EasyList')),
      body: ProductManager(this.products, this.addProduct, this.deleteProduct));

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
