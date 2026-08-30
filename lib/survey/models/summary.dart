import 'package:freezed_annotation/freezed_annotation.dart';

part 'summary.freezed.dart';
part 'summary.g.dart';

@freezed
sealed class SurveySummary with _$SurveySummary {
  const factory SurveySummary({
    @SummaryStatusConverter() required SummaryStatus status,
    required String summary,
    @JsonKey(name: 'choice_stats') required List<ChoiceStatModel> choiceStats,
    @JsonKey(name: 'number_stats') required List<NumberStatModel> numberStats,
    @JsonKey(name: 'text_themes') required List<TextThemeModel> textThemes,
    @JsonKey(name: 'total_responses') required int totalResponses,
    @JsonKey(name: 'processed_text_answers') required int processedTextAnswers,
    required bool sampled,
    @JsonKey(name: 'model_name') required String modelName,
    @JsonKey(name: 'prompt_version') required String promptVersion,
    @JsonKey(name: 'completed_at') required DateTime? completedAt,
  }) = _SurveySummary;

  factory SurveySummary.fromJson(Map<String, Object?> json) =>
      _$SurveySummaryFromJson(json);
}

enum SummaryStatus { pending, processing, completed, failed }

class SummaryStatusConverter implements JsonConverter<SummaryStatus, String> {
  const SummaryStatusConverter();

  @override
  SummaryStatus fromJson(String data) {
    switch (data.trim()) {
      case 'pending':
        return SummaryStatus.pending;
      case 'processing':
        return SummaryStatus.processing;
      case 'completed':
        return SummaryStatus.completed;
      case 'failed':
        return SummaryStatus.failed;
      default:
        return SummaryStatus.pending;
    }
  }

  @override
  String toJson(SummaryStatus object) {
    switch (object) {
      case SummaryStatus.pending:
        return 'pending';
      case SummaryStatus.processing:
        return 'processing';
      case SummaryStatus.completed:
        return 'completed';
      case SummaryStatus.failed:
        return 'failed';
    }
  }
}

@freezed
sealed class ChoiceStatModel with _$ChoiceStatModel {
  const factory ChoiceStatModel({
    @JsonKey(name: 'question_id') required int questionId,
    required String question,
    required String type,
    @JsonKey(name: 'total_answers') required int totalAnswers,
    required List<ChoiceModel> choices,
  }) = _ChoiceStatModel;

  factory ChoiceStatModel.fromJson(Map<String, Object?> json) =>
      _$ChoiceStatModelFromJson(json);
}

@freezed
sealed class ChoiceModel with _$ChoiceModel {
  const factory ChoiceModel({
    @JsonKey(name: 'choice_id') required int choiceId,
    required String text,
    required int count,
    required double percent,
  }) = _ChoiceModel;

  factory ChoiceModel.fromJson(Map<String, Object?> json) =>
      _$ChoiceModelFromJson(json);
}

@freezed
sealed class NumberStatModel with _$NumberStatModel {
  const factory NumberStatModel({
    @JsonKey(name: 'question_id') required int questionId,
    required String question,
    required int count,
    required double average,
    required double? min,
    required double? max,
  }) = _NumberStatModel;

  factory NumberStatModel.fromJson(Map<String, Object?> json) =>
      _$NumberStatModelFromJson(json);
}

@freezed
sealed class TextThemeModel with _$TextThemeModel {
  const factory TextThemeModel({
    @JsonKey(name: 'question_id') required int questionId,
    required String question,
    required String summary,
    @JsonKey(name: 'processed_answers') required int processedAnswers,
    required bool sampled,
    required List<ClusterModel> clusters,
  }) = _TextThemeModel;

  factory TextThemeModel.fromJson(Map<String, Object?> json) =>
      _$TextThemeModelFromJson(json);
}

@freezed
sealed class ClusterModel with _$ClusterModel {
  const factory ClusterModel({
    @JsonKey(name: 'cluster_id') required int clusterId,
    required String label,
    required int size,
    required String summary,
    @JsonKey(name: 'representative_texts')
    required List<String> representativeTexts,
  }) = _ClusterModel;

  factory ClusterModel.fromJson(Map<String, Object?> json) =>
      _$ClusterModelFromJson(json);
}
