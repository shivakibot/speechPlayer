import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:r3speechplayer/model/program.dart';
part 'audioState.freezed.dart';

@freezed
abstract class AudioState with _$AudioState{
  factory AudioState({
    AudioPlayer media,
    @Default(Duration(seconds: 0)) Duration position,
    @Default(Duration(seconds: 0)) Duration duration,
//    @Default(0) double max,
//    @Default(0) double rating,
//    @Default(AudioPlayerState.STOPPED) AudioPlayerState status,
    @Default(true) bool progress,
    @Default(true) bool sound,
    @Default(0) int captionIndex,
    ProgramModel program,
  }) = _AudioState;
}