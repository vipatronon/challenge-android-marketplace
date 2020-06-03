import 'package:flutter/cupertino.dart';

Widget currentProductPrice(double price){
  return Text(
    "De:${price.toString()}",
    style: TextStyle(
        color: Color(0xFFAAAAAA),
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
        fontSize: 12,
        decoration: TextDecoration.lineThrough),
  );
}