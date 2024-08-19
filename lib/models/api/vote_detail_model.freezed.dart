// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vote_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VoteDetailModel _$VoteDetailModelFromJson(Map<String, dynamic> json) {
  return _VoteDetailModel.fromJson(json);
}

/// @nodoc
mixin _$VoteDetailModel {
  String get id => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  int get answerCnt => throw _privateConstructorUsedError;
  GenderCountModel get genderCnt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VoteDetailModelCopyWith<VoteDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VoteDetailModelCopyWith<$Res> {
  factory $VoteDetailModelCopyWith(
          VoteDetailModel value, $Res Function(VoteDetailModel) then) =
      _$VoteDetailModelCopyWithImpl<$Res, VoteDetailModel>;
  @useResult
  $Res call(
      {String id,
      String content,
      String image,
      int answerCnt,
      GenderCountModel genderCnt});

  $GenderCountModelCopyWith<$Res> get genderCnt;
}

/// @nodoc
class _$VoteDetailModelCopyWithImpl<$Res, $Val extends VoteDetailModel>
    implements $VoteDetailModelCopyWith<$Res> {
  _$VoteDetailModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? image = null,
    Object? answerCnt = null,
    Object? genderCnt = null,
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
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      answerCnt: null == answerCnt
          ? _value.answerCnt
          : answerCnt // ignore: cast_nullable_to_non_nullable
              as int,
      genderCnt: null == genderCnt
          ? _value.genderCnt
          : genderCnt // ignore: cast_nullable_to_non_nullable
              as GenderCountModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GenderCountModelCopyWith<$Res> get genderCnt {
    return $GenderCountModelCopyWith<$Res>(_value.genderCnt, (value) {
      return _then(_value.copyWith(genderCnt: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VoteDetailModelImplCopyWith<$Res>
    implements $VoteDetailModelCopyWith<$Res> {
  factory _$$VoteDetailModelImplCopyWith(_$VoteDetailModelImpl value,
          $Res Function(_$VoteDetailModelImpl) then) =
      __$$VoteDetailModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String content,
      String image,
      int answerCnt,
      GenderCountModel genderCnt});

  @override
  $GenderCountModelCopyWith<$Res> get genderCnt;
}

/// @nodoc
class __$$VoteDetailModelImplCopyWithImpl<$Res>
    extends _$VoteDetailModelCopyWithImpl<$Res, _$VoteDetailModelImpl>
    implements _$$VoteDetailModelImplCopyWith<$Res> {
  __$$VoteDetailModelImplCopyWithImpl(
      _$VoteDetailModelImpl _value, $Res Function(_$VoteDetailModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? content = null,
    Object? image = null,
    Object? answerCnt = null,
    Object? genderCnt = null,
  }) {
    return _then(_$VoteDetailModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      answerCnt: null == answerCnt
          ? _value.answerCnt
          : answerCnt // ignore: cast_nullable_to_non_nullable
              as int,
      genderCnt: null == genderCnt
          ? _value.genderCnt
          : genderCnt // ignore: cast_nullable_to_non_nullable
              as GenderCountModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VoteDetailModelImpl implements _VoteDetailModel {
  _$VoteDetailModelImpl(
      {required this.id,
      required this.content,
      required this.image,
      required this.answerCnt,
      required this.genderCnt});

  factory _$VoteDetailModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$VoteDetailModelImplFromJson(json);

  @override
  final String id;
  @override
  final String content;
  @override
  final String image;
  @override
  final int answerCnt;
  @override
  final GenderCountModel genderCnt;

  @override
  String toString() {
    return 'VoteDetailModel(id: $id, content: $content, image: $image, answerCnt: $answerCnt, genderCnt: $genderCnt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VoteDetailModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.answerCnt, answerCnt) ||
                other.answerCnt == answerCnt) &&
            (identical(other.genderCnt, genderCnt) ||
                other.genderCnt == genderCnt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, content, image, answerCnt, genderCnt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VoteDetailModelImplCopyWith<_$VoteDetailModelImpl> get copyWith =>
      __$$VoteDetailModelImplCopyWithImpl<_$VoteDetailModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VoteDetailModelImplToJson(
      this,
    );
  }
}

abstract class _VoteDetailModel implements VoteDetailModel {
  factory _VoteDetailModel(
      {required final String id,
      required final String content,
      required final String image,
      required final int answerCnt,
      required final GenderCountModel genderCnt}) = _$VoteDetailModelImpl;

  factory _VoteDetailModel.fromJson(Map<String, dynamic> json) =
      _$VoteDetailModelImpl.fromJson;

  @override
  String get id;
  @override
  String get content;
  @override
  String get image;
  @override
  int get answerCnt;
  @override
  GenderCountModel get genderCnt;
  @override
  @JsonKey(ignore: true)
  _$$VoteDetailModelImplCopyWith<_$VoteDetailModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
