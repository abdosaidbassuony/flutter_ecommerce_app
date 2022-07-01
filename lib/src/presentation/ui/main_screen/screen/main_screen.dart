import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ecomarce_app/src/presentation/ui/main_screen/widget/main_screen_body_widget.dart';
import 'package:ecomarce_app/src/presentation/bloc/main_screen_bloc/main_screen_bloc.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int? currentSelectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainScreenBloc, MainScreenState>(
      listener: (context, state) {
        if (state is BottomNavigationTappedState) {
          currentSelectedIndex = state.currentIndex;
        }
      },
      builder: (context, state) {
        if (state is BottomNavigationTappedState) {
          return MainScreenBodyWidget(currentIndex: state.currentIndex);
        }
        return MainScreenBodyWidget(currentIndex: currentSelectedIndex);
      },
    );
  }
}
