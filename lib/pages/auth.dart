import 'package:flutter/material.dart';
import 'package:flutter_course_application/main.dart';

/**
 * Why whole UI is in method createState?
 */
class AuthPage extends StatefulWidget {
  @override
  State createState() {
    return _AuthPageState();
  }

  _navigateToProductsPage(BuildContext context) {
    Navigator.pushReplacementNamed(context, Routes.PRODUCTS);
  }
}

class _AuthPageState extends State<AuthPage> {
  String _emailValue;
  String _passwordValue;
  bool _acceptTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Login')),
        body: Container(
          margin: EdgeInsets.all(10.0),
          child: ListView(
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'E-mail'),
                keyboardType: TextInputType.emailAddress,
                onChanged: (String value) {
                  _emailValue = value;
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                onChanged: (String value) {
                  _passwordValue = value;
                },
              ),
              SwitchListTile(
                  title: Text('Accept Terms'),
                  value: _acceptTerms,
                  onChanged: (bool value) {
                    setState(() {
                      _acceptTerms = value;
                    });
                  }),
              SizedBox(height: 10.0),
              RaisedButton(
                  color: Theme.of(context).primaryColor,
                  child: Text('LOGIN'),
                  onPressed: () => widget._navigateToProductsPage(context))
            ],
          ),
        ));
  }
}
