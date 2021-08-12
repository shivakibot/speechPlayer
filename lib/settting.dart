import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:r3speechplayer/transition.dart';

import 'home.dart';

const TextStyle style = TextStyle(
  color: Colors.white
);

class Setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
//            Padding(
//              padding: EdgeInsets.symmetric(vertical:  10),
//              child: const Text('音量調整'),
//            ),
//            Slider(
//              // TODO function MediaControl
//              onChanged: (double value) {},
//              value: 20,
//              min: 0,
//              max: 100,
//            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical:  10),
              child: const Text('音量調整'),
            ),
            Slider(
              // TODO function MediaControl
              onChanged: (double value) {},
              value: 20,
              min: 0,
              max: 100,
            ),
            Padding(
              padding: EdgeInsets.only(top: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RaisedButton(
                    padding: EdgeInsets.all(15),
//                    shape: const CircleBorder(
//                      side: const BorderSide(
//                        color: Colors.white70,
//                        width: 1,
//                        style: BorderStyle.solid,
//                      ),
//                    ),
                    color: HexColor("#343434"),
                    child: const Text(
                      '戻る',
                      style: style,
                    ),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(fadeTransitionRoute(Home()));
                    },
                  ),
//                  CupertinoButton(
//                    child: const Text(
//                      '変更せず戻る',
//                      style: style,
//                    ),
//                    onPressed: () {
//                      Navigator.of(context).pushReplacement(fadeTransitionRoute(Home()));
//                    },
//                    color: Colors.white54,
//
//                  ),
//                  CupertinoButton(
//                    child: const Text('変更を保存',style: style,),
//                    onPressed: () {
//                      Navigator.of(context).pushReplacement(fadeTransitionRoute(Home()));
//                    },
//                    color: Colors.white54,
//                  ),
                  RaisedButton(
                    padding: EdgeInsets.all(15),
//                    shape: const CircleBorder(
//                      side: const BorderSide(
//                        color: Colors.white70,
//                        width: 1,
//                        style: BorderStyle.solid,
//                      ),
//                    ),
                    color: HexColor("#343434"),
                    child: const Text('保存',style: style,),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(fadeTransitionRoute(Home()));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
