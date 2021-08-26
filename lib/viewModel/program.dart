import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:r3speechplayer/model/audioState.dart';
import 'package:r3speechplayer/model/program.dart';
import 'package:r3speechplayer/repository/localDatabase.dart';
import 'package:state_notifier/state_notifier.dart';

class ProgramVM extends StateNotifier<AudioState> with LocatorMixin{
  final _repo = GetIt.I<Audio>();
  final ProgramModel program;
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
        state = state.copyWith(duration: duration);
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
        state = state.copyWith(position: Duration(seconds: seconds));
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
        state = state.copyWith(position: Duration(seconds: seekPoint));
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
}