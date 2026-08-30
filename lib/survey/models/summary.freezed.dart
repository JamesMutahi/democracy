// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SurveySummary {

@SummaryStatusConverter() SummaryStatus get status; String get summary;@JsonKey(name: 'choice_stats') List<ChoiceStatModel> get choiceStats;@JsonKey(name: 'number_stats') List<NumberStatModel> get numberStats;@JsonKey(name: 'text_themes') List<TextThemeModel> get textThemes;@JsonKey(name: 'total_responses') int get totalResponses;@JsonKey(name: 'processed_text_answers') int get processedTextAnswers; bool get sampled;@JsonKey(name: 'model_name') String get modelName;@JsonKey(name: 'prompt_version') String get promptVersion;@JsonKey(name: 'completed_at') DateTime? get completedAt;
/// Create a copy of SurveySummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SurveySummaryCopyWith<SurveySummary> get copyWith => _$SurveySummaryCopyWithImpl<SurveySummary>(this as SurveySummary, _$identity);

  /// Serializes this SurveySummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SurveySummary&&(identical(other.status, status) || other.status == status)&&(identical(other.summary, summary) || other.summary == summary)&&const DeepCollectionEquality().equals(other.choiceStats, choiceStats)&&const DeepCollectionEquality().equals(other.numberStats, numberStats)&&const DeepCollectionEquality().equals(other.textThemes, textThemes)&&(identical(other.totalResponses, totalResponses) || other.totalResponses == totalResponses)&&(identical(other.processedTextAnswers, processedTextAnswers) || other.processedTextAnswers == processedTextAnswers)&&(identical(other.sampled, sampled) || other.sampled == sampled)&&(identical(other.modelName, modelName) || other.modelName == modelName)&&(identical(other.promptVersion, promptVersion) || other.promptVersion == promptVersion)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,summary,const DeepCollectionEquality().hash(choiceStats),const DeepCollectionEquality().hash(numberStats),const DeepCollectionEquality().hash(textThemes),totalResponses,processedTextAnswers,sampled,modelName,promptVersion,completedAt);

@override
String toString() {
  return 'SurveySummary(status: $status, summary: $summary, choiceStats: $choiceStats, numberStats: $numberStats, textThemes: $textThemes, totalResponses: $totalResponses, processedTextAnswers: $processedTextAnswers, sampled: $sampled, modelName: $modelName, promptVersion: $promptVersion, completedAt: $completedAt)';
}


}

/// @nodoc
abstract mixin class $SurveySummaryCopyWith<$Res>  {
  factory $SurveySummaryCopyWith(SurveySummary value, $Res Function(SurveySummary) _then) = _$SurveySummaryCopyWithImpl;
@useResult
$Res call({
@SummaryStatusConverter() SummaryStatus status, String summary,@JsonKey(name: 'choice_stats') List<ChoiceStatModel> choiceStats,@JsonKey(name: 'number_stats') List<NumberStatModel> numberStats,@JsonKey(name: 'text_themes') List<TextThemeModel> textThemes,@JsonKey(name: 'total_responses') int totalResponses,@JsonKey(name: 'processed_text_answers') int processedTextAnswers, bool sampled,@JsonKey(name: 'model_name') String modelName,@JsonKey(name: 'prompt_version') String promptVersion,@JsonKey(name: 'completed_at') DateTime? completedAt
});




}
/// @nodoc
class _$SurveySummaryCopyWithImpl<$Res>
    implements $SurveySummaryCopyWith<$Res> {
  _$SurveySummaryCopyWithImpl(this._self, this._then);

  final SurveySummary _self;
  final $Res Function(SurveySummary) _then;

/// Create a copy of SurveySummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? summary = null,Object? choiceStats = null,Object? numberStats = null,Object? textThemes = null,Object? totalResponses = null,Object? processedTextAnswers = null,Object? sampled = null,Object? modelName = null,Object? promptVersion = null,Object? completedAt = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SummaryStatus,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String,choiceStats: null == choiceStats ? _self.choiceStats : choiceStats // ignore: cast_nullable_to_non_nullable
as List<ChoiceStatModel>,numberStats: null == numberStats ? _self.numberStats : numberStats // ignore: cast_nullable_to_non_nullable
as List<NumberStatModel>,textThemes: null == textThemes ? _self.textThemes : textThemes // ignore: cast_nullable_to_non_nullable
as List<TextThemeModel>,totalResponses: null == totalResponses ? _self.totalResponses : totalResponses // ignore: cast_nullable_to_non_nullable
as int,processedTextAnswers: null == processedTextAnswers ? _self.processedTextAnswers : processedTextAnswers // ignore: cast_nullable_to_non_nullable
as int,sampled: null == sampled ? _self.sampled : sampled // ignore: cast_nullable_to_non_nullable
as bool,modelName: null == modelName ? _self.modelName : modelName // ignore: cast_nullable_to_non_nullable
as String,promptVersion: null == promptVersion ? _self.promptVersion : promptVersion // ignore: cast_nullable_to_non_nullable
as String,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [SurveySummary].
extension SurveySummaryPatterns on SurveySummary {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SurveySummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SurveySummary() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SurveySummary value)  $default,){
final _that = this;
switch (_that) {
case _SurveySummary():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SurveySummary value)?  $default,){
final _that = this;
switch (_that) {
case _SurveySummary() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@SummaryStatusConverter()  SummaryStatus status,  String summary, @JsonKey(name: 'choice_stats')  List<ChoiceStatModel> choiceStats, @JsonKey(name: 'number_stats')  List<NumberStatModel> numberStats, @JsonKey(name: 'text_themes')  List<TextThemeModel> textThemes, @JsonKey(name: 'total_responses')  int totalResponses, @JsonKey(name: 'processed_text_answers')  int processedTextAnswers,  bool sampled, @JsonKey(name: 'model_name')  String modelName, @JsonKey(name: 'prompt_version')  String promptVersion, @JsonKey(name: 'completed_at')  DateTime? completedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SurveySummary() when $default != null:
return $default(_that.status,_that.summary,_that.choiceStats,_that.numberStats,_that.textThemes,_that.totalResponses,_that.processedTextAnswers,_that.sampled,_that.modelName,_that.promptVersion,_that.completedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@SummaryStatusConverter()  SummaryStatus status,  String summary, @JsonKey(name: 'choice_stats')  List<ChoiceStatModel> choiceStats, @JsonKey(name: 'number_stats')  List<NumberStatModel> numberStats, @JsonKey(name: 'text_themes')  List<TextThemeModel> textThemes, @JsonKey(name: 'total_responses')  int totalResponses, @JsonKey(name: 'processed_text_answers')  int processedTextAnswers,  bool sampled, @JsonKey(name: 'model_name')  String modelName, @JsonKey(name: 'prompt_version')  String promptVersion, @JsonKey(name: 'completed_at')  DateTime? completedAt)  $default,) {final _that = this;
switch (_that) {
case _SurveySummary():
return $default(_that.status,_that.summary,_that.choiceStats,_that.numberStats,_that.textThemes,_that.totalResponses,_that.processedTextAnswers,_that.sampled,_that.modelName,_that.promptVersion,_that.completedAt);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@SummaryStatusConverter()  SummaryStatus status,  String summary, @JsonKey(name: 'choice_stats')  List<ChoiceStatModel> choiceStats, @JsonKey(name: 'number_stats')  List<NumberStatModel> numberStats, @JsonKey(name: 'text_themes')  List<TextThemeModel> textThemes, @JsonKey(name: 'total_responses')  int totalResponses, @JsonKey(name: 'processed_text_answers')  int processedTextAnswers,  bool sampled, @JsonKey(name: 'model_name')  String modelName, @JsonKey(name: 'prompt_version')  String promptVersion, @JsonKey(name: 'completed_at')  DateTime? completedAt)?  $default,) {final _that = this;
switch (_that) {
case _SurveySummary() when $default != null:
return $default(_that.status,_that.summary,_that.choiceStats,_that.numberStats,_that.textThemes,_that.totalResponses,_that.processedTextAnswers,_that.sampled,_that.modelName,_that.promptVersion,_that.completedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SurveySummary implements SurveySummary {
  const _SurveySummary({@SummaryStatusConverter() required this.status, required this.summary, @JsonKey(name: 'choice_stats') required final  List<ChoiceStatModel> choiceStats, @JsonKey(name: 'number_stats') required final  List<NumberStatModel> numberStats, @JsonKey(name: 'text_themes') required final  List<TextThemeModel> textThemes, @JsonKey(name: 'total_responses') required this.totalResponses, @JsonKey(name: 'processed_text_answers') required this.processedTextAnswers, required this.sampled, @JsonKey(name: 'model_name') required this.modelName, @JsonKey(name: 'prompt_version') required this.promptVersion, @JsonKey(name: 'completed_at') required this.completedAt}): _choiceStats = choiceStats,_numberStats = numberStats,_textThemes = textThemes;
  factory _SurveySummary.fromJson(Map<String, dynamic> json) => _$SurveySummaryFromJson(json);

@override@SummaryStatusConverter() final  SummaryStatus status;
@override final  String summary;
 final  List<ChoiceStatModel> _choiceStats;
@override@JsonKey(name: 'choice_stats') List<ChoiceStatModel> get choiceStats {
  if (_choiceStats is EqualUnmodifiableListView) return _choiceStats;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_choiceStats);
}

 final  List<NumberStatModel> _numberStats;
@override@JsonKey(name: 'number_stats') List<NumberStatModel> get numberStats {
  if (_numberStats is EqualUnmodifiableListView) return _numberStats;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_numberStats);
}

 final  List<TextThemeModel> _textThemes;
@override@JsonKey(name: 'text_themes') List<TextThemeModel> get textThemes {
  if (_textThemes is EqualUnmodifiableListView) return _textThemes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_textThemes);
}

@override@JsonKey(name: 'total_responses') final  int totalResponses;
@override@JsonKey(name: 'processed_text_answers') final  int processedTextAnswers;
@override final  bool sampled;
@override@JsonKey(name: 'model_name') final  String modelName;
@override@JsonKey(name: 'prompt_version') final  String promptVersion;
@override@JsonKey(name: 'completed_at') final  DateTime? completedAt;

/// Create a copy of SurveySummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SurveySummaryCopyWith<_SurveySummary> get copyWith => __$SurveySummaryCopyWithImpl<_SurveySummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SurveySummaryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SurveySummary&&(identical(other.status, status) || other.status == status)&&(identical(other.summary, summary) || other.summary == summary)&&const DeepCollectionEquality().equals(other._choiceStats, _choiceStats)&&const DeepCollectionEquality().equals(other._numberStats, _numberStats)&&const DeepCollectionEquality().equals(other._textThemes, _textThemes)&&(identical(other.totalResponses, totalResponses) || other.totalResponses == totalResponses)&&(identical(other.processedTextAnswers, processedTextAnswers) || other.processedTextAnswers == processedTextAnswers)&&(identical(other.sampled, sampled) || other.sampled == sampled)&&(identical(other.modelName, modelName) || other.modelName == modelName)&&(identical(other.promptVersion, promptVersion) || other.promptVersion == promptVersion)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,summary,const DeepCollectionEquality().hash(_choiceStats),const DeepCollectionEquality().hash(_numberStats),const DeepCollectionEquality().hash(_textThemes),totalResponses,processedTextAnswers,sampled,modelName,promptVersion,completedAt);

@override
String toString() {
  return 'SurveySummary(status: $status, summary: $summary, choiceStats: $choiceStats, numberStats: $numberStats, textThemes: $textThemes, totalResponses: $totalResponses, processedTextAnswers: $processedTextAnswers, sampled: $sampled, modelName: $modelName, promptVersion: $promptVersion, completedAt: $completedAt)';
}


}

/// @nodoc
abstract mixin class _$SurveySummaryCopyWith<$Res> implements $SurveySummaryCopyWith<$Res> {
  factory _$SurveySummaryCopyWith(_SurveySummary value, $Res Function(_SurveySummary) _then) = __$SurveySummaryCopyWithImpl;
@override @useResult
$Res call({
@SummaryStatusConverter() SummaryStatus status, String summary,@JsonKey(name: 'choice_stats') List<ChoiceStatModel> choiceStats,@JsonKey(name: 'number_stats') List<NumberStatModel> numberStats,@JsonKey(name: 'text_themes') List<TextThemeModel> textThemes,@JsonKey(name: 'total_responses') int totalResponses,@JsonKey(name: 'processed_text_answers') int processedTextAnswers, bool sampled,@JsonKey(name: 'model_name') String modelName,@JsonKey(name: 'prompt_version') String promptVersion,@JsonKey(name: 'completed_at') DateTime? completedAt
});




}
/// @nodoc
class __$SurveySummaryCopyWithImpl<$Res>
    implements _$SurveySummaryCopyWith<$Res> {
  __$SurveySummaryCopyWithImpl(this._self, this._then);

  final _SurveySummary _self;
  final $Res Function(_SurveySummary) _then;

/// Create a copy of SurveySummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? summary = null,Object? choiceStats = null,Object? numberStats = null,Object? textThemes = null,Object? totalResponses = null,Object? processedTextAnswers = null,Object? sampled = null,Object? modelName = null,Object? promptVersion = null,Object? completedAt = freezed,}) {
  return _then(_SurveySummary(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SummaryStatus,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String,choiceStats: null == choiceStats ? _self._choiceStats : choiceStats // ignore: cast_nullable_to_non_nullable
as List<ChoiceStatModel>,numberStats: null == numberStats ? _self._numberStats : numberStats // ignore: cast_nullable_to_non_nullable
as List<NumberStatModel>,textThemes: null == textThemes ? _self._textThemes : textThemes // ignore: cast_nullable_to_non_nullable
as List<TextThemeModel>,totalResponses: null == totalResponses ? _self.totalResponses : totalResponses // ignore: cast_nullable_to_non_nullable
as int,processedTextAnswers: null == processedTextAnswers ? _self.processedTextAnswers : processedTextAnswers // ignore: cast_nullable_to_non_nullable
as int,sampled: null == sampled ? _self.sampled : sampled // ignore: cast_nullable_to_non_nullable
as bool,modelName: null == modelName ? _self.modelName : modelName // ignore: cast_nullable_to_non_nullable
as String,promptVersion: null == promptVersion ? _self.promptVersion : promptVersion // ignore: cast_nullable_to_non_nullable
as String,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$ChoiceStatModel {

@JsonKey(name: 'question_id') int get questionId; String get question; String get type;@JsonKey(name: 'total_answers') int get totalAnswers; List<ChoiceModel> get choices;
/// Create a copy of ChoiceStatModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChoiceStatModelCopyWith<ChoiceStatModel> get copyWith => _$ChoiceStatModelCopyWithImpl<ChoiceStatModel>(this as ChoiceStatModel, _$identity);

  /// Serializes this ChoiceStatModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChoiceStatModel&&(identical(other.questionId, questionId) || other.questionId == questionId)&&(identical(other.question, question) || other.question == question)&&(identical(other.type, type) || other.type == type)&&(identical(other.totalAnswers, totalAnswers) || other.totalAnswers == totalAnswers)&&const DeepCollectionEquality().equals(other.choices, choices));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,questionId,question,type,totalAnswers,const DeepCollectionEquality().hash(choices));

@override
String toString() {
  return 'ChoiceStatModel(questionId: $questionId, question: $question, type: $type, totalAnswers: $totalAnswers, choices: $choices)';
}


}

/// @nodoc
abstract mixin class $ChoiceStatModelCopyWith<$Res>  {
  factory $ChoiceStatModelCopyWith(ChoiceStatModel value, $Res Function(ChoiceStatModel) _then) = _$ChoiceStatModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'question_id') int questionId, String question, String type,@JsonKey(name: 'total_answers') int totalAnswers, List<ChoiceModel> choices
});




}
/// @nodoc
class _$ChoiceStatModelCopyWithImpl<$Res>
    implements $ChoiceStatModelCopyWith<$Res> {
  _$ChoiceStatModelCopyWithImpl(this._self, this._then);

  final ChoiceStatModel _self;
  final $Res Function(ChoiceStatModel) _then;

/// Create a copy of ChoiceStatModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? questionId = null,Object? question = null,Object? type = null,Object? totalAnswers = null,Object? choices = null,}) {
  return _then(_self.copyWith(
questionId: null == questionId ? _self.questionId : questionId // ignore: cast_nullable_to_non_nullable
as int,question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,totalAnswers: null == totalAnswers ? _self.totalAnswers : totalAnswers // ignore: cast_nullable_to_non_nullable
as int,choices: null == choices ? _self.choices : choices // ignore: cast_nullable_to_non_nullable
as List<ChoiceModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [ChoiceStatModel].
extension ChoiceStatModelPatterns on ChoiceStatModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChoiceStatModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChoiceStatModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChoiceStatModel value)  $default,){
final _that = this;
switch (_that) {
case _ChoiceStatModel():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChoiceStatModel value)?  $default,){
final _that = this;
switch (_that) {
case _ChoiceStatModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'question_id')  int questionId,  String question,  String type, @JsonKey(name: 'total_answers')  int totalAnswers,  List<ChoiceModel> choices)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChoiceStatModel() when $default != null:
return $default(_that.questionId,_that.question,_that.type,_that.totalAnswers,_that.choices);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'question_id')  int questionId,  String question,  String type, @JsonKey(name: 'total_answers')  int totalAnswers,  List<ChoiceModel> choices)  $default,) {final _that = this;
switch (_that) {
case _ChoiceStatModel():
return $default(_that.questionId,_that.question,_that.type,_that.totalAnswers,_that.choices);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'question_id')  int questionId,  String question,  String type, @JsonKey(name: 'total_answers')  int totalAnswers,  List<ChoiceModel> choices)?  $default,) {final _that = this;
switch (_that) {
case _ChoiceStatModel() when $default != null:
return $default(_that.questionId,_that.question,_that.type,_that.totalAnswers,_that.choices);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChoiceStatModel implements ChoiceStatModel {
  const _ChoiceStatModel({@JsonKey(name: 'question_id') required this.questionId, required this.question, required this.type, @JsonKey(name: 'total_answers') required this.totalAnswers, required final  List<ChoiceModel> choices}): _choices = choices;
  factory _ChoiceStatModel.fromJson(Map<String, dynamic> json) => _$ChoiceStatModelFromJson(json);

@override@JsonKey(name: 'question_id') final  int questionId;
@override final  String question;
@override final  String type;
@override@JsonKey(name: 'total_answers') final  int totalAnswers;
 final  List<ChoiceModel> _choices;
@override List<ChoiceModel> get choices {
  if (_choices is EqualUnmodifiableListView) return _choices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_choices);
}


/// Create a copy of ChoiceStatModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChoiceStatModelCopyWith<_ChoiceStatModel> get copyWith => __$ChoiceStatModelCopyWithImpl<_ChoiceStatModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChoiceStatModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChoiceStatModel&&(identical(other.questionId, questionId) || other.questionId == questionId)&&(identical(other.question, question) || other.question == question)&&(identical(other.type, type) || other.type == type)&&(identical(other.totalAnswers, totalAnswers) || other.totalAnswers == totalAnswers)&&const DeepCollectionEquality().equals(other._choices, _choices));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,questionId,question,type,totalAnswers,const DeepCollectionEquality().hash(_choices));

@override
String toString() {
  return 'ChoiceStatModel(questionId: $questionId, question: $question, type: $type, totalAnswers: $totalAnswers, choices: $choices)';
}


}

/// @nodoc
abstract mixin class _$ChoiceStatModelCopyWith<$Res> implements $ChoiceStatModelCopyWith<$Res> {
  factory _$ChoiceStatModelCopyWith(_ChoiceStatModel value, $Res Function(_ChoiceStatModel) _then) = __$ChoiceStatModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'question_id') int questionId, String question, String type,@JsonKey(name: 'total_answers') int totalAnswers, List<ChoiceModel> choices
});




}
/// @nodoc
class __$ChoiceStatModelCopyWithImpl<$Res>
    implements _$ChoiceStatModelCopyWith<$Res> {
  __$ChoiceStatModelCopyWithImpl(this._self, this._then);

  final _ChoiceStatModel _self;
  final $Res Function(_ChoiceStatModel) _then;

/// Create a copy of ChoiceStatModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? questionId = null,Object? question = null,Object? type = null,Object? totalAnswers = null,Object? choices = null,}) {
  return _then(_ChoiceStatModel(
questionId: null == questionId ? _self.questionId : questionId // ignore: cast_nullable_to_non_nullable
as int,question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,totalAnswers: null == totalAnswers ? _self.totalAnswers : totalAnswers // ignore: cast_nullable_to_non_nullable
as int,choices: null == choices ? _self._choices : choices // ignore: cast_nullable_to_non_nullable
as List<ChoiceModel>,
  ));
}


}


/// @nodoc
mixin _$ChoiceModel {

@JsonKey(name: 'choice_id') int get choiceId; String get text; int get count; double get percent;
/// Create a copy of ChoiceModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChoiceModelCopyWith<ChoiceModel> get copyWith => _$ChoiceModelCopyWithImpl<ChoiceModel>(this as ChoiceModel, _$identity);

  /// Serializes this ChoiceModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChoiceModel&&(identical(other.choiceId, choiceId) || other.choiceId == choiceId)&&(identical(other.text, text) || other.text == text)&&(identical(other.count, count) || other.count == count)&&(identical(other.percent, percent) || other.percent == percent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,choiceId,text,count,percent);

@override
String toString() {
  return 'ChoiceModel(choiceId: $choiceId, text: $text, count: $count, percent: $percent)';
}


}

/// @nodoc
abstract mixin class $ChoiceModelCopyWith<$Res>  {
  factory $ChoiceModelCopyWith(ChoiceModel value, $Res Function(ChoiceModel) _then) = _$ChoiceModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'choice_id') int choiceId, String text, int count, double percent
});




}
/// @nodoc
class _$ChoiceModelCopyWithImpl<$Res>
    implements $ChoiceModelCopyWith<$Res> {
  _$ChoiceModelCopyWithImpl(this._self, this._then);

  final ChoiceModel _self;
  final $Res Function(ChoiceModel) _then;

/// Create a copy of ChoiceModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? choiceId = null,Object? text = null,Object? count = null,Object? percent = null,}) {
  return _then(_self.copyWith(
choiceId: null == choiceId ? _self.choiceId : choiceId // ignore: cast_nullable_to_non_nullable
as int,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,percent: null == percent ? _self.percent : percent // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [ChoiceModel].
extension ChoiceModelPatterns on ChoiceModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChoiceModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChoiceModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChoiceModel value)  $default,){
final _that = this;
switch (_that) {
case _ChoiceModel():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChoiceModel value)?  $default,){
final _that = this;
switch (_that) {
case _ChoiceModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'choice_id')  int choiceId,  String text,  int count,  double percent)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChoiceModel() when $default != null:
return $default(_that.choiceId,_that.text,_that.count,_that.percent);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'choice_id')  int choiceId,  String text,  int count,  double percent)  $default,) {final _that = this;
switch (_that) {
case _ChoiceModel():
return $default(_that.choiceId,_that.text,_that.count,_that.percent);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'choice_id')  int choiceId,  String text,  int count,  double percent)?  $default,) {final _that = this;
switch (_that) {
case _ChoiceModel() when $default != null:
return $default(_that.choiceId,_that.text,_that.count,_that.percent);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChoiceModel implements ChoiceModel {
  const _ChoiceModel({@JsonKey(name: 'choice_id') required this.choiceId, required this.text, required this.count, required this.percent});
  factory _ChoiceModel.fromJson(Map<String, dynamic> json) => _$ChoiceModelFromJson(json);

@override@JsonKey(name: 'choice_id') final  int choiceId;
@override final  String text;
@override final  int count;
@override final  double percent;

/// Create a copy of ChoiceModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChoiceModelCopyWith<_ChoiceModel> get copyWith => __$ChoiceModelCopyWithImpl<_ChoiceModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChoiceModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChoiceModel&&(identical(other.choiceId, choiceId) || other.choiceId == choiceId)&&(identical(other.text, text) || other.text == text)&&(identical(other.count, count) || other.count == count)&&(identical(other.percent, percent) || other.percent == percent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,choiceId,text,count,percent);

@override
String toString() {
  return 'ChoiceModel(choiceId: $choiceId, text: $text, count: $count, percent: $percent)';
}


}

/// @nodoc
abstract mixin class _$ChoiceModelCopyWith<$Res> implements $ChoiceModelCopyWith<$Res> {
  factory _$ChoiceModelCopyWith(_ChoiceModel value, $Res Function(_ChoiceModel) _then) = __$ChoiceModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'choice_id') int choiceId, String text, int count, double percent
});




}
/// @nodoc
class __$ChoiceModelCopyWithImpl<$Res>
    implements _$ChoiceModelCopyWith<$Res> {
  __$ChoiceModelCopyWithImpl(this._self, this._then);

  final _ChoiceModel _self;
  final $Res Function(_ChoiceModel) _then;

/// Create a copy of ChoiceModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? choiceId = null,Object? text = null,Object? count = null,Object? percent = null,}) {
  return _then(_ChoiceModel(
choiceId: null == choiceId ? _self.choiceId : choiceId // ignore: cast_nullable_to_non_nullable
as int,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,percent: null == percent ? _self.percent : percent // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$NumberStatModel {

@JsonKey(name: 'question_id') int get questionId; String get question; int get count; double get average; double? get min; double? get max;
/// Create a copy of NumberStatModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NumberStatModelCopyWith<NumberStatModel> get copyWith => _$NumberStatModelCopyWithImpl<NumberStatModel>(this as NumberStatModel, _$identity);

  /// Serializes this NumberStatModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NumberStatModel&&(identical(other.questionId, questionId) || other.questionId == questionId)&&(identical(other.question, question) || other.question == question)&&(identical(other.count, count) || other.count == count)&&(identical(other.average, average) || other.average == average)&&(identical(other.min, min) || other.min == min)&&(identical(other.max, max) || other.max == max));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,questionId,question,count,average,min,max);

@override
String toString() {
  return 'NumberStatModel(questionId: $questionId, question: $question, count: $count, average: $average, min: $min, max: $max)';
}


}

/// @nodoc
abstract mixin class $NumberStatModelCopyWith<$Res>  {
  factory $NumberStatModelCopyWith(NumberStatModel value, $Res Function(NumberStatModel) _then) = _$NumberStatModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'question_id') int questionId, String question, int count, double average, double? min, double? max
});




}
/// @nodoc
class _$NumberStatModelCopyWithImpl<$Res>
    implements $NumberStatModelCopyWith<$Res> {
  _$NumberStatModelCopyWithImpl(this._self, this._then);

  final NumberStatModel _self;
  final $Res Function(NumberStatModel) _then;

/// Create a copy of NumberStatModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? questionId = null,Object? question = null,Object? count = null,Object? average = null,Object? min = freezed,Object? max = freezed,}) {
  return _then(_self.copyWith(
questionId: null == questionId ? _self.questionId : questionId // ignore: cast_nullable_to_non_nullable
as int,question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,average: null == average ? _self.average : average // ignore: cast_nullable_to_non_nullable
as double,min: freezed == min ? _self.min : min // ignore: cast_nullable_to_non_nullable
as double?,max: freezed == max ? _self.max : max // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [NumberStatModel].
extension NumberStatModelPatterns on NumberStatModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NumberStatModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NumberStatModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NumberStatModel value)  $default,){
final _that = this;
switch (_that) {
case _NumberStatModel():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NumberStatModel value)?  $default,){
final _that = this;
switch (_that) {
case _NumberStatModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'question_id')  int questionId,  String question,  int count,  double average,  double? min,  double? max)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NumberStatModel() when $default != null:
return $default(_that.questionId,_that.question,_that.count,_that.average,_that.min,_that.max);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'question_id')  int questionId,  String question,  int count,  double average,  double? min,  double? max)  $default,) {final _that = this;
switch (_that) {
case _NumberStatModel():
return $default(_that.questionId,_that.question,_that.count,_that.average,_that.min,_that.max);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'question_id')  int questionId,  String question,  int count,  double average,  double? min,  double? max)?  $default,) {final _that = this;
switch (_that) {
case _NumberStatModel() when $default != null:
return $default(_that.questionId,_that.question,_that.count,_that.average,_that.min,_that.max);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NumberStatModel implements NumberStatModel {
  const _NumberStatModel({@JsonKey(name: 'question_id') required this.questionId, required this.question, required this.count, required this.average, required this.min, required this.max});
  factory _NumberStatModel.fromJson(Map<String, dynamic> json) => _$NumberStatModelFromJson(json);

@override@JsonKey(name: 'question_id') final  int questionId;
@override final  String question;
@override final  int count;
@override final  double average;
@override final  double? min;
@override final  double? max;

/// Create a copy of NumberStatModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NumberStatModelCopyWith<_NumberStatModel> get copyWith => __$NumberStatModelCopyWithImpl<_NumberStatModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NumberStatModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NumberStatModel&&(identical(other.questionId, questionId) || other.questionId == questionId)&&(identical(other.question, question) || other.question == question)&&(identical(other.count, count) || other.count == count)&&(identical(other.average, average) || other.average == average)&&(identical(other.min, min) || other.min == min)&&(identical(other.max, max) || other.max == max));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,questionId,question,count,average,min,max);

@override
String toString() {
  return 'NumberStatModel(questionId: $questionId, question: $question, count: $count, average: $average, min: $min, max: $max)';
}


}

/// @nodoc
abstract mixin class _$NumberStatModelCopyWith<$Res> implements $NumberStatModelCopyWith<$Res> {
  factory _$NumberStatModelCopyWith(_NumberStatModel value, $Res Function(_NumberStatModel) _then) = __$NumberStatModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'question_id') int questionId, String question, int count, double average, double? min, double? max
});




}
/// @nodoc
class __$NumberStatModelCopyWithImpl<$Res>
    implements _$NumberStatModelCopyWith<$Res> {
  __$NumberStatModelCopyWithImpl(this._self, this._then);

  final _NumberStatModel _self;
  final $Res Function(_NumberStatModel) _then;

/// Create a copy of NumberStatModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? questionId = null,Object? question = null,Object? count = null,Object? average = null,Object? min = freezed,Object? max = freezed,}) {
  return _then(_NumberStatModel(
questionId: null == questionId ? _self.questionId : questionId // ignore: cast_nullable_to_non_nullable
as int,question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,average: null == average ? _self.average : average // ignore: cast_nullable_to_non_nullable
as double,min: freezed == min ? _self.min : min // ignore: cast_nullable_to_non_nullable
as double?,max: freezed == max ? _self.max : max // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}


/// @nodoc
mixin _$TextThemeModel {

@JsonKey(name: 'question_id') int get questionId; String get question; String get summary;@JsonKey(name: 'processed_answers') int get processedAnswers; bool get sampled; List<ClusterModel> get clusters;
/// Create a copy of TextThemeModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TextThemeModelCopyWith<TextThemeModel> get copyWith => _$TextThemeModelCopyWithImpl<TextThemeModel>(this as TextThemeModel, _$identity);

  /// Serializes this TextThemeModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TextThemeModel&&(identical(other.questionId, questionId) || other.questionId == questionId)&&(identical(other.question, question) || other.question == question)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.processedAnswers, processedAnswers) || other.processedAnswers == processedAnswers)&&(identical(other.sampled, sampled) || other.sampled == sampled)&&const DeepCollectionEquality().equals(other.clusters, clusters));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,questionId,question,summary,processedAnswers,sampled,const DeepCollectionEquality().hash(clusters));

@override
String toString() {
  return 'TextThemeModel(questionId: $questionId, question: $question, summary: $summary, processedAnswers: $processedAnswers, sampled: $sampled, clusters: $clusters)';
}


}

/// @nodoc
abstract mixin class $TextThemeModelCopyWith<$Res>  {
  factory $TextThemeModelCopyWith(TextThemeModel value, $Res Function(TextThemeModel) _then) = _$TextThemeModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'question_id') int questionId, String question, String summary,@JsonKey(name: 'processed_answers') int processedAnswers, bool sampled, List<ClusterModel> clusters
});




}
/// @nodoc
class _$TextThemeModelCopyWithImpl<$Res>
    implements $TextThemeModelCopyWith<$Res> {
  _$TextThemeModelCopyWithImpl(this._self, this._then);

  final TextThemeModel _self;
  final $Res Function(TextThemeModel) _then;

/// Create a copy of TextThemeModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? questionId = null,Object? question = null,Object? summary = null,Object? processedAnswers = null,Object? sampled = null,Object? clusters = null,}) {
  return _then(_self.copyWith(
questionId: null == questionId ? _self.questionId : questionId // ignore: cast_nullable_to_non_nullable
as int,question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String,processedAnswers: null == processedAnswers ? _self.processedAnswers : processedAnswers // ignore: cast_nullable_to_non_nullable
as int,sampled: null == sampled ? _self.sampled : sampled // ignore: cast_nullable_to_non_nullable
as bool,clusters: null == clusters ? _self.clusters : clusters // ignore: cast_nullable_to_non_nullable
as List<ClusterModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [TextThemeModel].
extension TextThemeModelPatterns on TextThemeModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TextThemeModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TextThemeModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TextThemeModel value)  $default,){
final _that = this;
switch (_that) {
case _TextThemeModel():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TextThemeModel value)?  $default,){
final _that = this;
switch (_that) {
case _TextThemeModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'question_id')  int questionId,  String question,  String summary, @JsonKey(name: 'processed_answers')  int processedAnswers,  bool sampled,  List<ClusterModel> clusters)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TextThemeModel() when $default != null:
return $default(_that.questionId,_that.question,_that.summary,_that.processedAnswers,_that.sampled,_that.clusters);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'question_id')  int questionId,  String question,  String summary, @JsonKey(name: 'processed_answers')  int processedAnswers,  bool sampled,  List<ClusterModel> clusters)  $default,) {final _that = this;
switch (_that) {
case _TextThemeModel():
return $default(_that.questionId,_that.question,_that.summary,_that.processedAnswers,_that.sampled,_that.clusters);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'question_id')  int questionId,  String question,  String summary, @JsonKey(name: 'processed_answers')  int processedAnswers,  bool sampled,  List<ClusterModel> clusters)?  $default,) {final _that = this;
switch (_that) {
case _TextThemeModel() when $default != null:
return $default(_that.questionId,_that.question,_that.summary,_that.processedAnswers,_that.sampled,_that.clusters);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TextThemeModel implements TextThemeModel {
  const _TextThemeModel({@JsonKey(name: 'question_id') required this.questionId, required this.question, required this.summary, @JsonKey(name: 'processed_answers') required this.processedAnswers, required this.sampled, required final  List<ClusterModel> clusters}): _clusters = clusters;
  factory _TextThemeModel.fromJson(Map<String, dynamic> json) => _$TextThemeModelFromJson(json);

@override@JsonKey(name: 'question_id') final  int questionId;
@override final  String question;
@override final  String summary;
@override@JsonKey(name: 'processed_answers') final  int processedAnswers;
@override final  bool sampled;
 final  List<ClusterModel> _clusters;
@override List<ClusterModel> get clusters {
  if (_clusters is EqualUnmodifiableListView) return _clusters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_clusters);
}


/// Create a copy of TextThemeModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TextThemeModelCopyWith<_TextThemeModel> get copyWith => __$TextThemeModelCopyWithImpl<_TextThemeModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TextThemeModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TextThemeModel&&(identical(other.questionId, questionId) || other.questionId == questionId)&&(identical(other.question, question) || other.question == question)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.processedAnswers, processedAnswers) || other.processedAnswers == processedAnswers)&&(identical(other.sampled, sampled) || other.sampled == sampled)&&const DeepCollectionEquality().equals(other._clusters, _clusters));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,questionId,question,summary,processedAnswers,sampled,const DeepCollectionEquality().hash(_clusters));

@override
String toString() {
  return 'TextThemeModel(questionId: $questionId, question: $question, summary: $summary, processedAnswers: $processedAnswers, sampled: $sampled, clusters: $clusters)';
}


}

/// @nodoc
abstract mixin class _$TextThemeModelCopyWith<$Res> implements $TextThemeModelCopyWith<$Res> {
  factory _$TextThemeModelCopyWith(_TextThemeModel value, $Res Function(_TextThemeModel) _then) = __$TextThemeModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'question_id') int questionId, String question, String summary,@JsonKey(name: 'processed_answers') int processedAnswers, bool sampled, List<ClusterModel> clusters
});




}
/// @nodoc
class __$TextThemeModelCopyWithImpl<$Res>
    implements _$TextThemeModelCopyWith<$Res> {
  __$TextThemeModelCopyWithImpl(this._self, this._then);

  final _TextThemeModel _self;
  final $Res Function(_TextThemeModel) _then;

/// Create a copy of TextThemeModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? questionId = null,Object? question = null,Object? summary = null,Object? processedAnswers = null,Object? sampled = null,Object? clusters = null,}) {
  return _then(_TextThemeModel(
questionId: null == questionId ? _self.questionId : questionId // ignore: cast_nullable_to_non_nullable
as int,question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String,processedAnswers: null == processedAnswers ? _self.processedAnswers : processedAnswers // ignore: cast_nullable_to_non_nullable
as int,sampled: null == sampled ? _self.sampled : sampled // ignore: cast_nullable_to_non_nullable
as bool,clusters: null == clusters ? _self._clusters : clusters // ignore: cast_nullable_to_non_nullable
as List<ClusterModel>,
  ));
}


}


/// @nodoc
mixin _$ClusterModel {

@JsonKey(name: 'cluster_id') int get clusterId; String get label; int get size; String get summary;@JsonKey(name: 'representative_texts') List<String> get representativeTexts;
/// Create a copy of ClusterModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClusterModelCopyWith<ClusterModel> get copyWith => _$ClusterModelCopyWithImpl<ClusterModel>(this as ClusterModel, _$identity);

  /// Serializes this ClusterModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClusterModel&&(identical(other.clusterId, clusterId) || other.clusterId == clusterId)&&(identical(other.label, label) || other.label == label)&&(identical(other.size, size) || other.size == size)&&(identical(other.summary, summary) || other.summary == summary)&&const DeepCollectionEquality().equals(other.representativeTexts, representativeTexts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clusterId,label,size,summary,const DeepCollectionEquality().hash(representativeTexts));

@override
String toString() {
  return 'ClusterModel(clusterId: $clusterId, label: $label, size: $size, summary: $summary, representativeTexts: $representativeTexts)';
}


}

/// @nodoc
abstract mixin class $ClusterModelCopyWith<$Res>  {
  factory $ClusterModelCopyWith(ClusterModel value, $Res Function(ClusterModel) _then) = _$ClusterModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'cluster_id') int clusterId, String label, int size, String summary,@JsonKey(name: 'representative_texts') List<String> representativeTexts
});




}
/// @nodoc
class _$ClusterModelCopyWithImpl<$Res>
    implements $ClusterModelCopyWith<$Res> {
  _$ClusterModelCopyWithImpl(this._self, this._then);

  final ClusterModel _self;
  final $Res Function(ClusterModel) _then;

/// Create a copy of ClusterModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? clusterId = null,Object? label = null,Object? size = null,Object? summary = null,Object? representativeTexts = null,}) {
  return _then(_self.copyWith(
clusterId: null == clusterId ? _self.clusterId : clusterId // ignore: cast_nullable_to_non_nullable
as int,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String,representativeTexts: null == representativeTexts ? _self.representativeTexts : representativeTexts // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [ClusterModel].
extension ClusterModelPatterns on ClusterModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClusterModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClusterModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClusterModel value)  $default,){
final _that = this;
switch (_that) {
case _ClusterModel():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClusterModel value)?  $default,){
final _that = this;
switch (_that) {
case _ClusterModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'cluster_id')  int clusterId,  String label,  int size,  String summary, @JsonKey(name: 'representative_texts')  List<String> representativeTexts)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClusterModel() when $default != null:
return $default(_that.clusterId,_that.label,_that.size,_that.summary,_that.representativeTexts);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'cluster_id')  int clusterId,  String label,  int size,  String summary, @JsonKey(name: 'representative_texts')  List<String> representativeTexts)  $default,) {final _that = this;
switch (_that) {
case _ClusterModel():
return $default(_that.clusterId,_that.label,_that.size,_that.summary,_that.representativeTexts);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'cluster_id')  int clusterId,  String label,  int size,  String summary, @JsonKey(name: 'representative_texts')  List<String> representativeTexts)?  $default,) {final _that = this;
switch (_that) {
case _ClusterModel() when $default != null:
return $default(_that.clusterId,_that.label,_that.size,_that.summary,_that.representativeTexts);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ClusterModel implements ClusterModel {
  const _ClusterModel({@JsonKey(name: 'cluster_id') required this.clusterId, required this.label, required this.size, required this.summary, @JsonKey(name: 'representative_texts') required final  List<String> representativeTexts}): _representativeTexts = representativeTexts;
  factory _ClusterModel.fromJson(Map<String, dynamic> json) => _$ClusterModelFromJson(json);

@override@JsonKey(name: 'cluster_id') final  int clusterId;
@override final  String label;
@override final  int size;
@override final  String summary;
 final  List<String> _representativeTexts;
@override@JsonKey(name: 'representative_texts') List<String> get representativeTexts {
  if (_representativeTexts is EqualUnmodifiableListView) return _representativeTexts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_representativeTexts);
}


/// Create a copy of ClusterModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClusterModelCopyWith<_ClusterModel> get copyWith => __$ClusterModelCopyWithImpl<_ClusterModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClusterModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClusterModel&&(identical(other.clusterId, clusterId) || other.clusterId == clusterId)&&(identical(other.label, label) || other.label == label)&&(identical(other.size, size) || other.size == size)&&(identical(other.summary, summary) || other.summary == summary)&&const DeepCollectionEquality().equals(other._representativeTexts, _representativeTexts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clusterId,label,size,summary,const DeepCollectionEquality().hash(_representativeTexts));

@override
String toString() {
  return 'ClusterModel(clusterId: $clusterId, label: $label, size: $size, summary: $summary, representativeTexts: $representativeTexts)';
}


}

/// @nodoc
abstract mixin class _$ClusterModelCopyWith<$Res> implements $ClusterModelCopyWith<$Res> {
  factory _$ClusterModelCopyWith(_ClusterModel value, $Res Function(_ClusterModel) _then) = __$ClusterModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'cluster_id') int clusterId, String label, int size, String summary,@JsonKey(name: 'representative_texts') List<String> representativeTexts
});




}
/// @nodoc
class __$ClusterModelCopyWithImpl<$Res>
    implements _$ClusterModelCopyWith<$Res> {
  __$ClusterModelCopyWithImpl(this._self, this._then);

  final _ClusterModel _self;
  final $Res Function(_ClusterModel) _then;

/// Create a copy of ClusterModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? clusterId = null,Object? label = null,Object? size = null,Object? summary = null,Object? representativeTexts = null,}) {
  return _then(_ClusterModel(
clusterId: null == clusterId ? _self.clusterId : clusterId // ignore: cast_nullable_to_non_nullable
as int,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String,representativeTexts: null == representativeTexts ? _self._representativeTexts : representativeTexts // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
