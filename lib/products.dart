import 'package:flutter/material.dart';
import 'package:flutter_course_application/main.dart';
import 'package:flutter_course_application/pages/product.dart';

@immutable
class Products extends StatelessWidget {
  final List<Map<String, String>> products;
  final Function deleteProduct;

  Products(this.products, {this.deleteProduct});

  @override
  Widget build(BuildContext context) => products.length > 0
      ? ListView.builder(
          itemCount: products.length, itemBuilder: _buildProductItem)
      : Center(child: Text('No products found, please add some.'));

  Widget _buildProductItem(BuildContext context, int index) => Card(
        child: Column(
          children: <Widget>[
            Image.asset(products[index]['image']),
            Text(products[index]['title']),
            ButtonBar(alignment: MainAxisAlignment.center, children: [
              FlatButton(
                  child: Text('Details'),
                  onPressed: () =>
                      Navigator.pushNamed<bool>(context, Routes.PRODUCT(index))
                          .then((bool value) {
                        if (value) {
                          deleteProduct(index);
                        }
                      }))
            ])
          ],
        ),
      );
}
