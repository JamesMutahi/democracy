import 'package:freezed_annotation/freezed_annotation.dart';

part 'summary.freezed.dart';
part 'summary.g.dart';

@freezed
sealed class BallotSummary with _$BallotSummary {
  const factory BallotSummary({
    @SummaryStatusConverter() required SummaryStatus status,
    @Default('') String summary,
    @Default([]) List<BallotThemeModel> themes,
    @JsonKey(name: 'option_themes')
    @Default([])
    List<BallotOptionThemeModel> optionThemes,
    @JsonKey(name: 'reasons_total') @Default(0) int reasonsTotal,
    @JsonKey(name: 'reasons_processed') @Default(0) int reasonsProcessed,
    String? method,
  }) = _BallotSummary;

  factory BallotSummary.fromJson(Map<String, Object?> json) =>
      _$BallotSummaryFromJson(json);
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
sealed class BallotOptionThemeModel with _$BallotOptionThemeModel {
  const factory BallotOptionThemeModel({
    required String option,
    @Default([]) List<BallotThemeModel> themes,
  }) = _BallotOptionThemeModel;

  factory BallotOptionThemeModel.fromJson(Map<String, Object?> json) =>
      _$BallotOptionThemeModelFromJson(json);
}

@freezed
sealed class BallotThemeModel with _$BallotThemeModel {
  const factory BallotThemeModel({
    required String name,
    @Default([]) List<String> examples,
    @Default(0) int mentions,
    @Default('neutral') String sentiment,
  }) = _BallotThemeModel;

  factory BallotThemeModel.fromJson(Map<String, Object?> json) =>
      _$BallotThemeModelFromJson(json);
}
