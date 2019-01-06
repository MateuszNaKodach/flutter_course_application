import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_course_application/scoped_models/connected_product.dart';

class MainModel extends Model
    with ConnectedProductsModel, ProductsModel, UserModel, UtilityModel {}
