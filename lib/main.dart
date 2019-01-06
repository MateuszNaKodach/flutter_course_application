import 'package:flutter/material.dart';
import 'package:flutter_course_application/models/product.dart';
import 'package:flutter_course_application/pages/auth.dart';
import 'package:flutter_course_application/pages/product.dart';
import 'package:flutter_course_application/pages/products.dart';
import 'package:flutter_course_application/pages/products_admin.dart';
import 'package:flutter_course_application/scoped_models/main.dart';
import 'package:scoped_model/scoped_model.dart';

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
    final mainModel = MainModel();
    return ScopedModel<MainModel>(
      model: mainModel,
      child: MaterialApp(
          theme: ThemeData(
              brightness: Brightness.light,
              primarySwatch: Colors.deepOrange,
              accentColor: Colors.deepPurple),
          //home: AuthPage(),
          routes: {
            Routes.AUTH: (BuildContext context) => AuthPage(),
            Routes.PRODUCTS: (BuildContext context) => ProductsPage(model: mainModel),
            Routes.ADMIN: (BuildContext context) => ProductsAdminPage()
          },
          onGenerateRoute: (RouteSettings settings) {
            final List<String> pathElements = settings.name.split('/');
            if (pathElements[0] != '') {
              return null;
            }
            if (pathElements[1] == 'product') {
              final int index = int.parse(pathElements[2]);
              return MaterialPageRoute<bool>(
                  builder: (BuildContext context) => ProductPage(index));
            }
            return null;
          },
          onUnknownRoute: (RouteSettings settings) {
            return MaterialPageRoute(
                builder: (BuildContext context) => ProductsPage(model: mainModel));
          }),
    );
  }
}

class Routes {
  static const AUTH = '/';
  static const PRODUCTS = '/products';
  static const ADMIN = '/admin';

  static PRODUCT(final int index) => '/product/$index';
}
