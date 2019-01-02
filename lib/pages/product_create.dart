import 'package:flutter/material.dart';
import 'package:flutter_course_application/main.dart';
import 'package:flutter_course_application/models/product.dart';

class ProductCreatePage extends StatefulWidget {
  final Function addProduct;

  ProductCreatePage(this.addProduct);

  @override
  State createState() {
    return _ProductCreatePageState();
  }
}

class _ProductCreatePageState extends State<ProductCreatePage> {
  String _titleValue;
  String _descriptionValue;
  double _priceValue;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10.0),
        child: ListView(children: [
          _buildTitleTextField(),
          _buildDescriptionTextField(),
          _buildPriceTextField(),
          SizedBox(
            height: 20.0,
          ),
          RaisedButton(
            color: Theme.of(context).accentColor,
            textColor: Colors.white,
            child: Text('Save'),
            onPressed: () => _submitForm(context),
          )
        ]));
  }

  void _submitForm(BuildContext context) {
    widget.addProduct(Product(_titleValue,
        description: _descriptionValue, price: _priceValue));
    Navigator.pushReplacementNamed(context, Routes.PRODUCTS);
  }

  TextField _buildPriceTextField() {
    return TextField(
        decoration: InputDecoration(
          labelText: 'Product Price',
        ),
        keyboardType: TextInputType.number,
        onChanged: (String value) {
          setState(() {
            _priceValue = double.parse(value);
          });
        });
  }

  TextField _buildDescriptionTextField() {
    return TextField(
        decoration: InputDecoration(
          labelText: 'Product Description',
        ),
        maxLines: 4,
        onChanged: (String value) {
          setState(() {
            _descriptionValue = value;
          });
        });
  }

  TextField _buildTitleTextField() {
    return TextField(
        decoration: InputDecoration(
          labelText: 'Product Title',
        ),
        autofocus: true,
        onChanged: (String value) {
          setState(() {
            _titleValue = value;
          });
        });
  }
}
