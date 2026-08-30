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
mixin _$BallotSummary {

@SummaryStatusConverter() SummaryStatus get status; String get summary; List<BallotThemeModel> get themes;@JsonKey(name: 'option_themes') List<BallotOptionThemeModel> get optionThemes;@JsonKey(name: 'reasons_total') int get reasonsTotal;@JsonKey(name: 'reasons_processed') int get reasonsProcessed; String? get method;
/// Create a copy of BallotSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BallotSummaryCopyWith<BallotSummary> get copyWith => _$BallotSummaryCopyWithImpl<BallotSummary>(this as BallotSummary, _$identity);

  /// Serializes this BallotSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BallotSummary&&(identical(other.status, status) || other.status == status)&&(identical(other.summary, summary) || other.summary == summary)&&const DeepCollectionEquality().equals(other.themes, themes)&&const DeepCollectionEquality().equals(other.optionThemes, optionThemes)&&(identical(other.reasonsTotal, reasonsTotal) || other.reasonsTotal == reasonsTotal)&&(identical(other.reasonsProcessed, reasonsProcessed) || other.reasonsProcessed == reasonsProcessed)&&(identical(other.method, method) || other.method == method));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,summary,const DeepCollectionEquality().hash(themes),const DeepCollectionEquality().hash(optionThemes),reasonsTotal,reasonsProcessed,method);

@override
String toString() {
  return 'BallotSummary(status: $status, summary: $summary, themes: $themes, optionThemes: $optionThemes, reasonsTotal: $reasonsTotal, reasonsProcessed: $reasonsProcessed, method: $method)';
}


}

/// @nodoc
abstract mixin class $BallotSummaryCopyWith<$Res>  {
  factory $BallotSummaryCopyWith(BallotSummary value, $Res Function(BallotSummary) _then) = _$BallotSummaryCopyWithImpl;
@useResult
$Res call({
@SummaryStatusConverter() SummaryStatus status, String summary, List<BallotThemeModel> themes,@JsonKey(name: 'option_themes') List<BallotOptionThemeModel> optionThemes,@JsonKey(name: 'reasons_total') int reasonsTotal,@JsonKey(name: 'reasons_processed') int reasonsProcessed, String? method
});




}
/// @nodoc
class _$BallotSummaryCopyWithImpl<$Res>
    implements $BallotSummaryCopyWith<$Res> {
  _$BallotSummaryCopyWithImpl(this._self, this._then);

  final BallotSummary _self;
  final $Res Function(BallotSummary) _then;

/// Create a copy of BallotSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? summary = null,Object? themes = null,Object? optionThemes = null,Object? reasonsTotal = null,Object? reasonsProcessed = null,Object? method = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SummaryStatus,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String,themes: null == themes ? _self.themes : themes // ignore: cast_nullable_to_non_nullable
as List<BallotThemeModel>,optionThemes: null == optionThemes ? _self.optionThemes : optionThemes // ignore: cast_nullable_to_non_nullable
as List<BallotOptionThemeModel>,reasonsTotal: null == reasonsTotal ? _self.reasonsTotal : reasonsTotal // ignore: cast_nullable_to_non_nullable
as int,reasonsProcessed: null == reasonsProcessed ? _self.reasonsProcessed : reasonsProcessed // ignore: cast_nullable_to_non_nullable
as int,method: freezed == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [BallotSummary].
extension BallotSummaryPatterns on BallotSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BallotSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BallotSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BallotSummary value)  $default,){
final _that = this;
switch (_that) {
case _BallotSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BallotSummary value)?  $default,){
final _that = this;
switch (_that) {
case _BallotSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@SummaryStatusConverter()  SummaryStatus status,  String summary,  List<BallotThemeModel> themes, @JsonKey(name: 'option_themes')  List<BallotOptionThemeModel> optionThemes, @JsonKey(name: 'reasons_total')  int reasonsTotal, @JsonKey(name: 'reasons_processed')  int reasonsProcessed,  String? method)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BallotSummary() when $default != null:
return $default(_that.status,_that.summary,_that.themes,_that.optionThemes,_that.reasonsTotal,_that.reasonsProcessed,_that.method);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@SummaryStatusConverter()  SummaryStatus status,  String summary,  List<BallotThemeModel> themes, @JsonKey(name: 'option_themes')  List<BallotOptionThemeModel> optionThemes, @JsonKey(name: 'reasons_total')  int reasonsTotal, @JsonKey(name: 'reasons_processed')  int reasonsProcessed,  String? method)  $default,) {final _that = this;
switch (_that) {
case _BallotSummary():
return $default(_that.status,_that.summary,_that.themes,_that.optionThemes,_that.reasonsTotal,_that.reasonsProcessed,_that.method);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@SummaryStatusConverter()  SummaryStatus status,  String summary,  List<BallotThemeModel> themes, @JsonKey(name: 'option_themes')  List<BallotOptionThemeModel> optionThemes, @JsonKey(name: 'reasons_total')  int reasonsTotal, @JsonKey(name: 'reasons_processed')  int reasonsProcessed,  String? method)?  $default,) {final _that = this;
switch (_that) {
case _BallotSummary() when $default != null:
return $default(_that.status,_that.summary,_that.themes,_that.optionThemes,_that.reasonsTotal,_that.reasonsProcessed,_that.method);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BallotSummary implements BallotSummary {
  const _BallotSummary({@SummaryStatusConverter() required this.status, this.summary = '', final  List<BallotThemeModel> themes = const [], @JsonKey(name: 'option_themes') final  List<BallotOptionThemeModel> optionThemes = const [], @JsonKey(name: 'reasons_total') this.reasonsTotal = 0, @JsonKey(name: 'reasons_processed') this.reasonsProcessed = 0, this.method}): _themes = themes,_optionThemes = optionThemes;
  factory _BallotSummary.fromJson(Map<String, dynamic> json) => _$BallotSummaryFromJson(json);

@override@SummaryStatusConverter() final  SummaryStatus status;
@override@JsonKey() final  String summary;
 final  List<BallotThemeModel> _themes;
@override@JsonKey() List<BallotThemeModel> get themes {
  if (_themes is EqualUnmodifiableListView) return _themes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_themes);
}

 final  List<BallotOptionThemeModel> _optionThemes;
@override@JsonKey(name: 'option_themes') List<BallotOptionThemeModel> get optionThemes {
  if (_optionThemes is EqualUnmodifiableListView) return _optionThemes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_optionThemes);
}

@override@JsonKey(name: 'reasons_total') final  int reasonsTotal;
@override@JsonKey(name: 'reasons_processed') final  int reasonsProcessed;
@override final  String? method;

/// Create a copy of BallotSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BallotSummaryCopyWith<_BallotSummary> get copyWith => __$BallotSummaryCopyWithImpl<_BallotSummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BallotSummaryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BallotSummary&&(identical(other.status, status) || other.status == status)&&(identical(other.summary, summary) || other.summary == summary)&&const DeepCollectionEquality().equals(other._themes, _themes)&&const DeepCollectionEquality().equals(other._optionThemes, _optionThemes)&&(identical(other.reasonsTotal, reasonsTotal) || other.reasonsTotal == reasonsTotal)&&(identical(other.reasonsProcessed, reasonsProcessed) || other.reasonsProcessed == reasonsProcessed)&&(identical(other.method, method) || other.method == method));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,summary,const DeepCollectionEquality().hash(_themes),const DeepCollectionEquality().hash(_optionThemes),reasonsTotal,reasonsProcessed,method);

@override
String toString() {
  return 'BallotSummary(status: $status, summary: $summary, themes: $themes, optionThemes: $optionThemes, reasonsTotal: $reasonsTotal, reasonsProcessed: $reasonsProcessed, method: $method)';
}


}

/// @nodoc
abstract mixin class _$BallotSummaryCopyWith<$Res> implements $BallotSummaryCopyWith<$Res> {
  factory _$BallotSummaryCopyWith(_BallotSummary value, $Res Function(_BallotSummary) _then) = __$BallotSummaryCopyWithImpl;
@override @useResult
$Res call({
@SummaryStatusConverter() SummaryStatus status, String summary, List<BallotThemeModel> themes,@JsonKey(name: 'option_themes') List<BallotOptionThemeModel> optionThemes,@JsonKey(name: 'reasons_total') int reasonsTotal,@JsonKey(name: 'reasons_processed') int reasonsProcessed, String? method
});




}
/// @nodoc
class __$BallotSummaryCopyWithImpl<$Res>
    implements _$BallotSummaryCopyWith<$Res> {
  __$BallotSummaryCopyWithImpl(this._self, this._then);

  final _BallotSummary _self;
  final $Res Function(_BallotSummary) _then;

/// Create a copy of BallotSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? summary = null,Object? themes = null,Object? optionThemes = null,Object? reasonsTotal = null,Object? reasonsProcessed = null,Object? method = freezed,}) {
  return _then(_BallotSummary(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as SummaryStatus,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String,themes: null == themes ? _self._themes : themes // ignore: cast_nullable_to_non_nullable
as List<BallotThemeModel>,optionThemes: null == optionThemes ? _self._optionThemes : optionThemes // ignore: cast_nullable_to_non_nullable
as List<BallotOptionThemeModel>,reasonsTotal: null == reasonsTotal ? _self.reasonsTotal : reasonsTotal // ignore: cast_nullable_to_non_nullable
as int,reasonsProcessed: null == reasonsProcessed ? _self.reasonsProcessed : reasonsProcessed // ignore: cast_nullable_to_non_nullable
as int,method: freezed == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$BallotOptionThemeModel {

 String get option; List<BallotThemeModel> get themes;
/// Create a copy of BallotOptionThemeModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BallotOptionThemeModelCopyWith<BallotOptionThemeModel> get copyWith => _$BallotOptionThemeModelCopyWithImpl<BallotOptionThemeModel>(this as BallotOptionThemeModel, _$identity);

  /// Serializes this BallotOptionThemeModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BallotOptionThemeModel&&(identical(other.option, option) || other.option == option)&&const DeepCollectionEquality().equals(other.themes, themes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,option,const DeepCollectionEquality().hash(themes));

@override
String toString() {
  return 'BallotOptionThemeModel(option: $option, themes: $themes)';
}


}

/// @nodoc
abstract mixin class $BallotOptionThemeModelCopyWith<$Res>  {
  factory $BallotOptionThemeModelCopyWith(BallotOptionThemeModel value, $Res Function(BallotOptionThemeModel) _then) = _$BallotOptionThemeModelCopyWithImpl;
@useResult
$Res call({
 String option, List<BallotThemeModel> themes
});




}
/// @nodoc
class _$BallotOptionThemeModelCopyWithImpl<$Res>
    implements $BallotOptionThemeModelCopyWith<$Res> {
  _$BallotOptionThemeModelCopyWithImpl(this._self, this._then);

  final BallotOptionThemeModel _self;
  final $Res Function(BallotOptionThemeModel) _then;

/// Create a copy of BallotOptionThemeModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? option = null,Object? themes = null,}) {
  return _then(_self.copyWith(
option: null == option ? _self.option : option // ignore: cast_nullable_to_non_nullable
as String,themes: null == themes ? _self.themes : themes // ignore: cast_nullable_to_non_nullable
as List<BallotThemeModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [BallotOptionThemeModel].
extension BallotOptionThemeModelPatterns on BallotOptionThemeModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BallotOptionThemeModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BallotOptionThemeModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BallotOptionThemeModel value)  $default,){
final _that = this;
switch (_that) {
case _BallotOptionThemeModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BallotOptionThemeModel value)?  $default,){
final _that = this;
switch (_that) {
case _BallotOptionThemeModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String option,  List<BallotThemeModel> themes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BallotOptionThemeModel() when $default != null:
return $default(_that.option,_that.themes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String option,  List<BallotThemeModel> themes)  $default,) {final _that = this;
switch (_that) {
case _BallotOptionThemeModel():
return $default(_that.option,_that.themes);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String option,  List<BallotThemeModel> themes)?  $default,) {final _that = this;
switch (_that) {
case _BallotOptionThemeModel() when $default != null:
return $default(_that.option,_that.themes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BallotOptionThemeModel implements BallotOptionThemeModel {
  const _BallotOptionThemeModel({required this.option, final  List<BallotThemeModel> themes = const []}): _themes = themes;
  factory _BallotOptionThemeModel.fromJson(Map<String, dynamic> json) => _$BallotOptionThemeModelFromJson(json);

@override final  String option;
 final  List<BallotThemeModel> _themes;
@override@JsonKey() List<BallotThemeModel> get themes {
  if (_themes is EqualUnmodifiableListView) return _themes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_themes);
}


/// Create a copy of BallotOptionThemeModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BallotOptionThemeModelCopyWith<_BallotOptionThemeModel> get copyWith => __$BallotOptionThemeModelCopyWithImpl<_BallotOptionThemeModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BallotOptionThemeModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BallotOptionThemeModel&&(identical(other.option, option) || other.option == option)&&const DeepCollectionEquality().equals(other._themes, _themes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,option,const DeepCollectionEquality().hash(_themes));

@override
String toString() {
  return 'BallotOptionThemeModel(option: $option, themes: $themes)';
}


}

/// @nodoc
abstract mixin class _$BallotOptionThemeModelCopyWith<$Res> implements $BallotOptionThemeModelCopyWith<$Res> {
  factory _$BallotOptionThemeModelCopyWith(_BallotOptionThemeModel value, $Res Function(_BallotOptionThemeModel) _then) = __$BallotOptionThemeModelCopyWithImpl;
@override @useResult
$Res call({
 String option, List<BallotThemeModel> themes
});




}
/// @nodoc
class __$BallotOptionThemeModelCopyWithImpl<$Res>
    implements _$BallotOptionThemeModelCopyWith<$Res> {
  __$BallotOptionThemeModelCopyWithImpl(this._self, this._then);

  final _BallotOptionThemeModel _self;
  final $Res Function(_BallotOptionThemeModel) _then;

/// Create a copy of BallotOptionThemeModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? option = null,Object? themes = null,}) {
  return _then(_BallotOptionThemeModel(
option: null == option ? _self.option : option // ignore: cast_nullable_to_non_nullable
as String,themes: null == themes ? _self._themes : themes // ignore: cast_nullable_to_non_nullable
as List<BallotThemeModel>,
  ));
}


}


/// @nodoc
mixin _$BallotThemeModel {

 String get name; List<String> get examples; int get mentions; String get sentiment;
/// Create a copy of BallotThemeModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BallotThemeModelCopyWith<BallotThemeModel> get copyWith => _$BallotThemeModelCopyWithImpl<BallotThemeModel>(this as BallotThemeModel, _$identity);

  /// Serializes this BallotThemeModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BallotThemeModel&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.examples, examples)&&(identical(other.mentions, mentions) || other.mentions == mentions)&&(identical(other.sentiment, sentiment) || other.sentiment == sentiment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,const DeepCollectionEquality().hash(examples),mentions,sentiment);

@override
String toString() {
  return 'BallotThemeModel(name: $name, examples: $examples, mentions: $mentions, sentiment: $sentiment)';
}


}

/// @nodoc
abstract mixin class $BallotThemeModelCopyWith<$Res>  {
  factory $BallotThemeModelCopyWith(BallotThemeModel value, $Res Function(BallotThemeModel) _then) = _$BallotThemeModelCopyWithImpl;
@useResult
$Res call({
 String name, List<String> examples, int mentions, String sentiment
});




}
/// @nodoc
class _$BallotThemeModelCopyWithImpl<$Res>
    implements $BallotThemeModelCopyWith<$Res> {
  _$BallotThemeModelCopyWithImpl(this._self, this._then);

  final BallotThemeModel _self;
  final $Res Function(BallotThemeModel) _then;

/// Create a copy of BallotThemeModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? examples = null,Object? mentions = null,Object? sentiment = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,examples: null == examples ? _self.examples : examples // ignore: cast_nullable_to_non_nullable
as List<String>,mentions: null == mentions ? _self.mentions : mentions // ignore: cast_nullable_to_non_nullable
as int,sentiment: null == sentiment ? _self.sentiment : sentiment // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [BallotThemeModel].
extension BallotThemeModelPatterns on BallotThemeModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BallotThemeModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BallotThemeModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BallotThemeModel value)  $default,){
final _that = this;
switch (_that) {
case _BallotThemeModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BallotThemeModel value)?  $default,){
final _that = this;
switch (_that) {
case _BallotThemeModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  List<String> examples,  int mentions,  String sentiment)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BallotThemeModel() when $default != null:
return $default(_that.name,_that.examples,_that.mentions,_that.sentiment);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  List<String> examples,  int mentions,  String sentiment)  $default,) {final _that = this;
switch (_that) {
case _BallotThemeModel():
return $default(_that.name,_that.examples,_that.mentions,_that.sentiment);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  List<String> examples,  int mentions,  String sentiment)?  $default,) {final _that = this;
switch (_that) {
case _BallotThemeModel() when $default != null:
return $default(_that.name,_that.examples,_that.mentions,_that.sentiment);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BallotThemeModel implements BallotThemeModel {
  const _BallotThemeModel({required this.name, final  List<String> examples = const [], this.mentions = 0, this.sentiment = 'neutral'}): _examples = examples;
  factory _BallotThemeModel.fromJson(Map<String, dynamic> json) => _$BallotThemeModelFromJson(json);

@override final  String name;
 final  List<String> _examples;
@override@JsonKey() List<String> get examples {
  if (_examples is EqualUnmodifiableListView) return _examples;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_examples);
}

@override@JsonKey() final  int mentions;
@override@JsonKey() final  String sentiment;

/// Create a copy of BallotThemeModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BallotThemeModelCopyWith<_BallotThemeModel> get copyWith => __$BallotThemeModelCopyWithImpl<_BallotThemeModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BallotThemeModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BallotThemeModel&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other._examples, _examples)&&(identical(other.mentions, mentions) || other.mentions == mentions)&&(identical(other.sentiment, sentiment) || other.sentiment == sentiment));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,const DeepCollectionEquality().hash(_examples),mentions,sentiment);

@override
String toString() {
  return 'BallotThemeModel(name: $name, examples: $examples, mentions: $mentions, sentiment: $sentiment)';
}


}

/// @nodoc
abstract mixin class _$BallotThemeModelCopyWith<$Res> implements $BallotThemeModelCopyWith<$Res> {
  factory _$BallotThemeModelCopyWith(_BallotThemeModel value, $Res Function(_BallotThemeModel) _then) = __$BallotThemeModelCopyWithImpl;
@override @useResult
$Res call({
 String name, List<String> examples, int mentions, String sentiment
});




}
/// @nodoc
class __$BallotThemeModelCopyWithImpl<$Res>
    implements _$BallotThemeModelCopyWith<$Res> {
  __$BallotThemeModelCopyWithImpl(this._self, this._then);

  final _BallotThemeModel _self;
  final $Res Function(_BallotThemeModel) _then;

/// Create a copy of BallotThemeModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? examples = null,Object? mentions = null,Object? sentiment = null,}) {
  return _then(_BallotThemeModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,examples: null == examples ? _self._examples : examples // ignore: cast_nullable_to_non_nullable
as List<String>,mentions: null == mentions ? _self.mentions : mentions // ignore: cast_nullable_to_non_nullable
as int,sentiment: null == sentiment ? _self.sentiment : sentiment // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
