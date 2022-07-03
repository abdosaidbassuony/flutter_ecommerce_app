import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ecomarce_app/src/core/resources/light_color.dart';
import 'package:ecomarce_app/src/presentation/ui/home/screen/home_page.dart';
import 'package:ecomarce_app/src/presentation/ui/shopping_cart/screen/shopping_cart_page.dart';
import 'package:ecomarce_app/src/presentation/bloc/main_screen_bloc/main_screen_bloc.dart';

class MainScreenBodyWidget extends StatelessWidget {
  final int? currentIndex;

  MainScreenBodyWidget({Key? key, this.currentIndex = 0}) : super(key: key);

  final List<BottomNavigationBarItem> _navigationItem = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.home, color: LightColor.orange),
        label: "",
        activeIcon: Icon(
          Icons.home,
          color: LightColor.orange,
        )),
    const BottomNavigationBarItem(
        icon: Icon(Icons.search, color: LightColor.orange),
        label: "",
        activeIcon: Icon(Icons.search, color: LightColor.orange)),
    const BottomNavigationBarItem(
        icon: Icon(Icons.card_travel, color: LightColor.orange),
        label: "",
        activeIcon: Icon(Icons.card_travel, color: LightColor.orange)),
    const BottomNavigationBarItem(
        icon: Icon(Icons.favorite_border, color: LightColor.orange),
        label: "",
        activeIcon: Icon(Icons.favorite_border, color: LightColor.orange)),
  ];

  final List<Widget> _listOfScreen = [
    const MyHomePage(),
    const ShoppingCartPage(),
    const MyHomePage(),
    const ShoppingCartPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: _navigationItem,
        type: BottomNavigationBarType.fixed,
        onTap: (int value) => _onBottomNavigationTapped(value, context),
        currentIndex: currentIndex!,
      ),
      body: _listOfScreen[currentIndex!],
    );
  }

  void _onBottomNavigationTapped(int value, BuildContext context) {
    BlocProvider.of<MainScreenBloc>(context)
        .add(BottomNavigationTapEvent(currentIndex: value));
  }
}
