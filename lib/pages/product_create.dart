import 'package:flutter/material.dart';
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
  String titleValue;
  String descriptionValue;
  double priceValue;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10.0),
        child: ListView(children: [
          TextField(
              decoration: InputDecoration(
                labelText: 'Product Title',
              ),
              autofocus: true,
              onChanged: (String value) {
                setState(() {
                  titleValue = value;
                });
              }),
          TextField(
              decoration: InputDecoration(
                labelText: 'Product Description',
              ),
              maxLines: 4,
              onChanged: (String value) {
                setState(() {
                  descriptionValue = value;
                });
              }),
          TextField(
              decoration: InputDecoration(
                labelText: 'Product Price',
              ),
              keyboardType: TextInputType.number,
              onChanged: (String value) {
                setState(() {
                  priceValue = double.parse(value);
                });
              }),
          RaisedButton(
            child: Text('Save'),
            onPressed: () {
              widget.addProduct(Product(titleValue,
                  description: descriptionValue, price: priceValue));
            },
          )
        ]));
  }
}
