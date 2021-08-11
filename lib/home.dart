import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO StateNotifier系のロード
    return Scaffold(
      /// カルーセルスライダーでスワイプ可能に。
      /// 高さは画面の半分くらい
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          RaisedButton(
            shape: const CircleBorder(
              side: const BorderSide(
                color: Colors.white70,
                width: 1,
                style: BorderStyle.solid,
              ),
            ),
            color: HexColor("#343434"),
            child: const Icon(
                Icons.settings,
                color: Colors.white70,
            ),
            onPressed: () {
              // TODO
            },
          ),
          CarouselSlider.builder(
            itemBuilder: (context, index, realIndex) {
              /// 各演目の画像、タイトル、説明、スタートボタン（＝演目詳細画面に遷移）を表示
              return _ProgramCard();
            },
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height*2/3,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 10),
            ),
            itemCount: 4,
          ),
        ],
      ),
    );
  }
}

class _ProgramCard extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Card(
      color: HexColor("#2A2924"),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          /// 演目の画像
          SizedBox(
            width: MediaQuery.of(context).size.width*4/5,
            child: FlutterLogo(),
          ),
          /// タイトル、説明、スタートボタン
          _Description(),
        ],
      ),
    );
  }
}

class _Description extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(),
        CupertinoButton(
            child: Icon(Icons.play_arrow),
            onPressed: () {
              // TODO
            },
        ),
      ],
    );
  }
}