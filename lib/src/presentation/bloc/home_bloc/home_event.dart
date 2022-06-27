part of 'home_bloc.dart';

class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class GetHomeDateEvent extends HomeEvent {}

class SelectProductCartEvent extends HomeEvent {
  final Product? product;

  const SelectProductCartEvent({this.product});

  @override
  List<Object> get props => [product!];
}

class SelectCategoryCartEvent extends HomeEvent {
  final Category? category;

  const SelectCategoryCartEvent({this.category});

  @override
  List<Object> get props => [category!];
}
