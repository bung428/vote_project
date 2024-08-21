import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vote_project/util/timestamp_converter.dart';

part 'comment_in_model.freezed.dart';
part 'comment_in_model.g.dart';

@freezed
class CommentInModel with _$CommentInModel {
  factory CommentInModel({
    required String cid,
    required String uid,
    required String content,
    @TimestampConverter() required DateTime updatedAt,
  }) = _CommentInModel;

  factory CommentInModel.fromJson(Map<String, dynamic> json) => _$CommentInModelFromJson(json);
}