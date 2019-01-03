import 'package:flutter/material.dart';
import 'package:flutter_course_application/models/product.dart';
import 'package:flutter_course_application/pages/product_edit.dart';

class ProductListPage extends StatelessWidget {
  final List<Product> products;
  final Function updateProduct;
  final Function deleteProduct;

  ProductListPage(this.products, this.updateProduct, this.deleteProduct);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildProductItem(context, products[index]);
        });
  }

  Widget _buildProductItem(BuildContext context, Product product) {
    return Dismissible(
      key: Key(product.id),
      onDismissed: (DismissDirection direction) {
        deleteProduct(product: product);
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
          trailing: _buildEditButton(context, product),
        ),
        Divider()
      ]),
    );
  }

  IconButton _buildEditButton(BuildContext context, Product product) {
    return IconButton(
          icon: Icon(Icons.edit),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (BuildContext context) {
              return ProductEditPage(
                  product: product, updateProduct: updateProduct);
            }));
          },
        );
  }
}
