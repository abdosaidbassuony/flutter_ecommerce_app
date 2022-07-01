import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/home_bloc/home_bloc.dart';
import 'package:ecomarce_app/src/core/resources/theme.dart';
import 'package:ecomarce_app/src/data/model/product.dart';
import 'package:ecomarce_app/src/presentation/ui/home/widget/product_card.dart';

class ProductListWidget extends StatelessWidget {
  final List<Product>? productsList;

  const ProductListWidget({Key? key, this.productsList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: AppTheme.fullWidth(context),
      height: AppTheme.fullWidth(context) * .7,
      child: ListView(
        padding: const EdgeInsets.only(left: 20),
        scrollDirection: Axis.horizontal,
        children: productsList!
            .map(
              (product) => ProductCard(
                product: product,
                onSelected: (model) {
                  BlocProvider.of<HomeBloc>(context)
                      .add(SelectProductCartEvent(product: product));
                },
              ),
            )
            .toList(),
      ),
    );
  }
}
