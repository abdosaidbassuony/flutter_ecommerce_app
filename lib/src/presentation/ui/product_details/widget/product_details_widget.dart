import 'package:ecomarce_app/src/core/resources/light_color.dart';
import 'package:ecomarce_app/src/core/resources/theme.dart';
import 'package:ecomarce_app/src/core/utilities/extentions.dart';
import 'package:ecomarce_app/src/data/data_source/data.dart';
import 'package:ecomarce_app/src/presentation/ui/shared_widgets/title_text.dart';
import 'package:flutter/material.dart';

class ProductDetailsWidget extends StatefulWidget {
  const ProductDetailsWidget({Key? key}) : super(key: key);

  @override
  State<ProductDetailsWidget> createState() => _ProductDetailsWidgetState();
}

class _ProductDetailsWidgetState extends State<ProductDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      maxChildSize: .8,
      initialChildSize: .53,
      minChildSize: .53,
      builder: (context, scrollController) {
        return Container(
          padding: AppTheme.padding.copyWith(bottom: 0),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
              color: Colors.white),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                const SizedBox(height: 5),
                Container(
                  alignment: Alignment.center,
                  child: Container(
                    width: 50,
                    height: 5,
                    decoration: const BoxDecoration(
                        color: LightColor.iconColor,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const TitleText(text: "NIKE AIR MAX 200", fontSize: 25),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const <Widget>[
                            TitleText(
                              text: "\$ ",
                              fontSize: 18,
                              color: LightColor.red,
                            ),
                            TitleText(
                              text: "240",
                              fontSize: 25,
                            ),
                          ],
                        ),
                        Row(
                          children: const <Widget>[
                            Icon(Icons.star,
                                color: LightColor.yellowColor, size: 17),
                            Icon(Icons.star,
                                color: LightColor.yellowColor, size: 17),
                            Icon(Icons.star,
                                color: LightColor.yellowColor, size: 17),
                            Icon(Icons.star,
                                color: LightColor.yellowColor, size: 17),
                            Icon(Icons.star_border, size: 17),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                _availableSize(),
                const SizedBox(
                  height: 20,
                ),
                _availableColor(),
                const SizedBox(
                  height: 20,
                ),
                _description(),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _availableSize() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const TitleText(
          text: "Available Size",
          fontSize: 14,
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _sizeWidget("US 6"),
            _sizeWidget("US 7", isSelected: true),
            _sizeWidget("US 8"),
            _sizeWidget("US 9"),
          ],
        )
      ],
    );
  }

  Widget _sizeWidget(String text, {bool isSelected = false}) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
            color: LightColor.iconColor,
            style: !isSelected ? BorderStyle.solid : BorderStyle.none),
        borderRadius: const BorderRadius.all(Radius.circular(13)),
        color:
            isSelected ? LightColor.orange : Theme.of(context).backgroundColor,
      ),
      child: TitleText(
        text: text,
        fontSize: 16,
        color: isSelected ? LightColor.background : LightColor.titleTextColor,
      ),
    ).ripple(() {}, borderRadius: const BorderRadius.all(Radius.circular(13)));
  }

  Widget _availableColor() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const TitleText(
          text: "Available Size",
          fontSize: 14,
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _colorWidget(LightColor.yellowColor, isSelected: true),
            const SizedBox(
              width: 30,
            ),
            _colorWidget(LightColor.lightBlue),
            const SizedBox(
              width: 30,
            ),
            _colorWidget(LightColor.black),
            const SizedBox(
              width: 30,
            ),
            _colorWidget(LightColor.red),
            const SizedBox(
              width: 30,
            ),
            _colorWidget(LightColor.skyBlue),
          ],
        )
      ],
    );
  }

  Widget _colorWidget(Color color, {bool isSelected = false}) {
    return CircleAvatar(
      radius: 12,
      backgroundColor: color.withAlpha(150),
      child: isSelected
          ? Icon(
              Icons.check_circle,
              color: color,
              size: 18,
            )
          : CircleAvatar(radius: 7, backgroundColor: color),
    );
  }

  Widget _description() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const TitleText(
          text: "Available Size",
          fontSize: 14,
        ),
        const SizedBox(height: 20),
        Text(AppData.description),
      ],
    );
  }
}
