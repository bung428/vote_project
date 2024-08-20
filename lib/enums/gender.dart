import 'package:flutter/material.dart';
import 'package:vote_project/models/ui/vote_gender_rate_model.dart';

enum Gender {
  male(Colors.blueAccent),
  female(Color(0xFFFF3B30)),
  ;

  final Color color;
  const Gender(this.color);
}

extension GenderExt on Gender {
  int getPercent(VoteGenderRateModel model) => switch(this) {
    Gender.male => model.malePercent,
    Gender.female => model.femalePercent,
  };
}