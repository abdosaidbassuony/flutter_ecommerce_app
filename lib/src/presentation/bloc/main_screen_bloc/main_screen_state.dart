part of 'main_screen_bloc.dart';

class MainScreenState extends Equatable {
  const MainScreenState();

  @override
  List<Object?> get props => [];
}

class MainScreenInitialState extends MainScreenState {}

class BottomNavigationTappedState extends MainScreenState {
  final int? currentIndex;

  const BottomNavigationTappedState({this.currentIndex});

  @override
  List<Object?> get props => [currentIndex];
}
