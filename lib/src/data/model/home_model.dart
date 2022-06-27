import 'package:ecomarce_app/src/data/model/category.dart';
import 'package:ecomarce_app/src/data/model/product.dart';

class HomeModel {
  List<Product> productList;
  List<Category> categoryList;
  List<String> thumbnailList;

  HomeModel({
    this.categoryList = const [],
    this.productList = const [],
    this.thumbnailList = const [],
  });
}
