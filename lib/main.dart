import 'package:flutter/material.dart';
import 'package:flutter_course_application/models/product.dart';
import 'package:flutter_course_application/pages/product.dart';
import 'package:flutter_course_application/pages/products.dart';
import 'package:flutter_course_application/pages/products_admin.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  List<Product> _products = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.deepOrange,
            accentColor: Colors.deepPurple),
        //home: AuthPage(),
        routes: {
          Routes.ROOT: (BuildContext context) =>
              ProductsPage(_products),
          Routes.ADMIN: (BuildContext context) => ProductsAdminPage(_addProduct, _deleteProduct)
        },
        onGenerateRoute: (RouteSettings settings) {
          final List<String> pathElements = settings.name.split('/');
          if (pathElements[0] != '') {
            return null;
          }
          if (pathElements[1] == 'product') {
            final int index = int.parse(pathElements[2]);
            return MaterialPageRoute<bool>(
                builder: (BuildContext context) => ProductPage(
                    _products[index]));
          }
          return null;
        },
        onUnknownRoute: (RouteSettings settings) {
          return MaterialPageRoute(
              builder: (BuildContext context) =>
                  ProductsPage(_products));
        });
  }

  void _addProduct(Product product) {
    setState(() {
      _products.add(product);
    });
  }

  void _deleteProduct(int index) {
    setState(() {
      _products.removeAt(index);
    });
  }
}

class Routes {
  static const ROOT = '/';
  static const ADMIN = '/admin';

  static PRODUCT(final int index) => '/product/$index';
}
