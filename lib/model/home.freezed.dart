// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'home.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$HomeMTearOff {
  const _$HomeMTearOff();

// ignore: unused_element
  _HomeM call({List<ProgramModel> programs = const []}) {
    return _HomeM(
      programs: programs,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $HomeM = _$HomeMTearOff();

/// @nodoc
mixin _$HomeM {
  List<ProgramModel> get programs;

  @JsonKey(ignore: true)
  $HomeMCopyWith<HomeM> get copyWith;
}

/// @nodoc
abstract class $HomeMCopyWith<$Res> {
  factory $HomeMCopyWith(HomeM value, $Res Function(HomeM) then) =
      _$HomeMCopyWithImpl<$Res>;
  $Res call({List<ProgramModel> programs});
}

/// @nodoc
class _$HomeMCopyWithImpl<$Res> implements $HomeMCopyWith<$Res> {
  _$HomeMCopyWithImpl(this._value, this._then);

  final HomeM _value;
  // ignore: unused_field
  final $Res Function(HomeM) _then;

  @override
  $Res call({
    Object programs = freezed,
  }) {
    return _then(_value.copyWith(
      programs: programs == freezed
          ? _value.programs
          : programs as List<ProgramModel>,
    ));
  }
}

/// @nodoc
abstract class _$HomeMCopyWith<$Res> implements $HomeMCopyWith<$Res> {
  factory _$HomeMCopyWith(_HomeM value, $Res Function(_HomeM) then) =
      __$HomeMCopyWithImpl<$Res>;
  @override
  $Res call({List<ProgramModel> programs});
}

/// @nodoc
class __$HomeMCopyWithImpl<$Res> extends _$HomeMCopyWithImpl<$Res>
    implements _$HomeMCopyWith<$Res> {
  __$HomeMCopyWithImpl(_HomeM _value, $Res Function(_HomeM) _then)
      : super(_value, (v) => _then(v as _HomeM));

  @override
  _HomeM get _value => super._value as _HomeM;

  @override
  $Res call({
    Object programs = freezed,
  }) {
    return _then(_HomeM(
      programs: programs == freezed
          ? _value.programs
          : programs as List<ProgramModel>,
    ));
  }
}

/// @nodoc
class _$_HomeM with DiagnosticableTreeMixin implements _HomeM {
  _$_HomeM({this.programs = const []}) : assert(programs != null);

  @JsonKey(defaultValue: const [])
  @override
  final List<ProgramModel> programs;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'HomeM(programs: $programs)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'HomeM'))
      ..add(DiagnosticsProperty('programs', programs));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _HomeM &&
            (identical(other.programs, programs) ||
                const DeepCollectionEquality()
                    .equals(other.programs, programs)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(programs);

  @JsonKey(ignore: true)
  @override
  _$HomeMCopyWith<_HomeM> get copyWith =>
      __$HomeMCopyWithImpl<_HomeM>(this, _$identity);
}

abstract class _HomeM implements HomeM {
  factory _HomeM({List<ProgramModel> programs}) = _$_HomeM;

  @override
  List<ProgramModel> get programs;
  @override
  @JsonKey(ignore: true)
  _$HomeMCopyWith<_HomeM> get copyWith;
}
