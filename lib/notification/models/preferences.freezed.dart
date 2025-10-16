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

@JsonKey(name: 'allow_notifications') bool get allowNotifications;@JsonKey(name: 'allow_follow_notifications') bool get allowFollowNotifications;@JsonKey(name: 'allow_tag_notifications') bool get allowTagNotifications;@JsonKey(name: 'allow_like_notifications') bool get allowLikeNotifications;@JsonKey(name: 'allow_reply_notifications') bool get allowReplyNotifications;@JsonKey(name: 'allow_repost_notifications') bool get allowRepostNotifications;@JsonKey(name: 'allow_message_notifications') bool get allowMessageNotifications;
/// Create a copy of Preferences
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PreferencesCopyWith<Preferences> get copyWith => _$PreferencesCopyWithImpl<Preferences>(this as Preferences, _$identity);

  /// Serializes this Preferences to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Preferences&&(identical(other.allowNotifications, allowNotifications) || other.allowNotifications == allowNotifications)&&(identical(other.allowFollowNotifications, allowFollowNotifications) || other.allowFollowNotifications == allowFollowNotifications)&&(identical(other.allowTagNotifications, allowTagNotifications) || other.allowTagNotifications == allowTagNotifications)&&(identical(other.allowLikeNotifications, allowLikeNotifications) || other.allowLikeNotifications == allowLikeNotifications)&&(identical(other.allowReplyNotifications, allowReplyNotifications) || other.allowReplyNotifications == allowReplyNotifications)&&(identical(other.allowRepostNotifications, allowRepostNotifications) || other.allowRepostNotifications == allowRepostNotifications)&&(identical(other.allowMessageNotifications, allowMessageNotifications) || other.allowMessageNotifications == allowMessageNotifications));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,allowNotifications,allowFollowNotifications,allowTagNotifications,allowLikeNotifications,allowReplyNotifications,allowRepostNotifications,allowMessageNotifications);

@override
String toString() {
  return 'Preferences(allowNotifications: $allowNotifications, allowFollowNotifications: $allowFollowNotifications, allowTagNotifications: $allowTagNotifications, allowLikeNotifications: $allowLikeNotifications, allowReplyNotifications: $allowReplyNotifications, allowRepostNotifications: $allowRepostNotifications, allowMessageNotifications: $allowMessageNotifications)';
}


}

/// @nodoc
abstract mixin class $PreferencesCopyWith<$Res>  {
  factory $PreferencesCopyWith(Preferences value, $Res Function(Preferences) _then) = _$PreferencesCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'allow_notifications') bool allowNotifications,@JsonKey(name: 'allow_follow_notifications') bool allowFollowNotifications,@JsonKey(name: 'allow_tag_notifications') bool allowTagNotifications,@JsonKey(name: 'allow_like_notifications') bool allowLikeNotifications,@JsonKey(name: 'allow_reply_notifications') bool allowReplyNotifications,@JsonKey(name: 'allow_repost_notifications') bool allowRepostNotifications,@JsonKey(name: 'allow_message_notifications') bool allowMessageNotifications
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
@pragma('vm:prefer-inline') @override $Res call({Object? allowNotifications = null,Object? allowFollowNotifications = null,Object? allowTagNotifications = null,Object? allowLikeNotifications = null,Object? allowReplyNotifications = null,Object? allowRepostNotifications = null,Object? allowMessageNotifications = null,}) {
  return _then(_self.copyWith(
allowNotifications: null == allowNotifications ? _self.allowNotifications : allowNotifications // ignore: cast_nullable_to_non_nullable
as bool,allowFollowNotifications: null == allowFollowNotifications ? _self.allowFollowNotifications : allowFollowNotifications // ignore: cast_nullable_to_non_nullable
as bool,allowTagNotifications: null == allowTagNotifications ? _self.allowTagNotifications : allowTagNotifications // ignore: cast_nullable_to_non_nullable
as bool,allowLikeNotifications: null == allowLikeNotifications ? _self.allowLikeNotifications : allowLikeNotifications // ignore: cast_nullable_to_non_nullable
as bool,allowReplyNotifications: null == allowReplyNotifications ? _self.allowReplyNotifications : allowReplyNotifications // ignore: cast_nullable_to_non_nullable
as bool,allowRepostNotifications: null == allowRepostNotifications ? _self.allowRepostNotifications : allowRepostNotifications // ignore: cast_nullable_to_non_nullable
as bool,allowMessageNotifications: null == allowMessageNotifications ? _self.allowMessageNotifications : allowMessageNotifications // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'allow_notifications')  bool allowNotifications, @JsonKey(name: 'allow_follow_notifications')  bool allowFollowNotifications, @JsonKey(name: 'allow_tag_notifications')  bool allowTagNotifications, @JsonKey(name: 'allow_like_notifications')  bool allowLikeNotifications, @JsonKey(name: 'allow_reply_notifications')  bool allowReplyNotifications, @JsonKey(name: 'allow_repost_notifications')  bool allowRepostNotifications, @JsonKey(name: 'allow_message_notifications')  bool allowMessageNotifications)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Preferences() when $default != null:
return $default(_that.allowNotifications,_that.allowFollowNotifications,_that.allowTagNotifications,_that.allowLikeNotifications,_that.allowReplyNotifications,_that.allowRepostNotifications,_that.allowMessageNotifications);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'allow_notifications')  bool allowNotifications, @JsonKey(name: 'allow_follow_notifications')  bool allowFollowNotifications, @JsonKey(name: 'allow_tag_notifications')  bool allowTagNotifications, @JsonKey(name: 'allow_like_notifications')  bool allowLikeNotifications, @JsonKey(name: 'allow_reply_notifications')  bool allowReplyNotifications, @JsonKey(name: 'allow_repost_notifications')  bool allowRepostNotifications, @JsonKey(name: 'allow_message_notifications')  bool allowMessageNotifications)  $default,) {final _that = this;
switch (_that) {
case _Preferences():
return $default(_that.allowNotifications,_that.allowFollowNotifications,_that.allowTagNotifications,_that.allowLikeNotifications,_that.allowReplyNotifications,_that.allowRepostNotifications,_that.allowMessageNotifications);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'allow_notifications')  bool allowNotifications, @JsonKey(name: 'allow_follow_notifications')  bool allowFollowNotifications, @JsonKey(name: 'allow_tag_notifications')  bool allowTagNotifications, @JsonKey(name: 'allow_like_notifications')  bool allowLikeNotifications, @JsonKey(name: 'allow_reply_notifications')  bool allowReplyNotifications, @JsonKey(name: 'allow_repost_notifications')  bool allowRepostNotifications, @JsonKey(name: 'allow_message_notifications')  bool allowMessageNotifications)?  $default,) {final _that = this;
switch (_that) {
case _Preferences() when $default != null:
return $default(_that.allowNotifications,_that.allowFollowNotifications,_that.allowTagNotifications,_that.allowLikeNotifications,_that.allowReplyNotifications,_that.allowRepostNotifications,_that.allowMessageNotifications);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Preferences implements Preferences {
  const _Preferences({@JsonKey(name: 'allow_notifications') required this.allowNotifications, @JsonKey(name: 'allow_follow_notifications') required this.allowFollowNotifications, @JsonKey(name: 'allow_tag_notifications') required this.allowTagNotifications, @JsonKey(name: 'allow_like_notifications') required this.allowLikeNotifications, @JsonKey(name: 'allow_reply_notifications') required this.allowReplyNotifications, @JsonKey(name: 'allow_repost_notifications') required this.allowRepostNotifications, @JsonKey(name: 'allow_message_notifications') required this.allowMessageNotifications});
  factory _Preferences.fromJson(Map<String, dynamic> json) => _$PreferencesFromJson(json);

@override@JsonKey(name: 'allow_notifications') final  bool allowNotifications;
@override@JsonKey(name: 'allow_follow_notifications') final  bool allowFollowNotifications;
@override@JsonKey(name: 'allow_tag_notifications') final  bool allowTagNotifications;
@override@JsonKey(name: 'allow_like_notifications') final  bool allowLikeNotifications;
@override@JsonKey(name: 'allow_reply_notifications') final  bool allowReplyNotifications;
@override@JsonKey(name: 'allow_repost_notifications') final  bool allowRepostNotifications;
@override@JsonKey(name: 'allow_message_notifications') final  bool allowMessageNotifications;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Preferences&&(identical(other.allowNotifications, allowNotifications) || other.allowNotifications == allowNotifications)&&(identical(other.allowFollowNotifications, allowFollowNotifications) || other.allowFollowNotifications == allowFollowNotifications)&&(identical(other.allowTagNotifications, allowTagNotifications) || other.allowTagNotifications == allowTagNotifications)&&(identical(other.allowLikeNotifications, allowLikeNotifications) || other.allowLikeNotifications == allowLikeNotifications)&&(identical(other.allowReplyNotifications, allowReplyNotifications) || other.allowReplyNotifications == allowReplyNotifications)&&(identical(other.allowRepostNotifications, allowRepostNotifications) || other.allowRepostNotifications == allowRepostNotifications)&&(identical(other.allowMessageNotifications, allowMessageNotifications) || other.allowMessageNotifications == allowMessageNotifications));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,allowNotifications,allowFollowNotifications,allowTagNotifications,allowLikeNotifications,allowReplyNotifications,allowRepostNotifications,allowMessageNotifications);

@override
String toString() {
  return 'Preferences(allowNotifications: $allowNotifications, allowFollowNotifications: $allowFollowNotifications, allowTagNotifications: $allowTagNotifications, allowLikeNotifications: $allowLikeNotifications, allowReplyNotifications: $allowReplyNotifications, allowRepostNotifications: $allowRepostNotifications, allowMessageNotifications: $allowMessageNotifications)';
}


}

/// @nodoc
abstract mixin class _$PreferencesCopyWith<$Res> implements $PreferencesCopyWith<$Res> {
  factory _$PreferencesCopyWith(_Preferences value, $Res Function(_Preferences) _then) = __$PreferencesCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'allow_notifications') bool allowNotifications,@JsonKey(name: 'allow_follow_notifications') bool allowFollowNotifications,@JsonKey(name: 'allow_tag_notifications') bool allowTagNotifications,@JsonKey(name: 'allow_like_notifications') bool allowLikeNotifications,@JsonKey(name: 'allow_reply_notifications') bool allowReplyNotifications,@JsonKey(name: 'allow_repost_notifications') bool allowRepostNotifications,@JsonKey(name: 'allow_message_notifications') bool allowMessageNotifications
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
@override @pragma('vm:prefer-inline') $Res call({Object? allowNotifications = null,Object? allowFollowNotifications = null,Object? allowTagNotifications = null,Object? allowLikeNotifications = null,Object? allowReplyNotifications = null,Object? allowRepostNotifications = null,Object? allowMessageNotifications = null,}) {
  return _then(_Preferences(
allowNotifications: null == allowNotifications ? _self.allowNotifications : allowNotifications // ignore: cast_nullable_to_non_nullable
as bool,allowFollowNotifications: null == allowFollowNotifications ? _self.allowFollowNotifications : allowFollowNotifications // ignore: cast_nullable_to_non_nullable
as bool,allowTagNotifications: null == allowTagNotifications ? _self.allowTagNotifications : allowTagNotifications // ignore: cast_nullable_to_non_nullable
as bool,allowLikeNotifications: null == allowLikeNotifications ? _self.allowLikeNotifications : allowLikeNotifications // ignore: cast_nullable_to_non_nullable
as bool,allowReplyNotifications: null == allowReplyNotifications ? _self.allowReplyNotifications : allowReplyNotifications // ignore: cast_nullable_to_non_nullable
as bool,allowRepostNotifications: null == allowRepostNotifications ? _self.allowRepostNotifications : allowRepostNotifications // ignore: cast_nullable_to_non_nullable
as bool,allowMessageNotifications: null == allowMessageNotifications ? _self.allowMessageNotifications : allowMessageNotifications // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
