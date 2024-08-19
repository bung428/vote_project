import 'package:freezed_annotation/freezed_annotation.dart';

part 'gender_count_model.freezed.dart';
part 'gender_count_model.g.dart';

@freezed
class GenderCountModel with _$GenderCountModel {
  factory GenderCountModel({
    required int male,
    required int female,
  }) = _GenderCountModel;

  factory GenderCountModel.fromJson(Map<String, dynamic> json) => _$GenderCountModelFromJson(json);
}