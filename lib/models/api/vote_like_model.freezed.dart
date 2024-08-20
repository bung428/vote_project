// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vote_like_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VoteLikeModel _$VoteLikeModelFromJson(Map<String, dynamic> json) {
  return _VoteLikeModel.fromJson(json);
}

/// @nodoc
mixin _$VoteLikeModel {
  String get uid => throw _privateConstructorUsedError;
  bool get hasLiked => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VoteLikeModelCopyWith<VoteLikeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VoteLikeModelCopyWith<$Res> {
  factory $VoteLikeModelCopyWith(
          VoteLikeModel value, $Res Function(VoteLikeModel) then) =
      _$VoteLikeModelCopyWithImpl<$Res, VoteLikeModel>;
  @useResult
  $Res call({String uid, bool hasLiked});
}

/// @nodoc
class _$VoteLikeModelCopyWithImpl<$Res, $Val extends VoteLikeModel>
    implements $VoteLikeModelCopyWith<$Res> {
  _$VoteLikeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? hasLiked = null,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      hasLiked: null == hasLiked
          ? _value.hasLiked
          : hasLiked // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VoteLikeModelImplCopyWith<$Res>
    implements $VoteLikeModelCopyWith<$Res> {
  factory _$$VoteLikeModelImplCopyWith(
          _$VoteLikeModelImpl value, $Res Function(_$VoteLikeModelImpl) then) =
      __$$VoteLikeModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String uid, bool hasLiked});
}

/// @nodoc
class __$$VoteLikeModelImplCopyWithImpl<$Res>
    extends _$VoteLikeModelCopyWithImpl<$Res, _$VoteLikeModelImpl>
    implements _$$VoteLikeModelImplCopyWith<$Res> {
  __$$VoteLikeModelImplCopyWithImpl(
      _$VoteLikeModelImpl _value, $Res Function(_$VoteLikeModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? hasLiked = null,
  }) {
    return _then(_$VoteLikeModelImpl(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      hasLiked: null == hasLiked
          ? _value.hasLiked
          : hasLiked // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VoteLikeModelImpl implements _VoteLikeModel {
  _$VoteLikeModelImpl({required this.uid, required this.hasLiked});

  factory _$VoteLikeModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$VoteLikeModelImplFromJson(json);

  @override
  final String uid;
  @override
  final bool hasLiked;

  @override
  String toString() {
    return 'VoteLikeModel(uid: $uid, hasLiked: $hasLiked)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VoteLikeModelImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.hasLiked, hasLiked) ||
                other.hasLiked == hasLiked));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, uid, hasLiked);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VoteLikeModelImplCopyWith<_$VoteLikeModelImpl> get copyWith =>
      __$$VoteLikeModelImplCopyWithImpl<_$VoteLikeModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VoteLikeModelImplToJson(
      this,
    );
  }
}

abstract class _VoteLikeModel implements VoteLikeModel {
  factory _VoteLikeModel(
      {required final String uid,
      required final bool hasLiked}) = _$VoteLikeModelImpl;

  factory _VoteLikeModel.fromJson(Map<String, dynamic> json) =
      _$VoteLikeModelImpl.fromJson;

  @override
  String get uid;
  @override
  bool get hasLiked;
  @override
  @JsonKey(ignore: true)
  _$$VoteLikeModelImplCopyWith<_$VoteLikeModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
