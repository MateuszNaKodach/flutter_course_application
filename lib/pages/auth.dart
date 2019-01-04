import 'package:flutter/material.dart';
import 'package:flutter_course_application/main.dart';
import 'package:flutter_course_application/scoped_models/main.dart';
import 'package:scoped_model/scoped_model.dart';

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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      _buildEmailTextField(),
                      SizedBox(height: 10.0),
                      _buildPasswordTextField(),
                      _buildAcceptTermsSwitchListTile(),
                      SizedBox(height: 10.0),
                      ScopedModelDescendant<MainModel>(builder:
                          (BuildContext context, Widget child,
                              MainModel model) {
                        return RaisedButton(
                          color: Theme.of(context).primaryColor,
                          child: Text('LOGIN'),
                          onPressed: () => _submitForm(model.login),
                        );
                      })
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }

  void _submitForm(Function(String, String) login) {
    if (!_formKey.currentState.validate() || !_acceptTerms) {
      return null;
    }
    _formKey.currentState.save();
    login(_emailValue, _passwordValue);
    widget._navigateToProductsPage(context);
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

  TextFormField _buildPasswordTextField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Password', filled: true, fillColor: Colors.white),
      obscureText: true,
      validator: (String value) {
        if (value.isEmpty || value.length < 6) {
          return 'Password invalid';
        }
      },
      onSaved: (String value) {
        _passwordValue = value;
      },
    );
  }

  TextFormField _buildEmailTextField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'E-mail', filled: true, fillColor: Colors.white),
      keyboardType: TextInputType.emailAddress,
      validator: (String value) {
        if (value.isEmpty ||
            !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                .hasMatch(value)) {
          return 'Please enter a valid email';
        }
      },
      onSaved: (String value) {
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
