import 'package:flutter/material.dart';
import 'package:flutter_course_application/main.dart';
import 'package:flutter_course_application/scoped_models/main.dart';
import 'package:flutter_course_application/widgets/products/products.dart';
import 'package:scoped_model/scoped_model.dart';

class ProductsPage extends StatefulWidget {
  final MainModel model;

  const ProductsPage({Key key, @required this.model}) : super(key: key);

  @override
  State createState() {
    return _ProductsPageState();
  }
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  void initState() {
    super.initState();
    widget.model.fetchProducts();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: _buildNavigationDrawer(context),
        appBar: AppBar(
          title: Text('EasyList'),
          actions: <Widget>[
            ScopedModelDescendant<MainModel>(
              builder: (BuildContext context, Widget child, MainModel model) {
                return IconButton(
                  icon: Icon(model.isShowFavoritesDisplayMode
                      ? Icons.favorite
                      : Icons.favorite_border),
                  onPressed: () {
                    model.toggleDisplayMode();
                  },
                );
              },
            )
          ],
        ),
        body: _buildProductsList(),
      );

  Widget _buildProductsList() => ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) {
          return model.displayedProducts.length > 0 && !model.isLoading
              ? Products()
              : (model.isLoading
                  ? Center(child: CircularProgressIndicator())
                  : Center(child: Text('No products found!')));
        },
      );

  Widget _buildNavigationDrawer(BuildContext context) {
    return Drawer(
        child: Column(children: [
      AppBar(title: Text('Choose'), automaticallyImplyLeading: false),
      ListTile(
          leading: Icon(Icons.edit),
          title: Text('Manage Products'),
          onTap: () => _navigateToProductsAdminPage(context))
    ]));
  }

  void _navigateToProductsAdminPage(BuildContext context) {
    Navigator.pushReplacementNamed(context, Routes.ADMIN);
  }
}
