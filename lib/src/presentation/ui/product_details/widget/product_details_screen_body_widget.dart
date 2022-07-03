import 'package:ecomarce_app/src/core/resources/light_color.dart';
import 'package:ecomarce_app/src/core/resources/theme.dart';
import 'package:ecomarce_app/src/core/utilities/extentions.dart';
import 'package:ecomarce_app/src/data/data_source/data.dart';
import 'package:ecomarce_app/src/presentation/ui/product_details/widget/app_bar_widget.dart';
import 'package:ecomarce_app/src/presentation/ui/product_details/widget/product_details_category_widget.dart';
import 'package:ecomarce_app/src/presentation/ui/product_details/widget/product_details_imge_widget.dart';
import 'package:ecomarce_app/src/presentation/ui/product_details/widget/product_details_widget.dart';
import 'package:ecomarce_app/src/presentation/ui/shared_widgets/title_text.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreenBodyWidget extends StatefulWidget {
  const ProductDetailsScreenBodyWidget({Key? key}) : super(key: key);

  @override
  State<ProductDetailsScreenBodyWidget> createState() =>
      _ProductDetailsScreenBodyWidgetState();
}

class _ProductDetailsScreenBodyWidgetState
    extends State<ProductDetailsScreenBodyWidget>
    with TickerProviderStateMixin {
  bool isLiked = true;
  AnimationController? controller;
  Animation<double>? animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    animation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: controller!, curve: Curves.easeInToLinear));
    controller!.forward();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  FloatingActionButton _flotingButton() {
    return FloatingActionButton(
      onPressed: () {},
      backgroundColor: LightColor.orange,
      child: Icon(Icons.shopping_basket,
          color: Theme.of(context).floatingActionButtonTheme.backgroundColor),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _flotingButton(),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color(0xfffbfbfb),
              Color(0xfff7f7f7),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
          child: Stack(
            children: <Widget>[
              Column(
                children: const <Widget>[
                  ProductDetailsAppBarWidget(),
                  ProductDetailsImageWidget(),
                  ProductDetailsCategoryWidget(),
                ],
              ),
              const ProductDetailsWidget()
            ],
          ),
        ),
      ),
    );
  }
}
