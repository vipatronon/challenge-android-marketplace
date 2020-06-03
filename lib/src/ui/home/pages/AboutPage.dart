import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lodjinha/src/ui/common/AppnameText.dart';
import 'package:lodjinha/src/utils/ColorPalette.dart';
import 'package:lodjinha/src/utils/FontFamilies.dart';
import 'package:lodjinha/src/utils/Strings.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Strings.appName),
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
                AppnameText(60, ColorPalette.greyishBrown),
              ],
            ),
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(3),
                  child: Text(
                    Strings.aboutDevName,
                    style: TextStyle(
                        fontFamily: FontFamilies.roboto,
                        letterSpacing: -0.3,
                        fontWeight: FontWeight.w400,
                        fontSize: 14),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(3),
                  child: Text(
                    Strings.aboutDevelopmentDate,
                    style: TextStyle(
                        fontFamily: FontFamilies.roboto,
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
