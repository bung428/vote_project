// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vote_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VoteDetailModelImpl _$$VoteDetailModelImplFromJson(
        Map<String, dynamic> json) =>
    _$VoteDetailModelImpl(
      id: json['id'] as String,
      content: json['content'] as String,
      image: json['image'] as String,
      answerCnt: (json['answerCnt'] as num).toInt(),
      genderCnt:
          GenderCountModel.fromJson(json['genderCnt'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$VoteDetailModelImplToJson(
        _$VoteDetailModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'image': instance.image,
      'answerCnt': instance.answerCnt,
      'genderCnt': instance.genderCnt,
    };
