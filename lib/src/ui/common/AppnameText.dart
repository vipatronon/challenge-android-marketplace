import 'package:flutter/cupertino.dart';
import 'package:lodjinha/src/utils/FontFamilies.dart';
import 'package:lodjinha/src/utils/Strings.dart';

Widget AppnameText([double size = 12.0, Color color = const Color(0xFFFFFFFF)]) {
  return Text(
    Strings.appName,
    style: TextStyle(fontFamily: FontFamilies.pacifico, fontSize: size, color: color),
  );
}
