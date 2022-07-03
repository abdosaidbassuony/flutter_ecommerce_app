import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'presentation/ui/shared_widgets/customRoute.dart';
import 'package:ecomarce_app/src/core/config/route.dart';
import 'package:ecomarce_app/src/core/resources/theme.dart';
import 'package:ecomarce_app/src/%C2%A0di/injector.dart';
import 'package:ecomarce_app/src/presentation/bloc/home_bloc/home_bloc.dart';
import 'package:ecomarce_app/src/presentation/ui/main_screen/screen/main_screen.dart';
import 'package:ecomarce_app/src/presentation/ui/product_details/screen/product_detail.dart';
import 'package:ecomarce_app/src/presentation/bloc/main_screen_bloc/main_screen_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependency();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeBloc(injector())),
        BlocProvider<MainScreenBloc>(
            create: (context) => injector(), child: const MainPage())
      ],
      child: MaterialApp(
        title: 'E-Commerce ',
        theme: AppTheme.lightTheme.copyWith(
          textTheme: GoogleFonts.mulishTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        debugShowCheckedModeBanner: false,
        routes: Routes.getRoute(),
        onGenerateRoute: (RouteSettings settings) {
          if (settings.name!.contains('detail')) {
            return CustomRoute<bool>(
                builder: (BuildContext context) => const ProductDetailPage());
          } else {
            return CustomRoute<bool>(
                builder: (BuildContext context) => const MainPage());
          }
        },
        initialRoute: "MainPage",
      ),
    );
  }
}
