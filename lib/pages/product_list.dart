import 'package:flutter/material.dart';
import 'package:flutter_course_application/models/product.dart';
import 'package:flutter_course_application/pages/product_edit.dart';
import 'package:flutter_course_application/scoped_models/products.dart';
import 'package:scoped_model/scoped_model.dart';

class ProductListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ProductsModel>(
      builder: (BuildContext context, Widget child, ProductsModel model) {
        return ListView.builder(
            itemCount: model.products.length,
            itemBuilder: (BuildContext context, int index) {
              return _buildProductItem(context, model.products[index], index, model);
            });
      },
    );
  }

  Widget _buildProductItem(
      BuildContext context, Product product, int productIndex, ProductsModel model) {
    return Dismissible(
      key: Key(product.id),
      onDismissed: (DismissDirection direction) {
        model.selectProduct(productIndex);
        model.deleteProduct();
      },
      direction: DismissDirection.startToEnd,
      background: Container(
        child: Row(children: [
          Icon(Icons.delete_forever, color: Colors.white),
          Text(
            'DELETE',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          )
        ]),
        color: Colors.red,
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.symmetric(horizontal: 20),
      ),
      child: Column(children: [
        ListTile(
          leading: CircleAvatar(backgroundImage: AssetImage(product.image)),
          title: Text(product.title),
          subtitle: Text('\$${product.price}'),
          trailing: _buildEditButton(context, product, productIndex),
        ),
        Divider()
      ]),
    );
  }

  Widget _buildEditButton(
      BuildContext context, Product product, int productIndex) {
    return ScopedModelDescendant<ProductsModel>(
      builder: (BuildContext context, Widget child, ProductsModel model) {
        return IconButton(
          icon: Icon(Icons.edit),
          onPressed: () {
            model.selectProduct(productIndex);
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (BuildContext context) {
              return ProductEditPage();
            }));
          },
        );
      },
    );
  }
}
