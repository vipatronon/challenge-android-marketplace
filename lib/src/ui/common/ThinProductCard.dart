import 'package:flutter/material.dart';

class ThinProductCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 9 / 2,
      child: Row(
        children: <Widget>[
          Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.all(5),
                child: Container(
                  //Lugar da imagem
                  color: Colors.blueGrey,
                ),
              )),
          Expanded(
              flex: 7,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    Text(
                      'Nome do produto com uma descrição grandona',
                      style: TextStyle(
                          color: Color(0xFF2D3142),
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          fontSize: 18
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'De: 9999,99',
                          style: TextStyle(
                              color: Color(0xFFAAAAAA),
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              decoration: TextDecoration.lineThrough
                          ),
                        ),
                        Text(
                          'Por: 9999,99',
                          style: TextStyle(
                              color: Color(0xFFF15025),
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold,
                              fontSize: 18
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
          ),
          Expanded(
              flex: 1,
              child: Container(
                //Lugar da setinha
                color: Colors.brown,
              )
          ),
        ],
      ),
    );
  }
}