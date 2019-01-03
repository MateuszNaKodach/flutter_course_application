import 'package:flutter/material.dart';
import 'package:flutter_course_application/models/product.dart';
import 'package:flutter_course_application/scoped_models/products.dart';
import 'package:flutter_course_application/widgets/products/product_card.dart';
import 'package:scoped_model/scoped_model.dart';

@immutable
class Products extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ScopedModelDescendant<ProductsModel>(
          builder: (BuildContext context, Widget child, ProductsModel model) {
        return model.displayedProducts.length > 0
            ? ListView.builder(
                itemCount: model.displayedProducts.length,
                itemBuilder: _buildProductItem(model.displayedProducts))
            : Center(child: Text('No products found, please add some.'));
      });

  Function(BuildContext, int) _buildProductItem(List<Product> products) =>
      (BuildContext context, int index) =>
          ProductCard(product: products[index], productIndex: index);
}
