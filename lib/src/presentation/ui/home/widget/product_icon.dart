import 'package:flutter/material.dart';

import 'package:ecomarce_app/src/core/resources/light_color.dart';
import 'package:ecomarce_app/src/core/resources/theme.dart';
import 'package:ecomarce_app/src/core/utilities/extentions.dart';
import 'package:ecomarce_app/src/data/model/category.dart';
import 'package:ecomarce_app/src/presentation/ui/shared_widgets/title_text.dart';

class ProductIcon extends StatelessWidget {
  final ValueChanged<Category>? onSelected;
  final Category? model;

  const ProductIcon({Key? key, this.model, this.onSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return model!.id == null
        ? Container(width: 5)
        : Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Container(
              padding: AppTheme.hPadding,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                color: model!.isSelected!
                    ? LightColor.background
                    : Colors.transparent,
                border: Border.all(
                  color:
                      model!.isSelected! ? LightColor.orange : LightColor.grey,
                  width: model!.isSelected! ? 2 : 1,
                ),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: model!.isSelected!
                        ? const Color(0xfffbf2ef)
                        : Colors.white,
                    blurRadius: 10,
                    spreadRadius: 5,
                    offset: const Offset(5, 5),
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  model!.image != null
                      ? Image.asset(model!.image!)
                      : const SizedBox(),
                  model!.name == null
                      ? Container()
                      : TitleText(
                          text: model!.name,
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                        )
                ],
              ),
            ).ripple(
              () => onSelected!(model!),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
          );
  }
}
