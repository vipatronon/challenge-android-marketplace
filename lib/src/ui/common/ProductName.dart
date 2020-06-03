import 'package:flutter/cupertino.dart';

Widget productName(String productName){
  return Text(
    productName,
    style: TextStyle(
        color: Color(0xFF2D3142),
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
        fontSize: 18),
  );
}