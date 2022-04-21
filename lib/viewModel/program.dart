import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:r3speechplayer/model/audioState.dart';
import 'package:r3speechplayer/model/program.dart';
import 'package:r3speechplayer/repository/localDatabase.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:state_notifier/state_notifier.dart';

class ProgramVM extends StateNotifier<AudioState> with LocatorMixin{
  final _repo = GetIt.I<Audio>();
  Timer _timer;
  final ProgramModel program;
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener = ItemPositionsListener.create();
  ProgramVM(this.program) : super(AudioState()){
    debugPrint('const ProgramVM');
    state = state.copyWith(program: program);
  }
  @override
  void initState() {
    super.initState();
    debugPrint('initState ProgramVM');
    init();
  }

  void init() async{
    debugPrint('init ProgramVM');
    AudioPlayer media = await _repo.init(program.mediaPath);
    media.onPlayerStateChanged.listen((status) {
      if(mounted){
        switch(status){
          case AudioPlayerState.PLAYING:
            state = state.copyWith(progress: true);
            break;
          default:
            state = state.copyWith(progress: false);
            break;
        }
      }
    });
    media.onAudioPositionChanged.listen((position) {
      if(mounted){
        state = state.copyWith(position: position);
      }
    });
    media.onDurationChanged.listen((duration) async{
      if(mounted){
        debugPrint('onDurationChanged called');
        state = state.copyWith(duration: duration);
        /// 字幕タイマーのセット
        if(_timer == null){
          debugPrint('init _timer');
          _timer = Timer.periodic(Duration(milliseconds : (scrollCaptionDuration(duration, state.program.content.length-1)*1000).round()), (timer) => scrollCaptionLine());
        }
      }
    });
    media.onNotificationPlayerStateChanged.listen((event) {
      if(mounted){
        debugPrint('$event');
      }
    });
    state = state.copyWith(media: media);
  }

  @override
  void dispose() {
    debugPrint('dispose ProgramVM');
    /// 必ず Audioを解放すること
    if(state.media.state != AudioPlayerState.STOPPED){
      debugPrint('STOPPED AudioPlayerState');
      state.media.stop();
    }
    _timer.cancel();
    super.dispose();
  }

  Future<int> pause(){
    return _repo.pause(state.media).then((value) {
      if(value == 1) {
        state = state.copyWith(progress: false);
      } else {
        debugPrint('pause error $value');
      }
    }).catchError((e){
      debugPrint('$e');
    });
  }

  Future<int> resume(){
    return _repo.resume(state.media).then((value) {
      if(value == 1) {
        state = state.copyWith(progress: true);
      } else {
        debugPrint('resume error $value');
      }
    }).catchError((e){
      debugPrint('$e');
    });
  }

  Future<int> seekInAbsolute(int seconds){
    return _repo.seek(state.media, seconds).then((value) {
      if(value == 1) {
        var index = progressIndex(seconds);
        /// TODO scroll
        state = state.copyWith(position: Duration(seconds: seconds), captionIndex: index);
      } else {
        debugPrint('seekInAbsolute error $value');
      }
    }).catchError((e){
      debugPrint('$e');
    });
  }

  Future<int> seekInRelative(int seconds){
    var seekPoint = state.position.inSeconds.toInt() + seconds;
    if(seekPoint <= 0){
      seekPoint = 1;
    }
    if(seekPoint >= state.duration.inSeconds){
      seekPoint = state.duration.inSeconds - 1;
    }
    return _repo.seek(state.media, seekPoint).then((value) {
      if(value == 1) {
        var index = progressIndex(seekPoint);
        /// TODO scroll
        state = state.copyWith(position: Duration(seconds: seekPoint), captionIndex: index);
      } else {
        debugPrint('seekInAbsolute error $value');
      }
    }).catchError((e){
      debugPrint('$e');
    });
  }

  Future<int> sound(){
    return _repo.changeVolume(state.media, 1.0).then((value) {
      if(value == 1) {
        state = state.copyWith(sound: true);
      } else {
        debugPrint('resume error $value');
      }
    }).catchError((e){
      debugPrint('$e');
    });
  }

  Future<int> mute(){
    return _repo.changeVolume(state.media, 0.0).then((value) {
      if(value == 1) {
        state = state.copyWith(sound: false);
      } else {
        debugPrint('resume error $value');
      }
    }).catchError((e){
      debugPrint('$e');
    });
  }

  void jumpCaptionLine(int movePoint){
    /// 再生中なのでスクロールを実行
    debugPrint('call jumpCaptionLine $movePoint');
    itemScrollController.jumpTo(index: progressIndex(movePoint));
    state = state.copyWith(captionIndex: progressIndex(movePoint));
  }


  void scrollCaptionLine() {
    debugPrint('call scrollCaptionLine');
    if(mounted){
      debugPrint('mounted scrollCaptionLine');
      if(state.progress){
        debugPrint('progress scrollCaptionLine');
        /// 再生中なのでスクロールを実行
        /// TODO 対象のスクロールロジックが合ってない。
        int next = state.captionIndex + 1;
        debugPrint('scroll $next index');
        itemScrollController.scrollTo(index: next, duration: Duration(milliseconds: 200));
        state = state.copyWith(captionIndex: next);
      }
    }
  }

  double scrollCaptionDuration(Duration _duration, int length){

    debugPrint('scrollCaptionDuration ${(_duration.inSeconds/length)} millsec');
    return _duration.inSeconds/length;
  }

  int progressIndex(int movePoint){
    debugPrint('start progressIndex');
    debugPrint('${state.program.original.length} / $movePoint * ${scrollCaptionDuration(state.duration, state.program.original.length)} * ${state.program.content.length}');
    return ((state.program.original.length / (movePoint * scrollCaptionDuration(state.duration, state.program.original.length))) * state.program.content.length).round();
  }
}