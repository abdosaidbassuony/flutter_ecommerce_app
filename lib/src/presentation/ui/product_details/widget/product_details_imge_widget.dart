import 'package:flutter/material.dart';

import 'package:ecomarce_app/src/core/resources/light_color.dart';
import 'package:ecomarce_app/src/presentation/ui/shared_widgets/title_text.dart';

class ProductDetailsImageWidget extends StatelessWidget {
  final Animation<double>? animation;

  const ProductDetailsImageWidget({Key? key, this.animation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: (context, child) {
        return AnimatedOpacity(
          duration: const Duration(milliseconds: 500),
          opacity: animation!.value,
          child: child,
        );
      },
      animation: animation!,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          const TitleText(
            text: "AIP",
            fontSize: 160,
            color: LightColor.lightGrey,
          ),
          Image.asset('assets/show_1.png')
        ],
      ),
    );
  }
}
