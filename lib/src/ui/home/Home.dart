import 'package:flutter/material.dart';
import 'package:lodjinha/src/ui/common/ThinProductCard.dart';
import 'CategoryHomeCard.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'a Lodjinha',
            style: TextStyle(fontFamily: 'Pacifico'),
          ),
        ),
        body: ThinProductCard());
  }
}