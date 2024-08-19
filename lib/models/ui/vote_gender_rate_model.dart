class VoteGenderRateModel {
  final String id;
  final String content;
  final String image;
  final int malePercent;
  final int femalePercent;

  VoteGenderRateModel({
    required this.id,
    required this.content,
    required this.image,
    required this.malePercent,
    required this.femalePercent
  });
}