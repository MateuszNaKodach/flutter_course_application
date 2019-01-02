import 'package:flutter/material.dart';
import 'package:flutter_course_application/main.dart';
import 'package:flutter_course_application/models/product.dart';

@immutable
class Products extends StatelessWidget {
  final List<Product> products;

  Products(this.products);

  @override
  Widget build(BuildContext context) => products.length > 0
      ? ListView.builder(
          itemCount: products.length, itemBuilder: _buildProductItem)
      : Center(child: Text('No products found, please add some.'));

  Widget _buildProductItem(BuildContext context, int index) => Card(
        child: Column(
          children: <Widget>[
            Image.asset(products[index].image),
            Padding(
                padding: EdgeInsets.only(top: 10.0),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(products[index].title,
                      style: TextStyle(
                          fontSize: 26.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Oswald')),
                  SizedBox(width: 8.0),
                  Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 2.5, horizontal: 6.0),
                      decoration: BoxDecoration(
                          color: Theme.of(context).accentColor,
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Text(
                        '\$' + products[index].price.toString(),
                        style: TextStyle(color: Colors.white),
                      ))
                ])),
            Container(
                padding: EdgeInsets.symmetric(vertical: 2.5, horizontal: 6.0),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.0),
                    borderRadius: BorderRadius.circular(4.0)),
                child: Text('Union Square, San Francisco')),
            ButtonBar(alignment: MainAxisAlignment.center, children: [
              IconButton(
                icon: Icon(Icons.info),
                color: Theme.of(context).accentColor,
                onPressed: () =>
                    Navigator.pushNamed<bool>(context, Routes.PRODUCT(index))
                        .then((bool value) {
                      if (value) {
                        // deleteProduct(index);
                      }
                    }),
              ),
              IconButton(
                icon: Icon(Icons.favorite_border),
                color: Colors.red,
                onPressed: () {},
              ),
            ])
          ],
        ),
      );
}
