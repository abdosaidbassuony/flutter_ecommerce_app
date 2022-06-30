import 'package:ecomarce_app/src/data/model/home_model.dart';
import 'package:ecomarce_app/src/presentation/ui/home/widget/category_list_widget.dart';
import 'package:ecomarce_app/src/presentation/ui/home/widget/product_list_widget.dart';
import 'package:ecomarce_app/src/presentation/ui/home/widget/search_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HomeScreenBodyWidget extends StatelessWidget {
  final HomeModel? homeModel;

  const HomeScreenBodyWidget({Key? key, this.homeModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return homeModel != null
        ? SizedBox(
            height: MediaQuery.of(context).size.height - 210,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              dragStartBehavior: DragStartBehavior.down,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SearchWidget(),
                  CategoryListWidget(categoriesList: homeModel!.categoryList),
                  ProductListWidget(productsList: homeModel!.productList),
                ],
              ),
            ),
          )
        : _homeEmptyScreenWidget();
  }

  Widget _homeEmptyScreenWidget() {
    return Container();
  }
}