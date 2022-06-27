part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeErrorState extends HomeState {
  final String? error;

  const HomeErrorState({this.error});

  @override
  List<Object> get props => [error!];
}

class HomeGetDateSuccessfullyState extends HomeState {
  final HomeModel? homeModel;

  const HomeGetDateSuccessfullyState({this.homeModel});

  @override
  List<Object> get props => [homeModel!];
}

class ProductCardSelectedState extends HomeState {
  final HomeModel? homeModel;

  const ProductCardSelectedState({this.homeModel});

  @override
  List<Object> get props => [homeModel!];
}

class CategoryCardSelectedState extends HomeState {
  final HomeModel? homeModel;

  const CategoryCardSelectedState({this.homeModel});

  @override
  List<Object> get props => [homeModel!];
}
