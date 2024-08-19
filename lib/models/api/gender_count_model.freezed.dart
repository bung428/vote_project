// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gender_count_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GenderCountModel _$GenderCountModelFromJson(Map<String, dynamic> json) {
  return _GenderCountModel.fromJson(json);
}

/// @nodoc
mixin _$GenderCountModel {
  int get male => throw _privateConstructorUsedError;
  int get female => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GenderCountModelCopyWith<GenderCountModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenderCountModelCopyWith<$Res> {
  factory $GenderCountModelCopyWith(
          GenderCountModel value, $Res Function(GenderCountModel) then) =
      _$GenderCountModelCopyWithImpl<$Res, GenderCountModel>;
  @useResult
  $Res call({int male, int female});
}

/// @nodoc
class _$GenderCountModelCopyWithImpl<$Res, $Val extends GenderCountModel>
    implements $GenderCountModelCopyWith<$Res> {
  _$GenderCountModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? male = null,
    Object? female = null,
  }) {
    return _then(_value.copyWith(
      male: null == male
          ? _value.male
          : male // ignore: cast_nullable_to_non_nullable
              as int,
      female: null == female
          ? _value.female
          : female // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GenderCountModelImplCopyWith<$Res>
    implements $GenderCountModelCopyWith<$Res> {
  factory _$$GenderCountModelImplCopyWith(_$GenderCountModelImpl value,
          $Res Function(_$GenderCountModelImpl) then) =
      __$$GenderCountModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int male, int female});
}

/// @nodoc
class __$$GenderCountModelImplCopyWithImpl<$Res>
    extends _$GenderCountModelCopyWithImpl<$Res, _$GenderCountModelImpl>
    implements _$$GenderCountModelImplCopyWith<$Res> {
  __$$GenderCountModelImplCopyWithImpl(_$GenderCountModelImpl _value,
      $Res Function(_$GenderCountModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? male = null,
    Object? female = null,
  }) {
    return _then(_$GenderCountModelImpl(
      male: null == male
          ? _value.male
          : male // ignore: cast_nullable_to_non_nullable
              as int,
      female: null == female
          ? _value.female
          : female // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GenderCountModelImpl implements _GenderCountModel {
  _$GenderCountModelImpl({required this.male, required this.female});

  factory _$GenderCountModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GenderCountModelImplFromJson(json);

  @override
  final int male;
  @override
  final int female;

  @override
  String toString() {
    return 'GenderCountModel(male: $male, female: $female)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenderCountModelImpl &&
            (identical(other.male, male) || other.male == male) &&
            (identical(other.female, female) || other.female == female));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, male, female);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GenderCountModelImplCopyWith<_$GenderCountModelImpl> get copyWith =>
      __$$GenderCountModelImplCopyWithImpl<_$GenderCountModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GenderCountModelImplToJson(
      this,
    );
  }
}

abstract class _GenderCountModel implements GenderCountModel {
  factory _GenderCountModel(
      {required final int male,
      required final int female}) = _$GenderCountModelImpl;

  factory _GenderCountModel.fromJson(Map<String, dynamic> json) =
      _$GenderCountModelImpl.fromJson;

  @override
  int get male;
  @override
  int get female;
  @override
  @JsonKey(ignore: true)
  _$$GenderCountModelImplCopyWith<_$GenderCountModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
