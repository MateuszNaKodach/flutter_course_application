import 'package:flutter/material.dart';
import 'package:flutter_course_application/models/product.dart';
import 'package:flutter_course_application/pages/product_edit.dart';

class ProductListPage extends StatelessWidget {
  final List<Product> products;
  final Function updateProduct;

  ProductListPage(this.products, this.updateProduct);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildProductItem(context, products[index]);
        });
  }

  Widget _buildProductItem(BuildContext context, Product product) {
    return ListTile(
      leading: CircleAvatar(backgroundImage: AssetImage(product.image)),
      title: Text(product.title),
      trailing: IconButton(
        icon: Icon(Icons.edit),
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (BuildContext context) {
                return ProductEditPage(product: product, updateProduct: updateProduct);
              }));
        },
      ),
    );
  }
}
