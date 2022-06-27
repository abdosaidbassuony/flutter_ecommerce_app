import 'package:ecomarce_app/src/data/data_source/data.dart';
import 'package:ecomarce_app/src/data/model/home_model.dart';

abstract class HomeRepository {
  Future getHomeData(
      void Function(HomeModel) success, void Function(String) fail);
}

class HomeRepositoryImp extends HomeRepository {
  @override
  Future getHomeData(
      void Function(HomeModel) success, void Function(String) fail) async {
    try {
      success(HomeModel(
          categoryList: AppData.categoryList,
          productList: AppData.productList,
          thumbnailList: AppData.showThumbnailList));
    } catch (e) {
      fail(e.toString());
    }
  }
}
