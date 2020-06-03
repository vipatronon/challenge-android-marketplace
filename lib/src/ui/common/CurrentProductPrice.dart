import 'package:flutter/cupertino.dart';
import 'package:lodjinha/src/utils/ColorPalette.dart';
import 'package:lodjinha/src/utils/FontFamilies.dart';
import 'package:lodjinha/src/utils/Strings.dart';

Widget currentProductPrice(double price) {
  return Text(
    (Strings.productCurrentPrice + price.toString()),
    style: TextStyle(
        color: ColorPalette.tomato,
        fontFamily: FontFamilies.roboto,
        fontWeight: FontWeight.bold,
        fontSize: 18),
  );
}
