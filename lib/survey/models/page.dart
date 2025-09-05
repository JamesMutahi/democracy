import 'package:democracy/survey/models/question.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'page.freezed.dart';
part 'page.g.dart';

@freezed
sealed class Page with _$Page {
  const factory Page({
    required final int id,
    required int survey,
    required final int number,
    required List<Question> questions,
  }) = _Page;

  factory Page.fromJson(Map<String, Object?> json) => _$PageFromJson(json);
}
