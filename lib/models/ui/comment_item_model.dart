import 'package:intl/intl.dart';

class CommentItemModel {
  final String id;
  final String uid;
  final String content;
  final DateTime updatedAt;
  List<CommentItemModel>? commentInComment;

  CommentItemModel({
    required this.id,
    required this.uid,
    required this.content,
    required this.updatedAt,
    this.commentInComment,
  });

  String get updatedAtStr => DateFormat('yy.MM.dd').format(updatedAt);
}