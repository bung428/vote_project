// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vote_entry_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VoteEntryModel _$VoteEntryModelFromJson(Map<String, dynamic> json) {
  return _VoteEntryModel.fromJson(json);
}

/// @nodoc
mixin _$VoteEntryModel {
  String get uid => throw _privateConstructorUsedError;
  int get answerOptionId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VoteEntryModelCopyWith<VoteEntryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VoteEntryModelCopyWith<$Res> {
  factory $VoteEntryModelCopyWith(
          VoteEntryModel value, $Res Function(VoteEntryModel) then) =
      _$VoteEntryModelCopyWithImpl<$Res, VoteEntryModel>;
  @useResult
  $Res call({String uid, int answerOptionId});
}

/// @nodoc
class _$VoteEntryModelCopyWithImpl<$Res, $Val extends VoteEntryModel>
    implements $VoteEntryModelCopyWith<$Res> {
  _$VoteEntryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? answerOptionId = null,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      answerOptionId: null == answerOptionId
          ? _value.answerOptionId
          : answerOptionId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VoteEntryModelImplCopyWith<$Res>
    implements $VoteEntryModelCopyWith<$Res> {
  factory _$$VoteEntryModelImplCopyWith(_$VoteEntryModelImpl value,
          $Res Function(_$VoteEntryModelImpl) then) =
      __$$VoteEntryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String uid, int answerOptionId});
}

/// @nodoc
class __$$VoteEntryModelImplCopyWithImpl<$Res>
    extends _$VoteEntryModelCopyWithImpl<$Res, _$VoteEntryModelImpl>
    implements _$$VoteEntryModelImplCopyWith<$Res> {
  __$$VoteEntryModelImplCopyWithImpl(
      _$VoteEntryModelImpl _value, $Res Function(_$VoteEntryModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? answerOptionId = null,
  }) {
    return _then(_$VoteEntryModelImpl(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      answerOptionId: null == answerOptionId
          ? _value.answerOptionId
          : answerOptionId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VoteEntryModelImpl implements _VoteEntryModel {
  _$VoteEntryModelImpl({required this.uid, required this.answerOptionId});

  factory _$VoteEntryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$VoteEntryModelImplFromJson(json);

  @override
  final String uid;
  @override
  final int answerOptionId;

  @override
  String toString() {
    return 'VoteEntryModel(uid: $uid, answerOptionId: $answerOptionId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VoteEntryModelImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.answerOptionId, answerOptionId) ||
                other.answerOptionId == answerOptionId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, uid, answerOptionId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VoteEntryModelImplCopyWith<_$VoteEntryModelImpl> get copyWith =>
      __$$VoteEntryModelImplCopyWithImpl<_$VoteEntryModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VoteEntryModelImplToJson(
      this,
    );
  }
}

abstract class _VoteEntryModel implements VoteEntryModel {
  factory _VoteEntryModel(
      {required final String uid,
      required final int answerOptionId}) = _$VoteEntryModelImpl;

  factory _VoteEntryModel.fromJson(Map<String, dynamic> json) =
      _$VoteEntryModelImpl.fromJson;

  @override
  String get uid;
  @override
  int get answerOptionId;
  @override
  @JsonKey(ignore: true)
  _$$VoteEntryModelImplCopyWith<_$VoteEntryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
