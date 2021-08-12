import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
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
    const locale = Locale("ja", "JP");
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        sliderTheme: SliderThemeData(
          /// 有効になっている値の部分の色
          activeTrackColor: Colors.white,
          /// 範囲内の有効でない値の部分の色
          inactiveTrackColor: Colors.white54,
          /// UIでタッチした時のオーバーレイエフェクト
//          overlayColor: Colors.black,
          /// つまみのところの色
          thumbColor: Colors.grey,
        ),
        buttonTheme: ButtonThemeData(
          textTheme: ButtonTextTheme.accent,
          buttonColor: Colors.white,
        ),
        primaryTextTheme: TextTheme(
          headline6: TextStyle(
            color: Colors.white,
          ),
          subtitle1: TextStyle(
            color: Colors.white,
          ),
          caption: TextStyle(
            color: Colors.white,
          ),
          bodyText1: TextStyle(
            color: Colors.white,
          ),
          bodyText2: TextStyle(
            color: Colors.white,
          ),
          button: TextStyle(
            color: Colors.white,
          ),
          headline5: TextStyle(
            color: Colors.white,
          ),
          subtitle2: TextStyle(
            color: Colors.white,
          ),
          headline1: TextStyle(
            color: Colors.white,
          ),
          headline2: TextStyle(
            color: Colors.white,
          ),
          headline3: TextStyle(
            color: Colors.white,
          ),
          headline4: TextStyle(
            color: Colors.white,
          ),
          overline: TextStyle(
            color: Colors.white,
          ),

        ),
        textTheme: TextTheme(
//          headline6: TextStyle(
//            color: Colors.white,
//          ),
//          subtitle1: TextStyle(
//            color: Colors.white,
//          ),
//          caption: TextStyle(
//            color: Colors.white,
//          ),
//          bodyText1: TextStyle(
//            color: Colors.white,
//          ),
          bodyText2: TextStyle(
            color: Colors.white,
          ),
//          button: TextStyle(
//            color: Colors.white,
//          ),
          headline5: TextStyle(
            color: Colors.white,
          ),
          subtitle2: TextStyle(
            color: Colors.white,
          ),
          headline1: TextStyle(
            color: Colors.white,
          ),
          headline2: TextStyle(
            color: Colors.white,
          ),
          headline3: TextStyle(
            color: Colors.white,
          ),
          headline4: TextStyle(
            color: Colors.white,
          ),
          overline: TextStyle(
            color: Colors.white,
          ),

        ),
        primaryColor: Colors.white,
        scaffoldBackgroundColor: HexColor("#3D3B32"),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        accentIconTheme: IconThemeData(
          color: Colors.white,
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      locale: locale,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        locale,
      ],
      home: Home(),
    );
  }
}