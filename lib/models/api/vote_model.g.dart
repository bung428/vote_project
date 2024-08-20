// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vote_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VoteModelImpl _$$VoteModelImplFromJson(Map json) => _$VoteModelImpl(
      id: json['id'] as String,
      ownerUid: json['ownerUid'] as String,
      content: json['content'] as String,
      answerCnt: (json['answerCnt'] as num).toInt(),
      likeCnt: (json['likeCnt'] as num).toInt(),
      commentCnt: (json['commentCnt'] as num).toInt(),
      voteLiked: (json['voteLiked'] as List<dynamic>?)
          ?.map((e) =>
              VoteLikeModel.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      voteEntries: (json['voteEntries'] as List<dynamic>?)
          ?.map((e) =>
              VoteEntryModel.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      options: (json['options'] as List<dynamic>)
          .map((e) =>
              VoteDetailModel.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp),
    );

Map<String, dynamic> _$$VoteModelImplToJson(_$VoteModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ownerUid': instance.ownerUid,
      'content': instance.content,
      'answerCnt': instance.answerCnt,
      'likeCnt': instance.likeCnt,
      'commentCnt': instance.commentCnt,
      'voteLiked': instance.voteLiked?.map((e) => e.toJson()).toList(),
      'voteEntries': instance.voteEntries?.map((e) => e.toJson()).toList(),
      'options': instance.options.map((e) => e.toJson()).toList(),
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
    };
