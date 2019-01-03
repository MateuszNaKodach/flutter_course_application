import 'package:flutter/material.dart';
import 'package:flutter_course_application/main.dart';
import 'package:flutter_course_application/models/product.dart';
import 'package:flutter_course_application/widgets/products/products.dart';

class ProductsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) => Scaffold(
      drawer: _buildNavigationDrawer(context),
      appBar: AppBar(
        title: Text('EasyList'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {},
          )
        ],
      ),
      body: Products());

  Widget _buildNavigationDrawer(BuildContext context) {
    return Drawer(
        child: Column(children: [
      AppBar(title: Text('Choose'), automaticallyImplyLeading: false),
      ListTile(
          leading: Icon(Icons.edit),
          title: Text('Manage Products'),
          onTap: () => _navigateToProductsAdminPage(context))
    ]));
  }

  void _navigateToProductsAdminPage(BuildContext context) {
    Navigator.pushReplacementNamed(context, Routes.ADMIN);
  }
}
