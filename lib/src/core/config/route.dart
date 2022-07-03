import 'package:flutter/material.dart';
import 'package:ecomarce_app/src/presentation/ui/main_screen/screen/main_screen.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoute() {
    return <String, WidgetBuilder>{
      '/': (_) => const MainPage(),
      // '/detail': (_) => ProductDetailPage()
    };
  }
}
