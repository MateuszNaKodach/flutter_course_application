import 'dart:convert';

import 'package:flutter_course_application/models/product.dart';
import 'package:flutter_course_application/models/user.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;

const FIREBASE_DB_URL =
    'https://flutter-course-products-c9a7b.firebaseio.com/products.json';

mixin ConnectedProductsModel on Model {
  List<Product> _products = [];
  int _selProductIndex;
  User _authenticatedUser;
  bool _isLoading;

  Future<Null> addProduct(Product product) {
    _startLoading();
    final authenticatedUserProducts = product.fromUser(_authenticatedUser);
    final Map<String, dynamic> productData = {
      'name': authenticatedUserProducts.id,
      'title': authenticatedUserProducts.title,
      'description': authenticatedUserProducts.description,
      'image': authenticatedUserProducts.image,
      'price': authenticatedUserProducts.price,
      'isFavorite': authenticatedUserProducts.isFavorite,
      'userEmail': authenticatedUserProducts.userEmail,
      'userId': authenticatedUserProducts.userId
    };
    return http
        .post(FIREBASE_DB_URL, body: json.encode(productData))
        .then((http.Response response) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      _products.add(authenticatedUserProducts.withId(responseData['name']));
      _deselectProduct();
      _stopLoading();
    });
  }

  void _deselectProduct() {
    _selProductIndex = null;
  }

  void _startLoading(){
    _isLoading = true;
    notifyListeners();
  }

  void _stopLoading(){
    _isLoading = false;
    notifyListeners();
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
    return _selProductIndex == null ? null : _products[_selProductIndex];
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

  void fetchProducts() {
    _startLoading();
    http.get(FIREBASE_DB_URL).then((http.Response response) {
      final List<Product> fetchedProductList = [];
      final Map<String, dynamic> productListData = json.decode(response.body);
      productListData?.forEach((String productId, dynamic productData){
        final Product product = Product.withId(
          productId,
          title: productData['title'],
          description: productData['description'],
          price: productData['price'],
          image: productData['image'],
          isFavorite: productData['isFavorite'],
          userEmail: productData['userEmail'],
          userId: productData['userId'],
        );
        fetchedProductList.add(product);
      });
      _products = fetchedProductList;
      _stopLoading();
      notifyListeners();
    });
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
    if (_selProductIndex != null) {
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
}

mixin UtilityModel on ConnectedProductsModel{
  bool get isLoading{
    return _isLoading;
  }
}

enum DisplayMode {
  ALL,
  ONLY_FAVORITES,
}
