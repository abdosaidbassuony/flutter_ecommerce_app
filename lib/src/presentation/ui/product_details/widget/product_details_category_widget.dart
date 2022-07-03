import 'package:flutter/material.dart';

import 'package:ecomarce_app/src/core/resources/light_color.dart';
import 'package:ecomarce_app/src/core/resources/theme.dart';
import 'package:ecomarce_app/src/core/utilities/extentions.dart';
import 'package:ecomarce_app/src/data/data_source/data.dart';

class ProductDetailsCategoryWidget extends StatelessWidget {
  final Animation<double>? animation;

  const ProductDetailsCategoryWidget({Key? key, this.animation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 0),
      width: AppTheme.fullWidth(context),
      height: 80,
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: AppData.showThumbnailList
              .map((x) => _thumbnailWidget(x))
              .toList()),
    );
  }

  Widget _thumbnailWidget(String image) {
    return AnimatedBuilder(
      animation: animation!,
      builder: (context, child) => AnimatedOpacity(
        opacity: animation!.value,
        duration: const Duration(milliseconds: 500),
        child: child,
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Container(
          height: 40,
          width: 50,
          decoration: BoxDecoration(
            border: Border.all(
              color: LightColor.grey,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(13)),
            // color: Theme.of(context).backgroundColor,
          ),
          child: Image.asset(image),
        ).ripple(() {},
            borderRadius: const BorderRadius.all(Radius.circular(13))),
      ),
    );
  }
}
