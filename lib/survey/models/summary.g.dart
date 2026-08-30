// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SurveySummary _$SurveySummaryFromJson(Map<String, dynamic> json) =>
    _SurveySummary(
      status: const SummaryStatusConverter().fromJson(json['status'] as String),
      summary: json['summary'] as String,
      choiceStats: (json['choice_stats'] as List<dynamic>)
          .map((e) => ChoiceStatModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      numberStats: (json['number_stats'] as List<dynamic>)
          .map((e) => NumberStatModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      textThemes: (json['text_themes'] as List<dynamic>)
          .map((e) => TextThemeModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalResponses: (json['total_responses'] as num).toInt(),
      processedTextAnswers: (json['processed_text_answers'] as num).toInt(),
      sampled: json['sampled'] as bool,
      modelName: json['model_name'] as String,
      promptVersion: json['prompt_version'] as String,
      completedAt: json['completed_at'] == null
          ? null
          : DateTime.parse(json['completed_at'] as String),
    );

Map<String, dynamic> _$SurveySummaryToJson(_SurveySummary instance) =>
    <String, dynamic>{
      'status': const SummaryStatusConverter().toJson(instance.status),
      'summary': instance.summary,
      'choice_stats': instance.choiceStats,
      'number_stats': instance.numberStats,
      'text_themes': instance.textThemes,
      'total_responses': instance.totalResponses,
      'processed_text_answers': instance.processedTextAnswers,
      'sampled': instance.sampled,
      'model_name': instance.modelName,
      'prompt_version': instance.promptVersion,
      'completed_at': instance.completedAt?.toIso8601String(),
    };

_ChoiceStatModel _$ChoiceStatModelFromJson(Map<String, dynamic> json) =>
    _ChoiceStatModel(
      questionId: (json['question_id'] as num).toInt(),
      question: json['question'] as String,
      type: json['type'] as String,
      totalAnswers: (json['total_answers'] as num).toInt(),
      choices: (json['choices'] as List<dynamic>)
          .map((e) => ChoiceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChoiceStatModelToJson(_ChoiceStatModel instance) =>
    <String, dynamic>{
      'question_id': instance.questionId,
      'question': instance.question,
      'type': instance.type,
      'total_answers': instance.totalAnswers,
      'choices': instance.choices,
    };

_ChoiceModel _$ChoiceModelFromJson(Map<String, dynamic> json) => _ChoiceModel(
  choiceId: (json['choice_id'] as num).toInt(),
  text: json['text'] as String,
  count: (json['count'] as num).toInt(),
  percent: (json['percent'] as num).toDouble(),
);

Map<String, dynamic> _$ChoiceModelToJson(_ChoiceModel instance) =>
    <String, dynamic>{
      'choice_id': instance.choiceId,
      'text': instance.text,
      'count': instance.count,
      'percent': instance.percent,
    };

_NumberStatModel _$NumberStatModelFromJson(Map<String, dynamic> json) =>
    _NumberStatModel(
      questionId: (json['question_id'] as num).toInt(),
      question: json['question'] as String,
      count: (json['count'] as num).toInt(),
      average: (json['average'] as num).toDouble(),
      min: (json['min'] as num?)?.toDouble(),
      max: (json['max'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$NumberStatModelToJson(_NumberStatModel instance) =>
    <String, dynamic>{
      'question_id': instance.questionId,
      'question': instance.question,
      'count': instance.count,
      'average': instance.average,
      'min': instance.min,
      'max': instance.max,
    };

_TextThemeModel _$TextThemeModelFromJson(Map<String, dynamic> json) =>
    _TextThemeModel(
      questionId: (json['question_id'] as num).toInt(),
      question: json['question'] as String,
      summary: json['summary'] as String,
      processedAnswers: (json['processed_answers'] as num).toInt(),
      sampled: json['sampled'] as bool,
      clusters: (json['clusters'] as List<dynamic>)
          .map((e) => ClusterModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TextThemeModelToJson(_TextThemeModel instance) =>
    <String, dynamic>{
      'question_id': instance.questionId,
      'question': instance.question,
      'summary': instance.summary,
      'processed_answers': instance.processedAnswers,
      'sampled': instance.sampled,
      'clusters': instance.clusters,
    };

_ClusterModel _$ClusterModelFromJson(Map<String, dynamic> json) =>
    _ClusterModel(
      clusterId: (json['cluster_id'] as num).toInt(),
      label: json['label'] as String,
      size: (json['size'] as num).toInt(),
      summary: json['summary'] as String,
      representativeTexts: (json['representative_texts'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ClusterModelToJson(_ClusterModel instance) =>
    <String, dynamic>{
      'cluster_id': instance.clusterId,
      'label': instance.label,
      'size': instance.size,
      'summary': instance.summary,
      'representative_texts': instance.representativeTexts,
    };
