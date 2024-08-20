// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vote_entry_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VoteEntryModelImpl _$$VoteEntryModelImplFromJson(Map<String, dynamic> json) =>
    _$VoteEntryModelImpl(
      uid: json['uid'] as String,
      answerOptionId: (json['answerOptionId'] as num).toInt(),
    );

Map<String, dynamic> _$$VoteEntryModelImplToJson(
        _$VoteEntryModelImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'answerOptionId': instance.answerOptionId,
    };
