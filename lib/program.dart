
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:r3speechplayer/model/program.dart';
import 'package:r3speechplayer/transition.dart';
import 'package:r3speechplayer/viewModel/program.dart';
import 'package:provider/provider.dart';

import 'home.dart';
import 'model/audioState.dart';

class ProgramProvider extends StatelessWidget{
  final ProgramModel program;

  const ProgramProvider({this.program}) : super();
  @override
  Widget build(BuildContext context) {
    debugPrint('build ProgramProvider');
    return StateNotifierProvider<ProgramVM, AudioState>(
      create: (_) => ProgramVM(program),
      child: Program(),
    );
  }

}

class Program extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    debugPrint('build Program');
    final title = context.select((AudioState state) => state.program.title);
    final path = context.select((AudioState state) => state.program.imagePath);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('$title'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width*4/5,
            height: MediaQuery.of(context).size.height*2/5,
            child: Image.asset("$path"),
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
    final content = context.select((AudioState state) => state.program.content);
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
            style: TextStyle(
              fontSize: 20,
            ),
            children: _contentSpans(content),
          ),
        ),
      ),
    );
  }
  List<InlineSpan> _contentSpans(List<String> content){
    var contentWidgets = List<InlineSpan>();
    content.forEach((line) => contentWidgets.add(TextSpan(text: line+'\r\n')));
    return contentWidgets;
  }
}

class _MediaSlider extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final duration = context.select((AudioState state) => state.duration);
//    final max = context.select((AudioState state) => state.max);
    final position = context.select((AudioState state) => state.position);
    final vm = context.select((ProgramVM vm) => vm);
//    debugPrint('duration _MediaSlider ${model.inSeconds.toDouble()}');
    debugPrint('position _MediaSlider ${position.inSeconds}');
    debugPrint('duration _MediaSlider ${duration.inSeconds}');
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          Slider.adaptive(
            onChanged: (double value) {
              debugPrint('onChanged _MediaSlider $value');
              vm.seekInAbsolute(value.toInt());
            },
            value: position.inSeconds.toDouble(),
            min: 0,
            label: _durationFormat(position),
            divisions: duration.inSeconds != 0 ? duration.inSeconds.round() : 1,
            max: duration.inSeconds.toDouble(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(_durationFormat(Duration(seconds: 0))),
              Text(_durationFormat(duration)),
            ],
          ),
        ],
      ),
    );
  }

  String _durationFormat(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    if(duration.inHours == 0){
      return "$twoDigitMinutes:$twoDigitSeconds";
    }
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }
}


class _MediaController extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final model = context.select((AudioState state) => state);
    final vm = context.select((ProgramVM vm) => vm);
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
                  .pushReplacement(fadeTransitionRoute(HomeProvider()));
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
                      vm.seekInRelative(-15);
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
                      model.progress ? Icons.pause : Icons.play_arrow,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      model.progress ? vm.pause() : vm.resume();
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
                      vm.seekInRelative(15);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 55),
        ),
//        ButtonTheme(
//          minWidth: 30,
//          child: RaisedButton(
//            color: HexColor("#343434"),
//            shape: const CircleBorder(
//              side: const BorderSide(
//                color: Colors.transparent,
//                width: 1,
//                style: BorderStyle.solid,
//              ),
//            ),
//            child: Icon(
//              model.sound ? Icons.volume_up : Icons.volume_mute,
//              color: Colors.white,
//            ),
//            onPressed: () {
//              model.sound ? vm.mute() : vm.sound();
//            },
//          ),
//        ),
      ],
    );
  }

}