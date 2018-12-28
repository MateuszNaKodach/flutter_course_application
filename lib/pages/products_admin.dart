import 'package:flutter/material.dart';
import 'package:flutter_course_application/pages/products.dart';

class ProductsAdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: _buildNavigationDrawer(context),
        appBar: AppBar(title: Text('Manage Products')),
        body: Center(child: Text('Manage your products')));
  }

  Widget _buildNavigationDrawer(BuildContext context) {
    return Drawer(child: Column(
        children: [
          AppBar(title: Text('Choose'), automaticallyImplyLeading: false),
          ListTile(title: Text('All Products'), onTap: ()=>_navigateToProductsPage(context))
        ]
    ));
  }

  void _navigateToProductsPage(BuildContext context){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=> ProductsPage()));
  }
}
