import 'package:flutter/material.dart';
import 'package:lodjinha/src/ui/home/pages/HomePage.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        primaryColor: Color(0xFF5E2A84),
        scaffoldBackgroundColor: Color(0xFFFCFCFC)
      ),
      home: Scaffold(
        body: Home(),
      ),
    );
  }
}