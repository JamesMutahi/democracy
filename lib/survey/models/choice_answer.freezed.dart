// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'choice_answer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChoiceAnswer {

 Question get question; Choice get choice;
/// Create a copy of ChoiceAnswer
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChoiceAnswerCopyWith<ChoiceAnswer> get copyWith => _$ChoiceAnswerCopyWithImpl<ChoiceAnswer>(this as ChoiceAnswer, _$identity);

  /// Serializes this ChoiceAnswer to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChoiceAnswer&&(identical(other.question, question) || other.question == question)&&(identical(other.choice, choice) || other.choice == choice));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,question,choice);

@override
String toString() {
  return 'ChoiceAnswer(question: $question, choice: $choice)';
}


}

/// @nodoc
abstract mixin class $ChoiceAnswerCopyWith<$Res>  {
  factory $ChoiceAnswerCopyWith(ChoiceAnswer value, $Res Function(ChoiceAnswer) _then) = _$ChoiceAnswerCopyWithImpl;
@useResult
$Res call({
 Question question, Choice choice
});


$QuestionCopyWith<$Res> get question;$ChoiceCopyWith<$Res> get choice;

}
/// @nodoc
class _$ChoiceAnswerCopyWithImpl<$Res>
    implements $ChoiceAnswerCopyWith<$Res> {
  _$ChoiceAnswerCopyWithImpl(this._self, this._then);

  final ChoiceAnswer _self;
  final $Res Function(ChoiceAnswer) _then;

/// Create a copy of ChoiceAnswer
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? question = null,Object? choice = null,}) {
  return _then(_self.copyWith(
question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as Question,choice: null == choice ? _self.choice : choice // ignore: cast_nullable_to_non_nullable
as Choice,
  ));
}
/// Create a copy of ChoiceAnswer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QuestionCopyWith<$Res> get question {
  
  return $QuestionCopyWith<$Res>(_self.question, (value) {
    return _then(_self.copyWith(question: value));
  });
}/// Create a copy of ChoiceAnswer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChoiceCopyWith<$Res> get choice {
  
  return $ChoiceCopyWith<$Res>(_self.choice, (value) {
    return _then(_self.copyWith(choice: value));
  });
}
}


/// Adds pattern-matching-related methods to [ChoiceAnswer].
extension ChoiceAnswerPatterns on ChoiceAnswer {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChoiceAnswer value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChoiceAnswer() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChoiceAnswer value)  $default,){
final _that = this;
switch (_that) {
case _ChoiceAnswer():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChoiceAnswer value)?  $default,){
final _that = this;
switch (_that) {
case _ChoiceAnswer() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Question question,  Choice choice)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChoiceAnswer() when $default != null:
return $default(_that.question,_that.choice);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Question question,  Choice choice)  $default,) {final _that = this;
switch (_that) {
case _ChoiceAnswer():
return $default(_that.question,_that.choice);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Question question,  Choice choice)?  $default,) {final _that = this;
switch (_that) {
case _ChoiceAnswer() when $default != null:
return $default(_that.question,_that.choice);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChoiceAnswer implements ChoiceAnswer {
  const _ChoiceAnswer({required this.question, required this.choice});
  factory _ChoiceAnswer.fromJson(Map<String, dynamic> json) => _$ChoiceAnswerFromJson(json);

@override final  Question question;
@override final  Choice choice;

/// Create a copy of ChoiceAnswer
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChoiceAnswerCopyWith<_ChoiceAnswer> get copyWith => __$ChoiceAnswerCopyWithImpl<_ChoiceAnswer>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChoiceAnswerToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChoiceAnswer&&(identical(other.question, question) || other.question == question)&&(identical(other.choice, choice) || other.choice == choice));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,question,choice);

@override
String toString() {
  return 'ChoiceAnswer(question: $question, choice: $choice)';
}


}

/// @nodoc
abstract mixin class _$ChoiceAnswerCopyWith<$Res> implements $ChoiceAnswerCopyWith<$Res> {
  factory _$ChoiceAnswerCopyWith(_ChoiceAnswer value, $Res Function(_ChoiceAnswer) _then) = __$ChoiceAnswerCopyWithImpl;
@override @useResult
$Res call({
 Question question, Choice choice
});


@override $QuestionCopyWith<$Res> get question;@override $ChoiceCopyWith<$Res> get choice;

}
/// @nodoc
class __$ChoiceAnswerCopyWithImpl<$Res>
    implements _$ChoiceAnswerCopyWith<$Res> {
  __$ChoiceAnswerCopyWithImpl(this._self, this._then);

  final _ChoiceAnswer _self;
  final $Res Function(_ChoiceAnswer) _then;

/// Create a copy of ChoiceAnswer
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? question = null,Object? choice = null,}) {
  return _then(_ChoiceAnswer(
question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as Question,choice: null == choice ? _self.choice : choice // ignore: cast_nullable_to_non_nullable
as Choice,
  ));
}

/// Create a copy of ChoiceAnswer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QuestionCopyWith<$Res> get question {
  
  return $QuestionCopyWith<$Res>(_self.question, (value) {
    return _then(_self.copyWith(question: value));
  });
}/// Create a copy of ChoiceAnswer
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChoiceCopyWith<$Res> get choice {
  
  return $ChoiceCopyWith<$Res>(_self.choice, (value) {
    return _then(_self.copyWith(choice: value));
  });
}
}

// dart format on
