// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vote_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VoteModel _$VoteModelFromJson(Map<String, dynamic> json) {
  return _VoteModel.fromJson(json);
}

/// @nodoc
mixin _$VoteModel {
  String get id => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  int get answerCnt => throw _privateConstructorUsedError;
  int get likeCnt => throw _privateConstructorUsedError;
  int get commentCnt => throw _privateConstructorUsedError;
  bool get hasLiked => throw _privateConstructorUsedError;
  String get answerOptionId => throw _privateConstructorUsedError;
  List<VoteDetailModel> get options => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VoteModelCopyWith<VoteModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VoteModelCopyWith<$Res> {
  factory $VoteModelCopyWith(VoteModel value, $Res Function(VoteModel) then) =
      _$VoteModelCopyWithImpl<$Res, VoteModel>;
  @useResult
  $Res call(
      {String id,
      String content,
      int answerCnt,
      int likeCnt,
      int commentCnt,
      bool hasLiked,
      String answerOptionId,
      List<VoteDetailModel> options});
}

/// @nodoc
class _$VoteModelCopyWithImpl<$Res, $Val extends VoteModel>
    implements $VoteModelCopyWith<$Res> {
  _$VoteModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? answerCnt = null,
    Object? likeCnt = null,
    Object? commentCnt = null,
    Object? hasLiked = null,
    Object? answerOptionId = null,
    Object? options = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      answerCnt: null == answerCnt
          ? _value.answerCnt
          : answerCnt // ignore: cast_nullable_to_non_nullable
              as int,
      likeCnt: null == likeCnt
          ? _value.likeCnt
          : likeCnt // ignore: cast_nullable_to_non_nullable
              as int,
      commentCnt: null == commentCnt
          ? _value.commentCnt
          : commentCnt // ignore: cast_nullable_to_non_nullable
              as int,
      hasLiked: null == hasLiked
          ? _value.hasLiked
          : hasLiked // ignore: cast_nullable_to_non_nullable
              as bool,
      answerOptionId: null == answerOptionId
          ? _value.answerOptionId
          : answerOptionId // ignore: cast_nullable_to_non_nullable
              as String,
      options: null == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as List<VoteDetailModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VoteModelImplCopyWith<$Res>
    implements $VoteModelCopyWith<$Res> {
  factory _$$VoteModelImplCopyWith(
          _$VoteModelImpl value, $Res Function(_$VoteModelImpl) then) =
      __$$VoteModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String content,
      int answerCnt,
      int likeCnt,
      int commentCnt,
      bool hasLiked,
      String answerOptionId,
      List<VoteDetailModel> options});
}

/// @nodoc
class __$$VoteModelImplCopyWithImpl<$Res>
    extends _$VoteModelCopyWithImpl<$Res, _$VoteModelImpl>
    implements _$$VoteModelImplCopyWith<$Res> {
  __$$VoteModelImplCopyWithImpl(
      _$VoteModelImpl _value, $Res Function(_$VoteModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? answerCnt = null,
    Object? likeCnt = null,
    Object? commentCnt = null,
    Object? hasLiked = null,
    Object? answerOptionId = null,
    Object? options = null,
  }) {
    return _then(_$VoteModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      answerCnt: null == answerCnt
          ? _value.answerCnt
          : answerCnt // ignore: cast_nullable_to_non_nullable
              as int,
      likeCnt: null == likeCnt
          ? _value.likeCnt
          : likeCnt // ignore: cast_nullable_to_non_nullable
              as int,
      commentCnt: null == commentCnt
          ? _value.commentCnt
          : commentCnt // ignore: cast_nullable_to_non_nullable
              as int,
      hasLiked: null == hasLiked
          ? _value.hasLiked
          : hasLiked // ignore: cast_nullable_to_non_nullable
              as bool,
      answerOptionId: null == answerOptionId
          ? _value.answerOptionId
          : answerOptionId // ignore: cast_nullable_to_non_nullable
              as String,
      options: null == options
          ? _value._options
          : options // ignore: cast_nullable_to_non_nullable
              as List<VoteDetailModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VoteModelImpl implements _VoteModel {
  _$VoteModelImpl(
      {required this.id,
      required this.content,
      required this.answerCnt,
      required this.likeCnt,
      required this.commentCnt,
      required this.hasLiked,
      required this.answerOptionId,
      required final List<VoteDetailModel> options})
      : _options = options;

  factory _$VoteModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$VoteModelImplFromJson(json);

  @override
  final String id;
  @override
  final String content;
  @override
  final int answerCnt;
  @override
  final int likeCnt;
  @override
  final int commentCnt;
  @override
  final bool hasLiked;
  @override
  final String answerOptionId;
  final List<VoteDetailModel> _options;
  @override
  List<VoteDetailModel> get options {
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_options);
  }

  @override
  String toString() {
    return 'VoteModel(id: $id, content: $content, answerCnt: $answerCnt, likeCnt: $likeCnt, commentCnt: $commentCnt, hasLiked: $hasLiked, answerOptionId: $answerOptionId, options: $options)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VoteModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.answerCnt, answerCnt) ||
                other.answerCnt == answerCnt) &&
            (identical(other.likeCnt, likeCnt) || other.likeCnt == likeCnt) &&
            (identical(other.commentCnt, commentCnt) ||
                other.commentCnt == commentCnt) &&
            (identical(other.hasLiked, hasLiked) ||
                other.hasLiked == hasLiked) &&
            (identical(other.answerOptionId, answerOptionId) ||
                other.answerOptionId == answerOptionId) &&
            const DeepCollectionEquality().equals(other._options, _options));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      content,
      answerCnt,
      likeCnt,
      commentCnt,
      hasLiked,
      answerOptionId,
      const DeepCollectionEquality().hash(_options));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VoteModelImplCopyWith<_$VoteModelImpl> get copyWith =>
      __$$VoteModelImplCopyWithImpl<_$VoteModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VoteModelImplToJson(
      this,
    );
  }
}

abstract class _VoteModel implements VoteModel {
  factory _VoteModel(
      {required final String id,
      required final String content,
      required final int answerCnt,
      required final int likeCnt,
      required final int commentCnt,
      required final bool hasLiked,
      required final String answerOptionId,
      required final List<VoteDetailModel> options}) = _$VoteModelImpl;

  factory _VoteModel.fromJson(Map<String, dynamic> json) =
      _$VoteModelImpl.fromJson;

  @override
  String get id;
  @override
  String get content;
  @override
  int get answerCnt;
  @override
  int get likeCnt;
  @override
  int get commentCnt;
  @override
  bool get hasLiked;
  @override
  String get answerOptionId;
  @override
  List<VoteDetailModel> get options;
  @override
  @JsonKey(ignore: true)
  _$$VoteModelImplCopyWith<_$VoteModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
