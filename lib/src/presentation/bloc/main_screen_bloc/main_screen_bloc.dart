import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'main_screen_event.dart';

part 'main_screen_state.dart';

class MainScreenBloc extends Bloc<MainScreenEvent, MainScreenState> {
  MainScreenBloc() : super(MainScreenInitialState()) {
    on<BottomNavigationTapEvent>(_onBottomNavigationTapEvent);
  }

  Future<void> _onBottomNavigationTapEvent(
          BottomNavigationTapEvent event, emit) async =>
      emit(BottomNavigationTappedState(currentIndex: event.currentIndex));
}
