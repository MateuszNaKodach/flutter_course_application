import 'package:flutter/material.dart';
import 'package:flutter_course_application/main.dart';
import 'package:flutter_course_application/models/product.dart';
import 'package:flutter_course_application/scoped_models/main.dart';
import 'package:flutter_course_application/widgets/products/address_tag.dart';
import 'package:flutter_course_application/widgets/products/price_tag.dart';
import 'package:flutter_course_application/widgets/ui_elements/title_default.dart';
import 'package:scoped_model/scoped_model.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final int productIndex;

  const ProductCard({Key key, this.product, this.productIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Card(
        child: Column(
          children: <Widget>[
            Image.asset(product.image),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TitleDefault(title: product.title),
                  SizedBox(width: 8.0),
                  PriceTag(product.price.toString()),
                ],
              ),
            ),
            AddressTag(address: 'Union Square, San Francisco'),
            Text(product.userEmail),
            _buildActionButtons(context)
          ],
        ),
      );

  ButtonBar _buildActionButtons(BuildContext context) {
    return ButtonBar(alignment: MainAxisAlignment.center, children: [
      IconButton(
        icon: Icon(Icons.info),
        color: Theme.of(context).accentColor,
        onPressed: () =>
            Navigator.pushNamed<bool>(context, Routes.PRODUCT(productIndex))
                .then((bool value) {
              if (value) {
                // deleteProduct(index);
              }
            }),
      ),
      _buildFavoriteToggleButton(),
    ]);
  }

  Widget _buildFavoriteToggleButton() {
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        return IconButton(
          icon: Icon(product.isFavorite ? Icons.favorite : Icons.favorite_border),
          color: Colors.red,
          onPressed: () {
            model.selectProduct(productIndex);
            model.toggleProductFavoriteStatus();
          },
        );
      },
    );
  }
}
