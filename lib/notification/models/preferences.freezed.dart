// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'preferences.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Preferences {

@JsonKey(name: 'allow_notifications') bool get allowNotifications;@JsonKey(name: 'follow_notifications') bool get followNotifications;@JsonKey(name: 'tag_notifications') bool get tagNotifications;@JsonKey(name: 'like_notifications') bool get likeNotifications;@JsonKey(name: 'reply_notifications') bool get replyNotifications;@JsonKey(name: 'repost_notifications') bool get repostNotifications;@JsonKey(name: 'message_notifications') bool get messageNotifications;
/// Create a copy of Preferences
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PreferencesCopyWith<Preferences> get copyWith => _$PreferencesCopyWithImpl<Preferences>(this as Preferences, _$identity);

  /// Serializes this Preferences to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Preferences&&(identical(other.allowNotifications, allowNotifications) || other.allowNotifications == allowNotifications)&&(identical(other.followNotifications, followNotifications) || other.followNotifications == followNotifications)&&(identical(other.tagNotifications, tagNotifications) || other.tagNotifications == tagNotifications)&&(identical(other.likeNotifications, likeNotifications) || other.likeNotifications == likeNotifications)&&(identical(other.replyNotifications, replyNotifications) || other.replyNotifications == replyNotifications)&&(identical(other.repostNotifications, repostNotifications) || other.repostNotifications == repostNotifications)&&(identical(other.messageNotifications, messageNotifications) || other.messageNotifications == messageNotifications));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,allowNotifications,followNotifications,tagNotifications,likeNotifications,replyNotifications,repostNotifications,messageNotifications);

@override
String toString() {
  return 'Preferences(allowNotifications: $allowNotifications, followNotifications: $followNotifications, tagNotifications: $tagNotifications, likeNotifications: $likeNotifications, replyNotifications: $replyNotifications, repostNotifications: $repostNotifications, messageNotifications: $messageNotifications)';
}


}

/// @nodoc
abstract mixin class $PreferencesCopyWith<$Res>  {
  factory $PreferencesCopyWith(Preferences value, $Res Function(Preferences) _then) = _$PreferencesCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'allow_notifications') bool allowNotifications,@JsonKey(name: 'follow_notifications') bool followNotifications,@JsonKey(name: 'tag_notifications') bool tagNotifications,@JsonKey(name: 'like_notifications') bool likeNotifications,@JsonKey(name: 'reply_notifications') bool replyNotifications,@JsonKey(name: 'repost_notifications') bool repostNotifications,@JsonKey(name: 'message_notifications') bool messageNotifications
});




}
/// @nodoc
class _$PreferencesCopyWithImpl<$Res>
    implements $PreferencesCopyWith<$Res> {
  _$PreferencesCopyWithImpl(this._self, this._then);

  final Preferences _self;
  final $Res Function(Preferences) _then;

/// Create a copy of Preferences
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? allowNotifications = null,Object? followNotifications = null,Object? tagNotifications = null,Object? likeNotifications = null,Object? replyNotifications = null,Object? repostNotifications = null,Object? messageNotifications = null,}) {
  return _then(_self.copyWith(
allowNotifications: null == allowNotifications ? _self.allowNotifications : allowNotifications // ignore: cast_nullable_to_non_nullable
as bool,followNotifications: null == followNotifications ? _self.followNotifications : followNotifications // ignore: cast_nullable_to_non_nullable
as bool,tagNotifications: null == tagNotifications ? _self.tagNotifications : tagNotifications // ignore: cast_nullable_to_non_nullable
as bool,likeNotifications: null == likeNotifications ? _self.likeNotifications : likeNotifications // ignore: cast_nullable_to_non_nullable
as bool,replyNotifications: null == replyNotifications ? _self.replyNotifications : replyNotifications // ignore: cast_nullable_to_non_nullable
as bool,repostNotifications: null == repostNotifications ? _self.repostNotifications : repostNotifications // ignore: cast_nullable_to_non_nullable
as bool,messageNotifications: null == messageNotifications ? _self.messageNotifications : messageNotifications // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Preferences].
extension PreferencesPatterns on Preferences {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Preferences value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Preferences() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Preferences value)  $default,){
final _that = this;
switch (_that) {
case _Preferences():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Preferences value)?  $default,){
final _that = this;
switch (_that) {
case _Preferences() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'allow_notifications')  bool allowNotifications, @JsonKey(name: 'follow_notifications')  bool followNotifications, @JsonKey(name: 'tag_notifications')  bool tagNotifications, @JsonKey(name: 'like_notifications')  bool likeNotifications, @JsonKey(name: 'reply_notifications')  bool replyNotifications, @JsonKey(name: 'repost_notifications')  bool repostNotifications, @JsonKey(name: 'message_notifications')  bool messageNotifications)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Preferences() when $default != null:
return $default(_that.allowNotifications,_that.followNotifications,_that.tagNotifications,_that.likeNotifications,_that.replyNotifications,_that.repostNotifications,_that.messageNotifications);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'allow_notifications')  bool allowNotifications, @JsonKey(name: 'follow_notifications')  bool followNotifications, @JsonKey(name: 'tag_notifications')  bool tagNotifications, @JsonKey(name: 'like_notifications')  bool likeNotifications, @JsonKey(name: 'reply_notifications')  bool replyNotifications, @JsonKey(name: 'repost_notifications')  bool repostNotifications, @JsonKey(name: 'message_notifications')  bool messageNotifications)  $default,) {final _that = this;
switch (_that) {
case _Preferences():
return $default(_that.allowNotifications,_that.followNotifications,_that.tagNotifications,_that.likeNotifications,_that.replyNotifications,_that.repostNotifications,_that.messageNotifications);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'allow_notifications')  bool allowNotifications, @JsonKey(name: 'follow_notifications')  bool followNotifications, @JsonKey(name: 'tag_notifications')  bool tagNotifications, @JsonKey(name: 'like_notifications')  bool likeNotifications, @JsonKey(name: 'reply_notifications')  bool replyNotifications, @JsonKey(name: 'repost_notifications')  bool repostNotifications, @JsonKey(name: 'message_notifications')  bool messageNotifications)?  $default,) {final _that = this;
switch (_that) {
case _Preferences() when $default != null:
return $default(_that.allowNotifications,_that.followNotifications,_that.tagNotifications,_that.likeNotifications,_that.replyNotifications,_that.repostNotifications,_that.messageNotifications);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Preferences implements Preferences {
  const _Preferences({@JsonKey(name: 'allow_notifications') required this.allowNotifications, @JsonKey(name: 'follow_notifications') required this.followNotifications, @JsonKey(name: 'tag_notifications') required this.tagNotifications, @JsonKey(name: 'like_notifications') required this.likeNotifications, @JsonKey(name: 'reply_notifications') required this.replyNotifications, @JsonKey(name: 'repost_notifications') required this.repostNotifications, @JsonKey(name: 'message_notifications') required this.messageNotifications});
  factory _Preferences.fromJson(Map<String, dynamic> json) => _$PreferencesFromJson(json);

@override@JsonKey(name: 'allow_notifications') final  bool allowNotifications;
@override@JsonKey(name: 'follow_notifications') final  bool followNotifications;
@override@JsonKey(name: 'tag_notifications') final  bool tagNotifications;
@override@JsonKey(name: 'like_notifications') final  bool likeNotifications;
@override@JsonKey(name: 'reply_notifications') final  bool replyNotifications;
@override@JsonKey(name: 'repost_notifications') final  bool repostNotifications;
@override@JsonKey(name: 'message_notifications') final  bool messageNotifications;

/// Create a copy of Preferences
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PreferencesCopyWith<_Preferences> get copyWith => __$PreferencesCopyWithImpl<_Preferences>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PreferencesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Preferences&&(identical(other.allowNotifications, allowNotifications) || other.allowNotifications == allowNotifications)&&(identical(other.followNotifications, followNotifications) || other.followNotifications == followNotifications)&&(identical(other.tagNotifications, tagNotifications) || other.tagNotifications == tagNotifications)&&(identical(other.likeNotifications, likeNotifications) || other.likeNotifications == likeNotifications)&&(identical(other.replyNotifications, replyNotifications) || other.replyNotifications == replyNotifications)&&(identical(other.repostNotifications, repostNotifications) || other.repostNotifications == repostNotifications)&&(identical(other.messageNotifications, messageNotifications) || other.messageNotifications == messageNotifications));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,allowNotifications,followNotifications,tagNotifications,likeNotifications,replyNotifications,repostNotifications,messageNotifications);

@override
String toString() {
  return 'Preferences(allowNotifications: $allowNotifications, followNotifications: $followNotifications, tagNotifications: $tagNotifications, likeNotifications: $likeNotifications, replyNotifications: $replyNotifications, repostNotifications: $repostNotifications, messageNotifications: $messageNotifications)';
}


}

/// @nodoc
abstract mixin class _$PreferencesCopyWith<$Res> implements $PreferencesCopyWith<$Res> {
  factory _$PreferencesCopyWith(_Preferences value, $Res Function(_Preferences) _then) = __$PreferencesCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'allow_notifications') bool allowNotifications,@JsonKey(name: 'follow_notifications') bool followNotifications,@JsonKey(name: 'tag_notifications') bool tagNotifications,@JsonKey(name: 'like_notifications') bool likeNotifications,@JsonKey(name: 'reply_notifications') bool replyNotifications,@JsonKey(name: 'repost_notifications') bool repostNotifications,@JsonKey(name: 'message_notifications') bool messageNotifications
});




}
/// @nodoc
class __$PreferencesCopyWithImpl<$Res>
    implements _$PreferencesCopyWith<$Res> {
  __$PreferencesCopyWithImpl(this._self, this._then);

  final _Preferences _self;
  final $Res Function(_Preferences) _then;

/// Create a copy of Preferences
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? allowNotifications = null,Object? followNotifications = null,Object? tagNotifications = null,Object? likeNotifications = null,Object? replyNotifications = null,Object? repostNotifications = null,Object? messageNotifications = null,}) {
  return _then(_Preferences(
allowNotifications: null == allowNotifications ? _self.allowNotifications : allowNotifications // ignore: cast_nullable_to_non_nullable
as bool,followNotifications: null == followNotifications ? _self.followNotifications : followNotifications // ignore: cast_nullable_to_non_nullable
as bool,tagNotifications: null == tagNotifications ? _self.tagNotifications : tagNotifications // ignore: cast_nullable_to_non_nullable
as bool,likeNotifications: null == likeNotifications ? _self.likeNotifications : likeNotifications // ignore: cast_nullable_to_non_nullable
as bool,replyNotifications: null == replyNotifications ? _self.replyNotifications : replyNotifications // ignore: cast_nullable_to_non_nullable
as bool,repostNotifications: null == repostNotifications ? _self.repostNotifications : repostNotifications // ignore: cast_nullable_to_non_nullable
as bool,messageNotifications: null == messageNotifications ? _self.messageNotifications : messageNotifications // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
