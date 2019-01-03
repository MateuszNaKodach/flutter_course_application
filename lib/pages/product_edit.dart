import 'package:flutter/material.dart';
import 'package:flutter_course_application/main.dart';
import 'package:flutter_course_application/models/product.dart';
import 'package:flutter_course_application/scoped_models/products.dart';
import 'package:scoped_model/scoped_model.dart';

class ProductEditPage extends StatefulWidget {
  @override
  State createState() {
    return _ProductEditPageState();
  }
}

class _ProductEditPageState extends State<ProductEditPage> {
  String _titleValue;
  String _descriptionValue;
  double _priceValue;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ProductsModel>(
        builder: (BuildContext context, Widget child, ProductsModel model) {
      final Widget pageContent =
          _buildPageContent(context, model.selectedProduct);
      return model.selectedProductIndex == null
          ? pageContent
          : Scaffold(
              appBar: AppBar(title: Text('Edit Product')),
              body: pageContent,
            );
    });
  }

  GestureDetector _buildPageContent(BuildContext context, Product product) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.9;
    final double targetPadding = deviceWidth - targetWidth;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Container(
        margin: EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: targetPadding),
            children: [
              _buildTitleTextField(product),
              _buildDescriptionTextField(product),
              _buildPriceTextField(product),
              SizedBox(
                height: 20.0,
              ),
              _buildSubmitButton(product)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSubmitButton(Product product) {
    return ScopedModelDescendant<ProductsModel>(
      builder: (BuildContext context, Widget child, ProductsModel model) =>
          RaisedButton(
            color: Theme.of(context).accentColor,
            textColor: Colors.white,
            child: Text('Save'),
            onPressed: () => _submitForm(model.addProduct,
                model.updateProductByIndex, model.selectedProductIndex),
          ),
    );
  }

  void _submitForm(
      Function(Product) addProduct, Function(int, Product) updateProduct,
      [int selectedProductIndex]) {
    if (!_formKey.currentState.validate()) {
      return null;
    }
    _formKey.currentState.save();
    if (selectedProductIndex == null) {
      addProduct(Product(_titleValue,
          description: _descriptionValue, price: _priceValue));
    } else {
      updateProduct(
          selectedProductIndex,
          Product(_titleValue,
              description: _descriptionValue, price: _priceValue));
    }
    Navigator.pushReplacementNamed(context, Routes.PRODUCTS);
  }

  TextFormField _buildPriceTextField(Product product) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Product Price',
      ),
      keyboardType: TextInputType.number,
      initialValue: product?.price?.toString() ?? '',
      validator: (String value) {
        if (value.isEmpty ||
            !RegExp(r'^(?:[1-9]\d*|0)?(?:\.\d+)?$').hasMatch(value)) {
          return 'Prcie is required and should be a number.';
        }
      },
      onSaved: (String value) {
        _priceValue = double.parse(value);
      },
    );
  }

  TextFormField _buildDescriptionTextField(Product product) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Product Description',
      ),
      maxLines: 4,
      initialValue: product?.description ?? '',
      validator: (String value) {
        if (value.isEmpty || value.length < 10) {
          return 'Description is required and should be 10+ characters long.';
        }
      },
      onSaved: (String value) {
        _descriptionValue = value;
      },
    );
  }

  TextFormField _buildTitleTextField(Product product) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Product Title',
      ),
      autofocus: true,
      initialValue: product?.title ?? '',
      validator: (String value) {
        if (value.isEmpty || value.length < 5) {
          return 'Title is required and should be 5+ characters long.';
        }
      },
      onSaved: (String value) {
        _titleValue = value;
      },
    );
  }
}
