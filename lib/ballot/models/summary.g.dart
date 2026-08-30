// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BallotSummary _$BallotSummaryFromJson(Map<String, dynamic> json) =>
    _BallotSummary(
      status: const SummaryStatusConverter().fromJson(json['status'] as String),
      summary: json['summary'] as String? ?? '',
      themes:
          (json['themes'] as List<dynamic>?)
              ?.map((e) => BallotThemeModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      optionThemes:
          (json['option_themes'] as List<dynamic>?)
              ?.map(
                (e) =>
                    BallotOptionThemeModel.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
      reasonsTotal: (json['reasons_total'] as num?)?.toInt() ?? 0,
      reasonsProcessed: (json['reasons_processed'] as num?)?.toInt() ?? 0,
      method: json['method'] as String?,
    );

Map<String, dynamic> _$BallotSummaryToJson(_BallotSummary instance) =>
    <String, dynamic>{
      'status': const SummaryStatusConverter().toJson(instance.status),
      'summary': instance.summary,
      'themes': instance.themes,
      'option_themes': instance.optionThemes,
      'reasons_total': instance.reasonsTotal,
      'reasons_processed': instance.reasonsProcessed,
      'method': instance.method,
    };

_BallotOptionThemeModel _$BallotOptionThemeModelFromJson(
  Map<String, dynamic> json,
) => _BallotOptionThemeModel(
  option: json['option'] as String,
  themes:
      (json['themes'] as List<dynamic>?)
          ?.map((e) => BallotThemeModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$BallotOptionThemeModelToJson(
  _BallotOptionThemeModel instance,
) => <String, dynamic>{'option': instance.option, 'themes': instance.themes};

_BallotThemeModel _$BallotThemeModelFromJson(Map<String, dynamic> json) =>
    _BallotThemeModel(
      name: json['name'] as String,
      examples:
          (json['examples'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      mentions: (json['mentions'] as num?)?.toInt() ?? 0,
      sentiment: json['sentiment'] as String? ?? 'neutral',
    );

Map<String, dynamic> _$BallotThemeModelToJson(_BallotThemeModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'examples': instance.examples,
      'mentions': instance.mentions,
      'sentiment': instance.sentiment,
    };
