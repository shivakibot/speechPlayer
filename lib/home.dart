import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:marquee/marquee.dart';
import 'package:r3speechplayer/program.dart';
import 'package:provider/provider.dart';
import 'package:r3speechplayer/transition.dart';
import 'package:r3speechplayer/viewModel/home.dart';

import 'model/home.dart';

class HomeProvider extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    debugPrint('build HomeProvider');
    return StateNotifierProvider<HomeVM, HomeM>(
      create: (_) => HomeVM(),
      child: Home(),
    );
  }

}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugPrint('build Home');
    final vm = context.select((HomeVM vm) => vm);
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      debugPrint('addPostFrameCallback');
      final manifestJson = await DefaultAssetBundle.of(context).loadString('AssetManifest.json');
      final Map<String, dynamic> manifestMap = json.decode(manifestJson);
      vm.init(manifestMap);
    });
    final programs = context.select((HomeM model) => model.programs);
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
              if(programs.length < 1){
//                return SizedBox(
//                  height: 100,
//                  width: 100,
//                  child: CircularProgressIndicator(),
//                );
                return Center(child: Text('Loading...'),);
              } else{
                /// 各演目の画像、タイトル、説明、スタートボタン（＝演目詳細画面に遷移）を表示
                return _ProgramCard(index);
              }
            },
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height * 2 / 3,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 10),
            ),
            itemCount: programs.length,
          ),
        ],
      ),
    );
  }
}

class _ProgramCard extends StatelessWidget {
  final int index;

  _ProgramCard(this.index);

//  final List<String> imagePath = [
//    "assets/program01.jpg",
//    "assets/program02.jpg",
//    "assets/program03.jpg"
//  ];

  @override
  Widget build(BuildContext context) {
    final program = context.select((HomeM model) => model.programs[index]);
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
              child: Image.asset(program.imagePath),
            ),
          ),

          /// タイトル、説明、スタートボタン
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: _Description(index),
          ),
        ],
      ),
    );
  }
}

class _Description extends StatelessWidget {
  final int index;

  _Description(this.index);
  @override
  Widget build(BuildContext context) {
    final program = context.select((HomeM model) => model.programs[index]);
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
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 20
                      ),
                        text: program.title + '  /  ' + program.author,
                    ),
                  ),
                ),
                RichText(
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  text: TextSpan(
                    children: _contentSpans(program.content)
                  ),
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
                    .pushReplacement(fadeTransitionRoute(ProgramProvider(program: program)));
              },
            )
        ),
      ],
    );
  }
  List<InlineSpan> _contentSpans(List<String> content){
    var contentWidgets = List<InlineSpan>();
    content.forEach((line) => contentWidgets.add(TextSpan(text: line)));
    return contentWidgets;
  }
}
