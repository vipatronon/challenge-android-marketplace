import 'package:flutter/cupertino.dart';
import 'package:lodjinha/src/utils/ColorPalette.dart';
import 'package:lodjinha/src/utils/FontFamilies.dart';

Widget productName(String productName){
  return Text(
    productName,
    style: TextStyle(
        color: ColorPalette.dark,
        fontFamily: FontFamilies.roboto,
        fontWeight: FontWeight.w500,
        fontSize: 18),
  );
}