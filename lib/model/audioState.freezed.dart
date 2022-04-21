// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'audioState.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$AudioStateTearOff {
  const _$AudioStateTearOff();

// ignore: unused_element
  _AudioState call(
      {AudioPlayer media,
      Duration position = const Duration(seconds: 0),
      Duration duration = const Duration(seconds: 0),
      bool progress = true,
      bool sound = true,
      int captionIndex = 0,
      ProgramModel program}) {
    return _AudioState(
      media: media,
      position: position,
      duration: duration,
      progress: progress,
      sound: sound,
      captionIndex: captionIndex,
      program: program,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $AudioState = _$AudioStateTearOff();

/// @nodoc
mixin _$AudioState {
  AudioPlayer get media;
  Duration get position;
  Duration get duration; //    @Default(0) double max,
//    @Default(0) double rating,
//    @Default(AudioPlayerState.STOPPED) AudioPlayerState status,
  bool get progress;
  bool get sound;
  int get captionIndex;
  ProgramModel get program;

  @JsonKey(ignore: true)
  $AudioStateCopyWith<AudioState> get copyWith;
}

/// @nodoc
abstract class $AudioStateCopyWith<$Res> {
  factory $AudioStateCopyWith(
          AudioState value, $Res Function(AudioState) then) =
      _$AudioStateCopyWithImpl<$Res>;
  $Res call(
      {AudioPlayer media,
      Duration position,
      Duration duration,
      bool progress,
      bool sound,
      int captionIndex,
      ProgramModel program});

  $ProgramModelCopyWith<$Res> get program;
}

/// @nodoc
class _$AudioStateCopyWithImpl<$Res> implements $AudioStateCopyWith<$Res> {
  _$AudioStateCopyWithImpl(this._value, this._then);

  final AudioState _value;
  // ignore: unused_field
  final $Res Function(AudioState) _then;

  @override
  $Res call({
    Object media = freezed,
    Object position = freezed,
    Object duration = freezed,
    Object progress = freezed,
    Object sound = freezed,
    Object captionIndex = freezed,
    Object program = freezed,
  }) {
    return _then(_value.copyWith(
      media: media == freezed ? _value.media : media as AudioPlayer,
      position: position == freezed ? _value.position : position as Duration,
      duration: duration == freezed ? _value.duration : duration as Duration,
      progress: progress == freezed ? _value.progress : progress as bool,
      sound: sound == freezed ? _value.sound : sound as bool,
      captionIndex:
          captionIndex == freezed ? _value.captionIndex : captionIndex as int,
      program: program == freezed ? _value.program : program as ProgramModel,
    ));
  }

  @override
  $ProgramModelCopyWith<$Res> get program {
    if (_value.program == null) {
      return null;
    }
    return $ProgramModelCopyWith<$Res>(_value.program, (value) {
      return _then(_value.copyWith(program: value));
    });
  }
}

/// @nodoc
abstract class _$AudioStateCopyWith<$Res> implements $AudioStateCopyWith<$Res> {
  factory _$AudioStateCopyWith(
          _AudioState value, $Res Function(_AudioState) then) =
      __$AudioStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {AudioPlayer media,
      Duration position,
      Duration duration,
      bool progress,
      bool sound,
      int captionIndex,
      ProgramModel program});

  @override
  $ProgramModelCopyWith<$Res> get program;
}

/// @nodoc
class __$AudioStateCopyWithImpl<$Res> extends _$AudioStateCopyWithImpl<$Res>
    implements _$AudioStateCopyWith<$Res> {
  __$AudioStateCopyWithImpl(
      _AudioState _value, $Res Function(_AudioState) _then)
      : super(_value, (v) => _then(v as _AudioState));

  @override
  _AudioState get _value => super._value as _AudioState;

  @override
  $Res call({
    Object media = freezed,
    Object position = freezed,
    Object duration = freezed,
    Object progress = freezed,
    Object sound = freezed,
    Object captionIndex = freezed,
    Object program = freezed,
  }) {
    return _then(_AudioState(
      media: media == freezed ? _value.media : media as AudioPlayer,
      position: position == freezed ? _value.position : position as Duration,
      duration: duration == freezed ? _value.duration : duration as Duration,
      progress: progress == freezed ? _value.progress : progress as bool,
      sound: sound == freezed ? _value.sound : sound as bool,
      captionIndex:
          captionIndex == freezed ? _value.captionIndex : captionIndex as int,
      program: program == freezed ? _value.program : program as ProgramModel,
    ));
  }
}

/// @nodoc
class _$_AudioState with DiagnosticableTreeMixin implements _AudioState {
  _$_AudioState(
      {this.media,
      this.position = const Duration(seconds: 0),
      this.duration = const Duration(seconds: 0),
      this.progress = true,
      this.sound = true,
      this.captionIndex = 0,
      this.program})
      : assert(position != null),
        assert(duration != null),
        assert(progress != null),
        assert(sound != null),
        assert(captionIndex != null);

  @override
  final AudioPlayer media;
  @JsonKey(defaultValue: const Duration(seconds: 0))
  @override
  final Duration position;
  @JsonKey(defaultValue: const Duration(seconds: 0))
  @override
  final Duration duration;
  @JsonKey(defaultValue: true)
  @override //    @Default(0) double max,
//    @Default(0) double rating,
//    @Default(AudioPlayerState.STOPPED) AudioPlayerState status,
  final bool progress;
  @JsonKey(defaultValue: true)
  @override
  final bool sound;
  @JsonKey(defaultValue: 0)
  @override
  final int captionIndex;
  @override
  final ProgramModel program;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AudioState(media: $media, position: $position, duration: $duration, progress: $progress, sound: $sound, captionIndex: $captionIndex, program: $program)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AudioState'))
      ..add(DiagnosticsProperty('media', media))
      ..add(DiagnosticsProperty('position', position))
      ..add(DiagnosticsProperty('duration', duration))
      ..add(DiagnosticsProperty('progress', progress))
      ..add(DiagnosticsProperty('sound', sound))
      ..add(DiagnosticsProperty('captionIndex', captionIndex))
      ..add(DiagnosticsProperty('program', program));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AudioState &&
            (identical(other.media, media) ||
                const DeepCollectionEquality().equals(other.media, media)) &&
            (identical(other.position, position) ||
                const DeepCollectionEquality()
                    .equals(other.position, position)) &&
            (identical(other.duration, duration) ||
                const DeepCollectionEquality()
                    .equals(other.duration, duration)) &&
            (identical(other.progress, progress) ||
                const DeepCollectionEquality()
                    .equals(other.progress, progress)) &&
            (identical(other.sound, sound) ||
                const DeepCollectionEquality().equals(other.sound, sound)) &&
            (identical(other.captionIndex, captionIndex) ||
                const DeepCollectionEquality()
                    .equals(other.captionIndex, captionIndex)) &&
            (identical(other.program, program) ||
                const DeepCollectionEquality().equals(other.program, program)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(media) ^
      const DeepCollectionEquality().hash(position) ^
      const DeepCollectionEquality().hash(duration) ^
      const DeepCollectionEquality().hash(progress) ^
      const DeepCollectionEquality().hash(sound) ^
      const DeepCollectionEquality().hash(captionIndex) ^
      const DeepCollectionEquality().hash(program);

  @JsonKey(ignore: true)
  @override
  _$AudioStateCopyWith<_AudioState> get copyWith =>
      __$AudioStateCopyWithImpl<_AudioState>(this, _$identity);
}

abstract class _AudioState implements AudioState {
  factory _AudioState(
      {AudioPlayer media,
      Duration position,
      Duration duration,
      bool progress,
      bool sound,
      int captionIndex,
      ProgramModel program}) = _$_AudioState;

  @override
  AudioPlayer get media;
  @override
  Duration get position;
  @override
  Duration get duration;
  @override //    @Default(0) double max,
//    @Default(0) double rating,
//    @Default(AudioPlayerState.STOPPED) AudioPlayerState status,
  bool get progress;
  @override
  bool get sound;
  @override
  int get captionIndex;
  @override
  ProgramModel get program;
  @override
  @JsonKey(ignore: true)
  _$AudioStateCopyWith<_AudioState> get copyWith;
}
