import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/home_bloc/home_bloc.dart';
import '../widget/category_list_widget.dart';
import '../widget/product_list_widget.dart';
import 'package:ecomarce_app/src/data/model/home_model.dart';
import 'package:ecomarce_app/src/presentation/ui/home/widget/search_widget.dart';

class MyHomePage extends StatefulWidget {
  final String? title;

  const MyHomePage({Key? key, this.title}) : super(key: key);

  @override
  State createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  HomeModel? homeModel = HomeModel();

  @override
  void initState() {
    BlocProvider.of<HomeBloc>(context).add(GetHomeDateEvent());
    super.initState();
  }

  @override
  void dispose() {
    BlocProvider.of<HomeBloc>(context).close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is HomeErrorState) {
          _showLoading();
        } else {
          _hideLoading();
        }
        if (state is HomeErrorState) {
          _showErrorDialog();
        } else if (state is HomeGetDateSuccessfullyState) {
          _setHomeModelDate(state.homeModel!);
        } else if (state is ProductCardSelectedState) {
          _setHomeModelDate(state.homeModel!);
        }
      },
      builder: (context, state) {
        if (state is HomeGetDateSuccessfullyState) {
          return _homeBodyWidget(state.homeModel!);
        } else if (state is ProductCardSelectedState) {
          return _homeBodyWidget(state.homeModel!);
        }
        return _homeBodyWidget(homeModel!);
      },
    );
  }

  Widget _homeBodyWidget(HomeModel? homeModel) {
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
                  CategoryListWidget(categoriesList: homeModel.categoryList),
                  ProductListWidget(productsList: homeModel.productList),
                ],
              ),
            ),
          )
        : _homeEmptyScreenWidget();
  }

  Future _showErrorDialog() async {}

  void _showLoading() {}

  void _hideLoading() {}

  void _setHomeModelDate(HomeModel homeModel) => this.homeModel = homeModel;

  _homeEmptyScreenWidget() {}
}
