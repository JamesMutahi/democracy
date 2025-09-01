// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ballot.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Ballot {

 int get id; String get title; String get description;@JsonKey(name: 'start_time') DateTime get startTime;@JsonKey(name: 'end_time') DateTime get endTime;@JsonKey(name: 'total_votes') int get totalVotes;@JsonKey(name: 'voted_option') int? get votedOption;@JsonKey(name: 'is_active') bool get isActive; List<Option> get options; Reason? get reason;
/// Create a copy of Ballot
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BallotCopyWith<Ballot> get copyWith => _$BallotCopyWithImpl<Ballot>(this as Ballot, _$identity);

  /// Serializes this Ballot to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Ballot&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.totalVotes, totalVotes) || other.totalVotes == totalVotes)&&(identical(other.votedOption, votedOption) || other.votedOption == votedOption)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&const DeepCollectionEquality().equals(other.options, options)&&(identical(other.reason, reason) || other.reason == reason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,startTime,endTime,totalVotes,votedOption,isActive,const DeepCollectionEquality().hash(options),reason);

@override
String toString() {
  return 'Ballot(id: $id, title: $title, description: $description, startTime: $startTime, endTime: $endTime, totalVotes: $totalVotes, votedOption: $votedOption, isActive: $isActive, options: $options, reason: $reason)';
}


}

/// @nodoc
abstract mixin class $BallotCopyWith<$Res>  {
  factory $BallotCopyWith(Ballot value, $Res Function(Ballot) _then) = _$BallotCopyWithImpl;
@useResult
$Res call({
 int id, String title, String description,@JsonKey(name: 'start_time') DateTime startTime,@JsonKey(name: 'end_time') DateTime endTime,@JsonKey(name: 'total_votes') int totalVotes,@JsonKey(name: 'voted_option') int? votedOption,@JsonKey(name: 'is_active') bool isActive, List<Option> options, Reason? reason
});


$ReasonCopyWith<$Res>? get reason;

}
/// @nodoc
class _$BallotCopyWithImpl<$Res>
    implements $BallotCopyWith<$Res> {
  _$BallotCopyWithImpl(this._self, this._then);

  final Ballot _self;
  final $Res Function(Ballot) _then;

/// Create a copy of Ballot
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = null,Object? startTime = null,Object? endTime = null,Object? totalVotes = null,Object? votedOption = freezed,Object? isActive = null,Object? options = null,Object? reason = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as DateTime,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as DateTime,totalVotes: null == totalVotes ? _self.totalVotes : totalVotes // ignore: cast_nullable_to_non_nullable
as int,votedOption: freezed == votedOption ? _self.votedOption : votedOption // ignore: cast_nullable_to_non_nullable
as int?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,options: null == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as List<Option>,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as Reason?,
  ));
}
/// Create a copy of Ballot
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReasonCopyWith<$Res>? get reason {
    if (_self.reason == null) {
    return null;
  }

  return $ReasonCopyWith<$Res>(_self.reason!, (value) {
    return _then(_self.copyWith(reason: value));
  });
}
}


/// Adds pattern-matching-related methods to [Ballot].
extension BallotPatterns on Ballot {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Ballot value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Ballot() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Ballot value)  $default,){
final _that = this;
switch (_that) {
case _Ballot():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Ballot value)?  $default,){
final _that = this;
switch (_that) {
case _Ballot() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String title,  String description, @JsonKey(name: 'start_time')  DateTime startTime, @JsonKey(name: 'end_time')  DateTime endTime, @JsonKey(name: 'total_votes')  int totalVotes, @JsonKey(name: 'voted_option')  int? votedOption, @JsonKey(name: 'is_active')  bool isActive,  List<Option> options,  Reason? reason)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Ballot() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.startTime,_that.endTime,_that.totalVotes,_that.votedOption,_that.isActive,_that.options,_that.reason);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String title,  String description, @JsonKey(name: 'start_time')  DateTime startTime, @JsonKey(name: 'end_time')  DateTime endTime, @JsonKey(name: 'total_votes')  int totalVotes, @JsonKey(name: 'voted_option')  int? votedOption, @JsonKey(name: 'is_active')  bool isActive,  List<Option> options,  Reason? reason)  $default,) {final _that = this;
switch (_that) {
case _Ballot():
return $default(_that.id,_that.title,_that.description,_that.startTime,_that.endTime,_that.totalVotes,_that.votedOption,_that.isActive,_that.options,_that.reason);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String title,  String description, @JsonKey(name: 'start_time')  DateTime startTime, @JsonKey(name: 'end_time')  DateTime endTime, @JsonKey(name: 'total_votes')  int totalVotes, @JsonKey(name: 'voted_option')  int? votedOption, @JsonKey(name: 'is_active')  bool isActive,  List<Option> options,  Reason? reason)?  $default,) {final _that = this;
switch (_that) {
case _Ballot() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.startTime,_that.endTime,_that.totalVotes,_that.votedOption,_that.isActive,_that.options,_that.reason);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Ballot implements Ballot {
  const _Ballot({required this.id, required this.title, required this.description, @JsonKey(name: 'start_time') required this.startTime, @JsonKey(name: 'end_time') required this.endTime, @JsonKey(name: 'total_votes') required this.totalVotes, @JsonKey(name: 'voted_option') required this.votedOption, @JsonKey(name: 'is_active') required this.isActive, required final  List<Option> options, required this.reason}): _options = options;
  factory _Ballot.fromJson(Map<String, dynamic> json) => _$BallotFromJson(json);

@override final  int id;
@override final  String title;
@override final  String description;
@override@JsonKey(name: 'start_time') final  DateTime startTime;
@override@JsonKey(name: 'end_time') final  DateTime endTime;
@override@JsonKey(name: 'total_votes') final  int totalVotes;
@override@JsonKey(name: 'voted_option') final  int? votedOption;
@override@JsonKey(name: 'is_active') final  bool isActive;
 final  List<Option> _options;
@override List<Option> get options {
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_options);
}

@override final  Reason? reason;

/// Create a copy of Ballot
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BallotCopyWith<_Ballot> get copyWith => __$BallotCopyWithImpl<_Ballot>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BallotToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Ballot&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.totalVotes, totalVotes) || other.totalVotes == totalVotes)&&(identical(other.votedOption, votedOption) || other.votedOption == votedOption)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&const DeepCollectionEquality().equals(other._options, _options)&&(identical(other.reason, reason) || other.reason == reason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,startTime,endTime,totalVotes,votedOption,isActive,const DeepCollectionEquality().hash(_options),reason);

@override
String toString() {
  return 'Ballot(id: $id, title: $title, description: $description, startTime: $startTime, endTime: $endTime, totalVotes: $totalVotes, votedOption: $votedOption, isActive: $isActive, options: $options, reason: $reason)';
}


}

/// @nodoc
abstract mixin class _$BallotCopyWith<$Res> implements $BallotCopyWith<$Res> {
  factory _$BallotCopyWith(_Ballot value, $Res Function(_Ballot) _then) = __$BallotCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, String description,@JsonKey(name: 'start_time') DateTime startTime,@JsonKey(name: 'end_time') DateTime endTime,@JsonKey(name: 'total_votes') int totalVotes,@JsonKey(name: 'voted_option') int? votedOption,@JsonKey(name: 'is_active') bool isActive, List<Option> options, Reason? reason
});


@override $ReasonCopyWith<$Res>? get reason;

}
/// @nodoc
class __$BallotCopyWithImpl<$Res>
    implements _$BallotCopyWith<$Res> {
  __$BallotCopyWithImpl(this._self, this._then);

  final _Ballot _self;
  final $Res Function(_Ballot) _then;

/// Create a copy of Ballot
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = null,Object? startTime = null,Object? endTime = null,Object? totalVotes = null,Object? votedOption = freezed,Object? isActive = null,Object? options = null,Object? reason = freezed,}) {
  return _then(_Ballot(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as DateTime,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as DateTime,totalVotes: null == totalVotes ? _self.totalVotes : totalVotes // ignore: cast_nullable_to_non_nullable
as int,votedOption: freezed == votedOption ? _self.votedOption : votedOption // ignore: cast_nullable_to_non_nullable
as int?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,options: null == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<Option>,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as Reason?,
  ));
}

/// Create a copy of Ballot
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReasonCopyWith<$Res>? get reason {
    if (_self.reason == null) {
    return null;
  }

  return $ReasonCopyWith<$Res>(_self.reason!, (value) {
    return _then(_self.copyWith(reason: value));
  });
}
}

// dart format on
