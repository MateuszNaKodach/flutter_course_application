import 'package:flutter_course_application/models/user.dart';
import 'package:meta/meta.dart';

class Product {
  final String title;
  final String description;
  final double price;
  final String image;
  final String id;
  final bool isFavorite;
  final String userEmail;
  final String userId;

  Product(this.title,
      {@required this.description,
      this.price = 0.0,
      this.image = 'assets/food.jpg',
      this.isFavorite = false})
      : id = new DateTime.now().millisecondsSinceEpoch.toString(),
        userEmail = '',
        userId = '';

  Product.withId(this.id,
      {this.title,
      this.description,
      this.price,
      this.image = 'assets/food.jpg',
      this.isFavorite = false,
      this.userEmail = '',
      this.userId = ''});

  Product.fromUser(this.id,
      {this.title,
      this.description,
      this.price,
      this.image = 'assets/food.jpg',
      this.isFavorite = false,
      this.userEmail,
      this.userId});

  Product fromUser(User user) {
    return Product.withId(
      this.id,
      title: this.title,
      description: this.description,
      price: this.price,
      image: this.image,
      isFavorite: this.isFavorite,
      userEmail: user.email,
      userId: user.id,
    );
  }

  Product toggleFavorite() {
    return Product.withId(
      this.id,
      title: this.title,
      description: this.description,
      price: this.price,
      image: this.image,
      isFavorite: !this.isFavorite,
    );
  }
}
