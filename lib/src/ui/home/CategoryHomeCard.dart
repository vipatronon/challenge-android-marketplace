import 'package:flutter/material.dart';

class CategoryHomeCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Container(
            //Lugar da imagem
            color: Colors.amber,
            width: 80,
            height: 80,
          ),
          Text(
            'Descrição',
            style: TextStyle(
                color: Color(0xFF2D3142),
                fontFamily: 'Roboto',
                fontWeight: FontWeight.normal,
                fontSize: 13),
          ),
        ],
      ),
    );
  }
}
