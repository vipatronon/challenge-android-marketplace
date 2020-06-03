import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lodjinha/src/ui/common/AppnameText.dart';
import 'package:lodjinha/src/utils/ColorPalette.dart';
import 'package:lodjinha/src/utils/FontFamilies.dart';
import 'package:lodjinha/src/utils/Strings.dart';
import '../pages/AboutPage.dart';

Widget appDrawer(BuildContext context){
  return Drawer(
    elevation: 3,
    child: ListView(
      children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 5),
              child: AppnameText(24),
            ),
          ),
          currentAccountPicture: CircleAvatar(
            backgroundColor: ColorPalette.tomato,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset('images/logo_sobre.png'),
            ),
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage('images/menu_pattern.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        drawerOption('home_menu', Strings.drawerHomeOption, () => {
          Navigator.pop(context)
        }),
        drawerOption('tag_menu', Strings.drawerAboutOption, () => {
          Navigator.pop(context),
          Navigator.push(context,
              MaterialPageRoute(
                builder: (context) => About(),
              ))
        })
      ],
    ),
  );
}

Widget drawerOption(String imageName, String optionName, Function() callback){
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
    child: InkWell(
      onTap: () => callback(),
      child: Row(
        children: <Widget>[
          Image.asset(
            'images/$imageName.png',
            scale: 4,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              optionName,
              style: TextStyle(
                  color: ColorPalette.black,
                  fontFamily: FontFamilies.roboto,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  letterSpacing: -0.3),
            ),
          )
        ],
      ),
    ),
  );
}