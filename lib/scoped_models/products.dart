import 'package:flutter_course_application/models/product.dart';
import 'package:scoped_model/scoped_model.dart';

class ProductsModel extends Model {
  List<Product> _products = [];
  int _selectedProductIndex;
  DisplayMode _displayMode = DisplayMode.ALL;

  List<Product> get products {
    return List.from(_products);
  }

  List<Product> get displayedProducts {
    return List.from(
      _displayMode == DisplayMode.ALL
          ? _products
          : _products.where((Product p) => p.isFavorite),
    );
  }

  int get selectedProductIndex {
    return _selectedProductIndex;
  }

  bool get isShowFavoritesDisplayMode {
    return _displayMode == DisplayMode.ONLY_FAVORITES;
  }

  DisplayMode get displayMode {
    return _displayMode;
  }

  Product get selectedProduct {
    return _selectedProductIndex == null
        ? null
        : _products[_selectedProductIndex];
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

  void toggleProductFavoriteStatus() {
    _products[_selectedProductIndex] = selectedProduct.toggleFavorite();
    _selectedProductIndex = null;
    notifyListeners();
  }

  void selectProduct(int index) {
    _selectedProductIndex = index;
  }

  void toggleDisplayMode() {
    if (_displayMode == DisplayMode.ALL) {
      _displayMode = DisplayMode.ONLY_FAVORITES;
    } else if (_displayMode == DisplayMode.ONLY_FAVORITES) {
      _displayMode = DisplayMode.ALL;
    }
    notifyListeners();
  }
}

enum DisplayMode {
  ALL,
  ONLY_FAVORITES,
}
