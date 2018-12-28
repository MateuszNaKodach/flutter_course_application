import 'package:flutter/material.dart';
import 'package:flutter_course_application/pages/products.dart';

class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Center(
          child: RaisedButton(
              child: Text('LOGIN'),
              onPressed: () => _navigateToProductsPage(context))),
    );
  }

  _navigateToProductsPage(BuildContext context) {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) => ProductsPage()));
  }
}
