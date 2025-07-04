// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Response {

 int get id;@JsonKey(name: 'start_time') DateTime get startTime;@JsonKey(name: 'end_time') DateTime get endTime;@JsonKey(name: 'choice_answers') List<ChoiceAnswer> get choiceAnswers;@JsonKey(name: 'text_answers') List<TextAnswer> get textAnswers;
/// Create a copy of Response
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResponseCopyWith<Response> get copyWith => _$ResponseCopyWithImpl<Response>(this as Response, _$identity);

  /// Serializes this Response to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Response&&(identical(other.id, id) || other.id == id)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&const DeepCollectionEquality().equals(other.choiceAnswers, choiceAnswers)&&const DeepCollectionEquality().equals(other.textAnswers, textAnswers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,startTime,endTime,const DeepCollectionEquality().hash(choiceAnswers),const DeepCollectionEquality().hash(textAnswers));

@override
String toString() {
  return 'Response(id: $id, startTime: $startTime, endTime: $endTime, choiceAnswers: $choiceAnswers, textAnswers: $textAnswers)';
}


}

/// @nodoc
abstract mixin class $ResponseCopyWith<$Res>  {
  factory $ResponseCopyWith(Response value, $Res Function(Response) _then) = _$ResponseCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'start_time') DateTime startTime,@JsonKey(name: 'end_time') DateTime endTime,@JsonKey(name: 'choice_answers') List<ChoiceAnswer> choiceAnswers,@JsonKey(name: 'text_answers') List<TextAnswer> textAnswers
});




}
/// @nodoc
class _$ResponseCopyWithImpl<$Res>
    implements $ResponseCopyWith<$Res> {
  _$ResponseCopyWithImpl(this._self, this._then);

  final Response _self;
  final $Res Function(Response) _then;

/// Create a copy of Response
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? startTime = null,Object? endTime = null,Object? choiceAnswers = null,Object? textAnswers = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as DateTime,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as DateTime,choiceAnswers: null == choiceAnswers ? _self.choiceAnswers : choiceAnswers // ignore: cast_nullable_to_non_nullable
as List<ChoiceAnswer>,textAnswers: null == textAnswers ? _self.textAnswers : textAnswers // ignore: cast_nullable_to_non_nullable
as List<TextAnswer>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Response implements Response {
  const _Response({required this.id, @JsonKey(name: 'start_time') required this.startTime, @JsonKey(name: 'end_time') required this.endTime, @JsonKey(name: 'choice_answers') required final  List<ChoiceAnswer> choiceAnswers, @JsonKey(name: 'text_answers') required final  List<TextAnswer> textAnswers}): _choiceAnswers = choiceAnswers,_textAnswers = textAnswers;
  factory _Response.fromJson(Map<String, dynamic> json) => _$ResponseFromJson(json);

@override final  int id;
@override@JsonKey(name: 'start_time') final  DateTime startTime;
@override@JsonKey(name: 'end_time') final  DateTime endTime;
 final  List<ChoiceAnswer> _choiceAnswers;
@override@JsonKey(name: 'choice_answers') List<ChoiceAnswer> get choiceAnswers {
  if (_choiceAnswers is EqualUnmodifiableListView) return _choiceAnswers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_choiceAnswers);
}

 final  List<TextAnswer> _textAnswers;
@override@JsonKey(name: 'text_answers') List<TextAnswer> get textAnswers {
  if (_textAnswers is EqualUnmodifiableListView) return _textAnswers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_textAnswers);
}


/// Create a copy of Response
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResponseCopyWith<_Response> get copyWith => __$ResponseCopyWithImpl<_Response>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Response&&(identical(other.id, id) || other.id == id)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&const DeepCollectionEquality().equals(other._choiceAnswers, _choiceAnswers)&&const DeepCollectionEquality().equals(other._textAnswers, _textAnswers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,startTime,endTime,const DeepCollectionEquality().hash(_choiceAnswers),const DeepCollectionEquality().hash(_textAnswers));

@override
String toString() {
  return 'Response(id: $id, startTime: $startTime, endTime: $endTime, choiceAnswers: $choiceAnswers, textAnswers: $textAnswers)';
}


}

/// @nodoc
abstract mixin class _$ResponseCopyWith<$Res> implements $ResponseCopyWith<$Res> {
  factory _$ResponseCopyWith(_Response value, $Res Function(_Response) _then) = __$ResponseCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'start_time') DateTime startTime,@JsonKey(name: 'end_time') DateTime endTime,@JsonKey(name: 'choice_answers') List<ChoiceAnswer> choiceAnswers,@JsonKey(name: 'text_answers') List<TextAnswer> textAnswers
});




}
/// @nodoc
class __$ResponseCopyWithImpl<$Res>
    implements _$ResponseCopyWith<$Res> {
  __$ResponseCopyWithImpl(this._self, this._then);

  final _Response _self;
  final $Res Function(_Response) _then;

/// Create a copy of Response
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? startTime = null,Object? endTime = null,Object? choiceAnswers = null,Object? textAnswers = null,}) {
  return _then(_Response(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as DateTime,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as DateTime,choiceAnswers: null == choiceAnswers ? _self._choiceAnswers : choiceAnswers // ignore: cast_nullable_to_non_nullable
as List<ChoiceAnswer>,textAnswers: null == textAnswers ? _self._textAnswers : textAnswers // ignore: cast_nullable_to_non_nullable
as List<TextAnswer>,
  ));
}


}

// dart format on
