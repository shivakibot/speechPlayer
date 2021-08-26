import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'program.freezed.dart';

@freezed
abstract class ProgramModel with _$ProgramModel{
  factory ProgramModel({
    @Default('') String title,
    @Default('') String author,
    @Default('') String imagePath,
    @Default(null) List<String> content,
    @Default('') String mediaPath,
  }) = _ProgramModel;
}