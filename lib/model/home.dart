import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:r3speechplayer/model/program.dart';
part 'home.freezed.dart';

@freezed
abstract class HomeM with _$HomeM{
  factory HomeM({
    @Default([]) List<ProgramModel> programs,
  }) = _HomeM;
}