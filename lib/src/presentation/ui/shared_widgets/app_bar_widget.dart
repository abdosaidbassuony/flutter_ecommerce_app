import 'package:flutter/material.dart';

import 'package:ecomarce_app/src/core/resources/light_color.dart';
import 'package:ecomarce_app/src/core/resources/theme.dart';
import 'package:ecomarce_app/src/core/utilities/extentions.dart';

AppBar appBarWidget(String? title, BuildContext context) {
  return AppBar(
    elevation: 0,
    leading: Container(
      margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      child: RotatedBox(
        quarterTurns: 4,
        child: _icon(Icons.sort, color: Colors.black54, context: context),
      ),
    ),
    title: Text(
      title!,
      style: const TextStyle(color: LightColor.black),
    ),
    centerTitle: true,
    backgroundColor: LightColor.background,
    actions: [
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(13)),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
              boxShadow: const <BoxShadow>[
                BoxShadow(
                    color: Color(0xfff8f8f8), blurRadius: 10, spreadRadius: 10),
              ],
            ),
            child: Image.asset("assets/user.png"),
          ),
        ).ripple(() {},
            borderRadius: const BorderRadius.all(Radius.circular(13))),
      )
    ],
  );
}

Widget _icon(IconData icon,
    {Color color = LightColor.iconColor, BuildContext? context}) {
  return Container(
    padding: const EdgeInsets.all(10),
    decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(13)),
        color: Theme.of(context!).backgroundColor,
        boxShadow: AppTheme.shadow),
    child: Icon(
      icon,
      color: color,
    ),
  ).ripple(() {}, borderRadius: const BorderRadius.all(Radius.circular(13)));
}
