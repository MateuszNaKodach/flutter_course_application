import 'package:flutter_course_application/models/product.dart';
import 'package:flutter_course_application/models/user.dart';
import 'package:scoped_model/scoped_model.dart';

mixin ConnectedProductsModel on Model {
  List<Product> _products = [];
  int _selProductIndex;
  User _authenticatedUser;

  void addProduct(Product product) {
    _products.add(product.fromUser(_authenticatedUser));
    _deselectProduct();
  }
}

mixin UserModel on ConnectedProductsModel {

  void login(String email, String password) {
    _authenticatedUser =
        User(id: 'sadasdqweqwd', email: email, password: password);
  }
}

mixin ProductsModel on ConnectedProductsModel {
  DisplayMode _displayMode = DisplayMode.ALL;

  List<Product> get allProducts {
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
    return _selProductIndex;
  }

  bool get isShowFavoritesDisplayMode {
    return _displayMode == DisplayMode.ONLY_FAVORITES;
  }

  DisplayMode get displayMode {
    return _displayMode;
  }

  Product get selectedProduct {
    return _selProductIndex == null
        ? null
        : _products[_selProductIndex];
  }

  void deleteProduct({int index, Product product}) {
    if (index != null) {
      _products.removeAt(index);
    } else if (product != null) {
      _products
          .removeAt(_products.indexWhere((Product p) => p.id == product.id));
    } else {
      _products.removeAt(_selProductIndex);
    }
    _deselectProduct();
  }

  void updateProduct(Product product) {
    _products[_products.indexWhere((Product p) => p.id == product.id)] =
        product;
    _deselectProduct();
  }

  void updateProductByIndex(int index, Product product) {
    _products[index] = product;
    _deselectProduct();
  }

  void toggleProductFavoriteStatus() {
    _products[_selProductIndex] = selectedProduct.toggleFavorite();
    _deselectProduct();
    notifyListeners();
  }

  void selectProduct(int index) {
    _selProductIndex = index;
    if(_selProductIndex != null){
      notifyListeners();
    }
  }

  void toggleDisplayMode() {
    if (_displayMode == DisplayMode.ALL) {
      _displayMode = DisplayMode.ONLY_FAVORITES;
    } else if (_displayMode == DisplayMode.ONLY_FAVORITES) {
      _displayMode = DisplayMode.ALL;
    }
    notifyListeners();
  }

  void _deselectProduct() {
    _selProductIndex = null;
  }

}


enum DisplayMode {
  ALL,
  ONLY_FAVORITES,
}
