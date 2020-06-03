import 'package:flutter/cupertino.dart';
import 'package:lodjinha/src/utils/ColorPalette.dart';
import 'package:lodjinha/src/utils/FontFamilies.dart';
import 'package:lodjinha/src/utils/Strings.dart';

Widget previousProductPrice(double price) {
  return Text(
    (Strings.productPreviousPrice + price.toString()),
    style: TextStyle(
        color: ColorPalette.greyish,
        fontFamily: FontFamilies.roboto,
        fontWeight: FontWeight.w500,
        fontSize: 12,
        decoration: TextDecoration.lineThrough),
  );
}
