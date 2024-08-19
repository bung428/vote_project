// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gender_count_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GenderCountModelImpl _$$GenderCountModelImplFromJson(
        Map<String, dynamic> json) =>
    _$GenderCountModelImpl(
      male: (json['male'] as num).toInt(),
      female: (json['female'] as num).toInt(),
    );

Map<String, dynamic> _$$GenderCountModelImplToJson(
        _$GenderCountModelImpl instance) =>
    <String, dynamic>{
      'male': instance.male,
      'female': instance.female,
    };
