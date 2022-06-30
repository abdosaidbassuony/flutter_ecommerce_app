import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/home_model.dart';
import '../../../data/model/product.dart';
import 'package:ecomarce_app/src/data/model/category.dart';
import 'package:ecomarce_app/src/data/repository/home_repository/home_repository.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeRepository? homeRepository;
  HomeModel? homeModel;

  HomeBloc(this.homeRepository) : super(HomeInitialState()) {
    on<GetHomeDateEvent>(_onGetHomeDateEvent);
    on<SelectProductCartEvent>(_onSelectProductCartEvent);
    on<SelectCategoryCartEvent>(_onSelectCategoryCartEvent);
  }

  Future<void> _onGetHomeDateEvent(GetHomeDateEvent event, emit) async {
    emit(HomeLoadingState());
    Future.delayed(const Duration(seconds: 3));
    homeRepository!.getHomeData((homeModel) {
      this.homeModel = homeModel;
      emit(HomeGetDateSuccessfullyState(homeModel: homeModel));
    }, (error) => emit(const HomeErrorState(error: "cannot fetch date")));
  }

  Future<void> _onSelectProductCartEvent(
      SelectProductCartEvent event, emit) async {
    _changeProductSelection(event);
    emit(ProductCardSelectedState(homeModel: homeModel!));
    emit(HomeInitialState());
  }

  void _changeProductSelection(SelectProductCartEvent event) {
    for (var element in homeModel!.productList) {
      if (element.id == event.product!.id) {
        element.isSelected = true;
      } else {
        element.isSelected = false;
      }
    }
  }

  Future<void> _onSelectCategoryCartEvent(
      SelectCategoryCartEvent event, emit) async {
    _changeCategorySelection(event);
    emit(ProductCardSelectedState(homeModel: homeModel!));
    emit(HomeInitialState());
  }

  void _changeCategorySelection(SelectCategoryCartEvent event) {
    for (var element in homeModel!.categoryList) {
      if (element.id == event.category!.id) {
        element.isSelected = true;
      } else {
        element.isSelected = false;
      }
    }
  }
}
