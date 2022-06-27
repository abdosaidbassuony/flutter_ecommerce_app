import 'package:ecomarce_app/src/core/resources/theme.dart';
import 'package:ecomarce_app/src/data/model/category.dart';
import 'package:ecomarce_app/src/presentation/ui/home/widget/product_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/home_bloc/home_bloc.dart';

class CategoryListWidget extends StatelessWidget {
  final List<Category>? categoriesList;

  const CategoryListWidget({Key? key, this.categoriesList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: AppTheme.fullWidth(context),
      height: 80,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: categoriesList!
            .map(
              (category) => ProductIcon(
                model: category,
                onSelected: (model) => BlocProvider.of<HomeBloc>(context)
                    .add(SelectCategoryCartEvent(category: category)),
              ),
            )
            .toList(),
      ),
    );
  }
}
