// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vote_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VoteModelImpl _$$VoteModelImplFromJson(Map<String, dynamic> json) =>
    _$VoteModelImpl(
      id: json['id'] as String,
      content: json['content'] as String,
      answerCnt: (json['answerCnt'] as num).toInt(),
      likeCnt: (json['likeCnt'] as num).toInt(),
      commentCnt: (json['commentCnt'] as num).toInt(),
      voteLiked: (json['voteLiked'] as List<dynamic>?)
          ?.map((e) => VoteLikeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      voteEntries: (json['voteEntries'] as List<dynamic>?)
          ?.map((e) => VoteEntryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      options: (json['options'] as List<dynamic>)
          .map((e) => VoteDetailModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$VoteModelImplToJson(_$VoteModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'answerCnt': instance.answerCnt,
      'likeCnt': instance.likeCnt,
      'commentCnt': instance.commentCnt,
      'voteLiked': instance.voteLiked,
      'voteEntries': instance.voteEntries,
      'options': instance.options,
    };
