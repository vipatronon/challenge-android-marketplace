import 'package:flutter/cupertino.dart';

Widget previousProductPrice(double price){
  return Text(
    "Por: ${price}",
    style: TextStyle(
        color: Color(0xFFF15025),
        fontFamily: 'Roboto',
        fontWeight: FontWeight.bold,
        fontSize: 18),
  );
}