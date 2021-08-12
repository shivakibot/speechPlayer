
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:r3speechplayer/transition.dart';

import 'home.dart';

class Program extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /// TODO 凛の画像想定
          SizedBox(
            width: MediaQuery.of(context).size.width*4/5,
            height: MediaQuery.of(context).size.height*2/5,
            child: Image.asset("assets/program01.jpg"),
          ),
          /// 字幕
          _Caption(),
          /// メディア Slider
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: _MediaSlider(),
          ),
          /// メディア操作UI
          _MediaController(),
        ],
      ),
    );
  }
}


class _Caption extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO load Caption
    double time = 50;
    return Container(
      color: HexColor("#614B4B"),
      height: MediaQuery.of(context).size.height/6,
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: RichText(
          textHeightBehavior: TextHeightBehavior(
            applyHeightToFirstAscent: false,
            applyHeightToLastDescent: false,
          ),
          maxLines: null,
          text: TextSpan(
            children: [
              TextSpan(
                style: TextStyle(height: 2),
                  text: "content content content content content content content content content content content content content content content content content content content "
              ),
              TextSpan(
                  style: TextStyle(height: 2),
                  text: "content content content content content content content content content content content content content content content content content content content "
              ),
              TextSpan(
                  style: TextStyle(height: 2),
                  text: "content content content content content content content content content content content content content content content content content content content "
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MediaSlider extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO load MediaDuration
    double time = 50;
    return Slider(
      // TODO function MediaControl
      onChanged: (double value) {

      },
      value: time,
      min: 0,
      max: 100,
    );
  }
}


class _MediaController extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // back button
        ButtonTheme(
          minWidth: 30,
          child: RaisedButton(
            color: HexColor("#343434"),
            shape: const CircleBorder(
              side: const BorderSide(
                color: Colors.transparent,
                width: 1,
                style: BorderStyle.solid,
              ),
            ),
            child: Icon(
              Icons.stop,
              color: Colors.amber,
            ),
            onPressed: () {
              Navigator.of(context)
                  .pushReplacement(fadeTransitionRoute(Home()));
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            padding: EdgeInsets.all(0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: HexColor("#54412F"),
            ),
//            color: HexColor("#54412F"),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonTheme(
                  minWidth: 30,
                  child: RaisedButton(
                    color: HexColor("#54412F"),
                    shape: const CircleBorder(
                      side: const BorderSide(
                        color: Colors.transparent,
                        width: 1,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: Icon(
                      Icons.replay_10,
                      color: Colors.white,
                    ),
                    onPressed: () {
                    },
                  ),
                ),
                ButtonTheme(
                  minWidth: 30,
                  child: RaisedButton(
                    color: HexColor("#54412F"),
                    shape: const CircleBorder(
                      side: const BorderSide(
                        color: Colors.transparent,
                        width: 1,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                    ),
                    onPressed: () {
                    },
                  ),
                ),
                ButtonTheme(
                  minWidth: 30,
                  child: RaisedButton(
                    color: HexColor("#54412F"),
                    shape: const CircleBorder(
                      side: const BorderSide(
                        color: Colors.transparent,
                        width: 1,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: Icon(
                      Icons.forward_10,
                      color: Colors.white,
                    ),
                    onPressed: () {
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        ButtonTheme(
          minWidth: 30,
          child: RaisedButton(
            color: HexColor("#343434"),
            shape: const CircleBorder(
              side: const BorderSide(
                color: Colors.transparent,
                width: 1,
                style: BorderStyle.solid,
              ),
            ),
            child: Icon(
              Icons.volume_up,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context)
                  .pushReplacement(fadeTransitionRoute(Home()));
            },
          ),
        ),
      ],
    );
  }

}