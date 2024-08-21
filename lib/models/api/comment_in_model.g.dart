// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_in_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommentInModelImpl _$$CommentInModelImplFromJson(Map json) =>
    _$CommentInModelImpl(
      cid: json['cid'] as String,
      uid: json['uid'] as String,
      content: json['content'] as String,
      updatedAt:
          const TimestampConverter().fromJson(json['updatedAt'] as Timestamp),
    );

Map<String, dynamic> _$$CommentInModelImplToJson(
        _$CommentInModelImpl instance) =>
    <String, dynamic>{
      'cid': instance.cid,
      'uid': instance.uid,
      'content': instance.content,
      'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
    };
