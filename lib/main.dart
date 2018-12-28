import 'package:flutter/material.dart';
import 'package:flutter_course_application/pages/home.dart';
import 'package:flutter_course_application/product_manager.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.deepOrange,
            accentColor: Colors.deepPurple),
        home: HomePage());
  }
}
