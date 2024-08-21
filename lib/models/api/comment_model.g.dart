// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommentModelImpl _$$CommentModelImplFromJson(Map json) => _$CommentModelImpl(
      uid: json['uid'] as String,
      content: json['content'] as String,
      updatedAt:
          const TimestampConverter().fromJson(json['updatedAt'] as Timestamp),
    );

Map<String, dynamic> _$$CommentModelImplToJson(_$CommentModelImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'content': instance.content,
      'updatedAt': const TimestampConverter().toJson(instance.updatedAt),
    };
