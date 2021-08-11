import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'home.dart';

void main() {
  // TODO get_it のロード
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // TODO Multi Provider 系
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: HexColor("#3D3B32"),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        accentIconTheme: IconThemeData(
          color: Colors.white,
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      home: Home(),
    );
  }
}