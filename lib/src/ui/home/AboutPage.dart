import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lodjinha/src/ui/common/AppnameText.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sobre'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'images/logo_sobre.png',
                  scale: 3.5,
                ),
                AppnameText(60, Color(0xFF4A4A4A)),
              ],
            ),
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(3),
                  child: Text(
                    'Victor Pedrosa da Costa',
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        letterSpacing: -0.3,
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(3),
                  child: Text(
                    '03/06/2020',
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        letterSpacing: -0.3,
                        fontWeight: FontWeight.w200,
                        fontSize: 12),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
