part of 'main_screen_bloc.dart';

class MainScreenEvent extends Equatable {
  const MainScreenEvent();

  @override
  List<Object?> get props => [];
}

class BottomNavigationTapEvent extends MainScreenEvent {
  final int? currentIndex;

  const BottomNavigationTapEvent({this.currentIndex});

  @override
  List<Object?> get props => [currentIndex];
}
