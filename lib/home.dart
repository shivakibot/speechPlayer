import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:r3speechplayer/program.dart';

import 'package:r3speechplayer/settting.dart';
import 'package:r3speechplayer/transition.dart';

class Home extends StatelessWidget {
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
//          RaisedButton(
//            shape: const CircleBorder(
//              side: const BorderSide(
//                color: Colors.white70,
//                width: 1,
//                style: BorderStyle.solid,
//              ),
//            ),
//            color: HexColor("#343434"),
//            child: const Icon(
//                Icons.settings,
//                color: Colors.white70,
//            ),
//            onPressed: () {
//              Navigator.of(context).pushReplacement(fadeTransitionRoute(Setting()));
//            },
//          ),
          CarouselSlider.builder(
            itemBuilder: (context, index, realIndex) {
              /// 各演目の画像、タイトル、説明、スタートボタン（＝演目詳細画面に遷移）を表示
              return _ProgramCard(index);
            },
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height * 2 / 3,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 10),
            ),
            itemCount: 3,
          ),
        ],
      ),
    );
  }
}

class _ProgramCard extends StatelessWidget {
  final int index;

  _ProgramCard(this.index);

  final List<String> imagePath = [
    "assets/program01.jpg",
    "assets/program02.jpg",
    "assets/program03.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      color: HexColor("#2A2924"),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          /// 演目の画像
          Padding(
            padding: EdgeInsets.symmetric(vertical: 30),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 4 / 5,
              child: Image.asset(imagePath[index]),
            ),
          ),

          /// タイトル、説明、スタートボタン
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: _Description(),
          ),
        ],
      ),
    );
  }
}

class _Description extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child : RichText(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    text: TextSpan(text: "Title"),
                  ),
                ),
                RichText(
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                    text: TextSpan(
                        text:'subtitle subtitle subtitle subtitle subtitle subtitle subtitle subtitle subtitle subtitle subtitle subtitle subtitle subtitle subtitle subtitle')
                ),
              ],
            )
        ),
        Flexible(
          flex: 1,
            child: RaisedButton(
              color: HexColor("#5D4C4C"),
              shape: const CircleBorder(
                side: const BorderSide(
                  color: Colors.white24,
                  width: 1,
                  style: BorderStyle.solid,
                ),
              ),
              child: Icon(
                Icons.play_arrow,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context)
                    .pushReplacement(fadeTransitionRoute(Program()));
              },
            )
        ),
      ],
    );
  }
}
