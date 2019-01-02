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
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 555.0 ? 500.0 : deviceWidth * 0.9;
    return Scaffold(
        appBar: AppBar(title: Text('Login')),
        body: Container(
          decoration: BoxDecoration(
            image: _buildBackgroundImage(),
          ),
          padding: EdgeInsets.all(10.0),
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                width: targetWidth,
                child: Column(
                  children: [
                    _buildEmailTextField(),
                    SizedBox(height: 10.0),
                    _buildPasswordTextField(),
                    _buildAcceptTermsSwitchListTile(),
                    SizedBox(height: 10.0),
                    RaisedButton(
                        color: Theme.of(context).primaryColor,
                        child: Text('LOGIN'),
                        onPressed: () =>
                            widget._navigateToProductsPage(context))
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  SwitchListTile _buildAcceptTermsSwitchListTile() {
    return SwitchListTile(
        title: Text('Accept Terms'),
        value: _acceptTerms,
        onChanged: (bool value) {
          setState(() {
            _acceptTerms = value;
          });
        });
  }

  TextField _buildPasswordTextField() {
    return TextField(
      decoration: InputDecoration(
          labelText: 'Password', filled: true, fillColor: Colors.white),
      obscureText: true,
      onChanged: (String value) {
        _passwordValue = value;
      },
    );
  }

  TextField _buildEmailTextField() {
    return TextField(
      decoration: InputDecoration(
          labelText: 'E-mail', filled: true, fillColor: Colors.white),
      keyboardType: TextInputType.emailAddress,
      onChanged: (String value) {
        _emailValue = value;
      },
    );
  }

  DecorationImage _buildBackgroundImage() {
    return DecorationImage(
      fit: BoxFit.cover,
      colorFilter:
          ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.dstATop),
      image: AssetImage('assets/background.jpg'),
    );
  }
}
