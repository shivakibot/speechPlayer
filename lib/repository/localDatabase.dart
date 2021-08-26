
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';

///
/// AudioPlayer リポジトリクラス
/// このクラス自体は シングルトンにするが、 AudioPlayerの
/// ライフサイクル管理は各program view Modelの責任範囲とする。
///
/// viewModel ではエラーハンドリングし、必ず Audio を終了して破棄すること。
///

class Audio {
  static final Audio audio = Audio.internal();
  Audio.internal();
  factory Audio(){
    return audio;
  }
  /// デフォルトでマナーモード時には消音とする
  /// とりあえずinit 時から即、ロードと再生をスタートすることにする。
  ///
  Future<AudioPlayer> init(String mediaPath) async{
    String postFixAssetPath = mediaPath.replaceFirst('assets/', '');
    return await AudioCache().play('$postFixAssetPath', isNotification: true);
  }

  Future<int> changeVolume(AudioPlayer media, double volume){
    return media.setVolume(volume);
  }
  Future<int> pause(AudioPlayer media){
    return media.pause();
  }
  Future<int> resume(AudioPlayer media){
    return media.resume();
  }
  /// stop と書いてあるが、デフォルトのリリースモード再生の場合は解放も兼ねる。
  Future<int> release(AudioPlayer media){
    return media.stop();
  }


  /// 負数の場合はその時点から 前に遡る。
  /// 曲時間範囲から超過した場合の挙動は不明。
  Future<int> seek(AudioPlayer media, int seconds){
    return media.seek(Duration(seconds: seconds))
        .catchError((e){
          debugPrint('$e');
    });
  }
}