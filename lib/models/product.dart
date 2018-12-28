class Product {
  final String title;
  final String description;
  final double price;
  final String image;

  Product(this.title, {this.description, this.price = 0.0, this.image = 'assets/food.jpg'});
}
