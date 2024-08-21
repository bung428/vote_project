// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment_in_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CommentInModel _$CommentInModelFromJson(Map<String, dynamic> json) {
  return _CommentInModel.fromJson(json);
}

/// @nodoc
mixin _$CommentInModel {
  String get cid => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommentInModelCopyWith<CommentInModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentInModelCopyWith<$Res> {
  factory $CommentInModelCopyWith(
          CommentInModel value, $Res Function(CommentInModel) then) =
      _$CommentInModelCopyWithImpl<$Res, CommentInModel>;
  @useResult
  $Res call(
      {String cid,
      String uid,
      String content,
      @TimestampConverter() DateTime updatedAt});
}

/// @nodoc
class _$CommentInModelCopyWithImpl<$Res, $Val extends CommentInModel>
    implements $CommentInModelCopyWith<$Res> {
  _$CommentInModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cid = null,
    Object? uid = null,
    Object? content = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      cid: null == cid
          ? _value.cid
          : cid // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommentInModelImplCopyWith<$Res>
    implements $CommentInModelCopyWith<$Res> {
  factory _$$CommentInModelImplCopyWith(_$CommentInModelImpl value,
          $Res Function(_$CommentInModelImpl) then) =
      __$$CommentInModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String cid,
      String uid,
      String content,
      @TimestampConverter() DateTime updatedAt});
}

/// @nodoc
class __$$CommentInModelImplCopyWithImpl<$Res>
    extends _$CommentInModelCopyWithImpl<$Res, _$CommentInModelImpl>
    implements _$$CommentInModelImplCopyWith<$Res> {
  __$$CommentInModelImplCopyWithImpl(
      _$CommentInModelImpl _value, $Res Function(_$CommentInModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cid = null,
    Object? uid = null,
    Object? content = null,
    Object? updatedAt = null,
  }) {
    return _then(_$CommentInModelImpl(
      cid: null == cid
          ? _value.cid
          : cid // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommentInModelImpl implements _CommentInModel {
  _$CommentInModelImpl(
      {required this.cid,
      required this.uid,
      required this.content,
      @TimestampConverter() required this.updatedAt});

  factory _$CommentInModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommentInModelImplFromJson(json);

  @override
  final String cid;
  @override
  final String uid;
  @override
  final String content;
  @override
  @TimestampConverter()
  final DateTime updatedAt;

  @override
  String toString() {
    return 'CommentInModel(cid: $cid, uid: $uid, content: $content, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommentInModelImpl &&
            (identical(other.cid, cid) || other.cid == cid) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, cid, uid, content, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CommentInModelImplCopyWith<_$CommentInModelImpl> get copyWith =>
      __$$CommentInModelImplCopyWithImpl<_$CommentInModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommentInModelImplToJson(
      this,
    );
  }
}

abstract class _CommentInModel implements CommentInModel {
  factory _CommentInModel(
          {required final String cid,
          required final String uid,
          required final String content,
          @TimestampConverter() required final DateTime updatedAt}) =
      _$CommentInModelImpl;

  factory _CommentInModel.fromJson(Map<String, dynamic> json) =
      _$CommentInModelImpl.fromJson;

  @override
  String get cid;
  @override
  String get uid;
  @override
  String get content;
  @override
  @TimestampConverter()
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$CommentInModelImplCopyWith<_$CommentInModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
