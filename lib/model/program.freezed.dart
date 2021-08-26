// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'program.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$ProgramModelTearOff {
  const _$ProgramModelTearOff();

// ignore: unused_element
  _ProgramModel call(
      {String title = '',
      String author = '',
      String imagePath = '',
      List<String> content = null,
      String mediaPath = ''}) {
    return _ProgramModel(
      title: title,
      author: author,
      imagePath: imagePath,
      content: content,
      mediaPath: mediaPath,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $ProgramModel = _$ProgramModelTearOff();

/// @nodoc
mixin _$ProgramModel {
  String get title;
  String get author;
  String get imagePath;
  List<String> get content;
  String get mediaPath;

  @JsonKey(ignore: true)
  $ProgramModelCopyWith<ProgramModel> get copyWith;
}

/// @nodoc
abstract class $ProgramModelCopyWith<$Res> {
  factory $ProgramModelCopyWith(
          ProgramModel value, $Res Function(ProgramModel) then) =
      _$ProgramModelCopyWithImpl<$Res>;
  $Res call(
      {String title,
      String author,
      String imagePath,
      List<String> content,
      String mediaPath});
}

/// @nodoc
class _$ProgramModelCopyWithImpl<$Res> implements $ProgramModelCopyWith<$Res> {
  _$ProgramModelCopyWithImpl(this._value, this._then);

  final ProgramModel _value;
  // ignore: unused_field
  final $Res Function(ProgramModel) _then;

  @override
  $Res call({
    Object title = freezed,
    Object author = freezed,
    Object imagePath = freezed,
    Object content = freezed,
    Object mediaPath = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed ? _value.title : title as String,
      author: author == freezed ? _value.author : author as String,
      imagePath: imagePath == freezed ? _value.imagePath : imagePath as String,
      content: content == freezed ? _value.content : content as List<String>,
      mediaPath: mediaPath == freezed ? _value.mediaPath : mediaPath as String,
    ));
  }
}

/// @nodoc
abstract class _$ProgramModelCopyWith<$Res>
    implements $ProgramModelCopyWith<$Res> {
  factory _$ProgramModelCopyWith(
          _ProgramModel value, $Res Function(_ProgramModel) then) =
      __$ProgramModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {String title,
      String author,
      String imagePath,
      List<String> content,
      String mediaPath});
}

/// @nodoc
class __$ProgramModelCopyWithImpl<$Res> extends _$ProgramModelCopyWithImpl<$Res>
    implements _$ProgramModelCopyWith<$Res> {
  __$ProgramModelCopyWithImpl(
      _ProgramModel _value, $Res Function(_ProgramModel) _then)
      : super(_value, (v) => _then(v as _ProgramModel));

  @override
  _ProgramModel get _value => super._value as _ProgramModel;

  @override
  $Res call({
    Object title = freezed,
    Object author = freezed,
    Object imagePath = freezed,
    Object content = freezed,
    Object mediaPath = freezed,
  }) {
    return _then(_ProgramModel(
      title: title == freezed ? _value.title : title as String,
      author: author == freezed ? _value.author : author as String,
      imagePath: imagePath == freezed ? _value.imagePath : imagePath as String,
      content: content == freezed ? _value.content : content as List<String>,
      mediaPath: mediaPath == freezed ? _value.mediaPath : mediaPath as String,
    ));
  }
}

/// @nodoc
class _$_ProgramModel with DiagnosticableTreeMixin implements _ProgramModel {
  _$_ProgramModel(
      {this.title = '',
      this.author = '',
      this.imagePath = '',
      this.content = null,
      this.mediaPath = ''})
      : assert(title != null),
        assert(author != null),
        assert(imagePath != null),
        assert(content != null),
        assert(mediaPath != null);

  @JsonKey(defaultValue: '')
  @override
  final String title;
  @JsonKey(defaultValue: '')
  @override
  final String author;
  @JsonKey(defaultValue: '')
  @override
  final String imagePath;
  @JsonKey(defaultValue: null)
  @override
  final List<String> content;
  @JsonKey(defaultValue: '')
  @override
  final String mediaPath;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProgramModel(title: $title, author: $author, imagePath: $imagePath, content: $content, mediaPath: $mediaPath)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ProgramModel'))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('author', author))
      ..add(DiagnosticsProperty('imagePath', imagePath))
      ..add(DiagnosticsProperty('content', content))
      ..add(DiagnosticsProperty('mediaPath', mediaPath));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ProgramModel &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.author, author) ||
                const DeepCollectionEquality().equals(other.author, author)) &&
            (identical(other.imagePath, imagePath) ||
                const DeepCollectionEquality()
                    .equals(other.imagePath, imagePath)) &&
            (identical(other.content, content) ||
                const DeepCollectionEquality()
                    .equals(other.content, content)) &&
            (identical(other.mediaPath, mediaPath) ||
                const DeepCollectionEquality()
                    .equals(other.mediaPath, mediaPath)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(author) ^
      const DeepCollectionEquality().hash(imagePath) ^
      const DeepCollectionEquality().hash(content) ^
      const DeepCollectionEquality().hash(mediaPath);

  @JsonKey(ignore: true)
  @override
  _$ProgramModelCopyWith<_ProgramModel> get copyWith =>
      __$ProgramModelCopyWithImpl<_ProgramModel>(this, _$identity);
}

abstract class _ProgramModel implements ProgramModel {
  factory _ProgramModel(
      {String title,
      String author,
      String imagePath,
      List<String> content,
      String mediaPath}) = _$_ProgramModel;

  @override
  String get title;
  @override
  String get author;
  @override
  String get imagePath;
  @override
  List<String> get content;
  @override
  String get mediaPath;
  @override
  @JsonKey(ignore: true)
  _$ProgramModelCopyWith<_ProgramModel> get copyWith;
}
