import 'package:flutter/material.dart';
import 'package:flutter_course_application/main.dart';
import 'package:flutter_course_application/pages/product_edit.dart';
import 'package:flutter_course_application/pages/product_list.dart';

class ProductsAdminPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2, child: _buildScaffold(context));
  }

  Widget _buildScaffold(BuildContext context) {
    return Scaffold(
        drawer: _buildNavigationDrawer(context),
        appBar: _buildPageAppBar(context),
        body: _buildPageBody(context));
  }

  Widget _buildPageAppBar(BuildContext context) {
    return AppBar(
        title: Text('Manage Products'),
        bottom: TabBar(tabs: [
          Tab(text: 'Create Product', icon: Icon(Icons.create)),
          Tab(text: 'My Products', icon: Icon(Icons.list))
        ]));
  }

  Widget _buildPageBody(BuildContext context) {
    return TabBarView(
        children: [ProductEditPage(), ProductListPage()]);
  }

  Widget _buildNavigationDrawer(BuildContext context) {
    return Drawer(
        child: Column(children: [
      AppBar(title: Text('Choose'), automaticallyImplyLeading: false),
      ListTile(
          leading: Icon(Icons.shop),
          title: Text('All Products'),
          onTap: () => _navigateToProductsPage(context))
    ]));
  }

  void _navigateToProductsPage(BuildContext context) {
    Navigator.pushReplacementNamed(context, Routes.PRODUCTS);
  }
}
