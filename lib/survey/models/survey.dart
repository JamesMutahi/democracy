import 'package:democracy/geo/models/constituency.dart';
import 'package:democracy/geo/models/county.dart';
import 'package:democracy/geo/models/ward.dart';
import 'package:democracy/survey/models/page.dart';
import 'package:democracy/survey/models/response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'survey.freezed.dart';
part 'survey.g.dart';

@freezed
sealed class Survey with _$Survey {
  const factory Survey({
    required final int id,
    required String title,
    required String description,
    required County? county,
    required Constituency? constituency,
    required Ward? ward,
    @JsonKey(name: 'start_time') required DateTime startTime,
    @JsonKey(name: 'end_time') required DateTime endTime,
    @JsonKey(name: 'is_active') required bool isActive,
    required List<Page> pages,
    required Response? response,
    @JsonKey(name: 'total_responses') required int totalResponses,
  }) = _Survey;

  factory Survey.fromJson(Map<String, Object?> json) => _$SurveyFromJson(json);
}
