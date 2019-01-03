import 'package:flutter_course_application/models/product.dart';
import 'package:scoped_model/scoped_model.dart';

class ProductsModel extends Model {
  List<Product> _products = [];
  int _selectedProductIndex;

  List<Product> get products {
    return List.from(_products);
  }

  int get selectedProductsIndex {
    return _selectedProductIndex;
  }

  Product get selectedProduct {
    return _selectedProductIndex == null ? null : _products[_selectedProductIndex];
  }

  void addProduct(Product product) {
    _products.add(product);
    _selectedProductIndex = null;
  }

  void deleteProduct({int index, Product product}) {
    if (index != null) {
      _products.removeAt(index);
    } else if (product != null) {
      _products
          .removeAt(_products.indexWhere((Product p) => p.id == product.id));
    } else {
      _products.removeAt(_selectedProductIndex);
    }
    _selectedProductIndex = null;
  }

  void updateProduct(Product product) {
    _products[_products.indexWhere((Product p) => p.id == product.id)] =
        product;
    _selectedProductIndex = null;
  }

  void updateProductByIndex(int index, Product product) {
    _products[index] = product;
    _selectedProductIndex = null;
  }

  void selectProduct(int index) {
    _selectedProductIndex = index;
  }
}
