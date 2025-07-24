// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_detail_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MessageDetailState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MessageDetailState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MessageDetailState()';
}


}

/// @nodoc
class $MessageDetailStateCopyWith<$Res>  {
$MessageDetailStateCopyWith(MessageDetailState _, $Res Function(MessageDetailState) __);
}


/// Adds pattern-matching-related methods to [MessageDetailState].
extension MessageDetailStatePatterns on MessageDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MessageDetailInitial value)?  initial,TResult Function( MessageDetailLoading value)?  loading,TResult Function( MessageCreated value)?  created,TResult Function( MessageUpdated value)?  updated,TResult Function( MessageDeleted value)?  deleted,TResult Function( MessageDetailFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MessageDetailInitial() when initial != null:
return initial(_that);case MessageDetailLoading() when loading != null:
return loading(_that);case MessageCreated() when created != null:
return created(_that);case MessageUpdated() when updated != null:
return updated(_that);case MessageDeleted() when deleted != null:
return deleted(_that);case MessageDetailFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MessageDetailInitial value)  initial,required TResult Function( MessageDetailLoading value)  loading,required TResult Function( MessageCreated value)  created,required TResult Function( MessageUpdated value)  updated,required TResult Function( MessageDeleted value)  deleted,required TResult Function( MessageDetailFailure value)  failure,}){
final _that = this;
switch (_that) {
case MessageDetailInitial():
return initial(_that);case MessageDetailLoading():
return loading(_that);case MessageCreated():
return created(_that);case MessageUpdated():
return updated(_that);case MessageDeleted():
return deleted(_that);case MessageDetailFailure():
return failure(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MessageDetailInitial value)?  initial,TResult? Function( MessageDetailLoading value)?  loading,TResult? Function( MessageCreated value)?  created,TResult? Function( MessageUpdated value)?  updated,TResult? Function( MessageDeleted value)?  deleted,TResult? Function( MessageDetailFailure value)?  failure,}){
final _that = this;
switch (_that) {
case MessageDetailInitial() when initial != null:
return initial(_that);case MessageDetailLoading() when loading != null:
return loading(_that);case MessageCreated() when created != null:
return created(_that);case MessageUpdated() when updated != null:
return updated(_that);case MessageDeleted() when deleted != null:
return deleted(_that);case MessageDetailFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( Message message)?  created,TResult Function( Message message)?  updated,TResult Function( int messageId)?  deleted,TResult Function( String error)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MessageDetailInitial() when initial != null:
return initial();case MessageDetailLoading() when loading != null:
return loading();case MessageCreated() when created != null:
return created(_that.message);case MessageUpdated() when updated != null:
return updated(_that.message);case MessageDeleted() when deleted != null:
return deleted(_that.messageId);case MessageDetailFailure() when failure != null:
return failure(_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( Message message)  created,required TResult Function( Message message)  updated,required TResult Function( int messageId)  deleted,required TResult Function( String error)  failure,}) {final _that = this;
switch (_that) {
case MessageDetailInitial():
return initial();case MessageDetailLoading():
return loading();case MessageCreated():
return created(_that.message);case MessageUpdated():
return updated(_that.message);case MessageDeleted():
return deleted(_that.messageId);case MessageDetailFailure():
return failure(_that.error);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( Message message)?  created,TResult? Function( Message message)?  updated,TResult? Function( int messageId)?  deleted,TResult? Function( String error)?  failure,}) {final _that = this;
switch (_that) {
case MessageDetailInitial() when initial != null:
return initial();case MessageDetailLoading() when loading != null:
return loading();case MessageCreated() when created != null:
return created(_that.message);case MessageUpdated() when updated != null:
return updated(_that.message);case MessageDeleted() when deleted != null:
return deleted(_that.messageId);case MessageDetailFailure() when failure != null:
return failure(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class MessageDetailInitial implements MessageDetailState {
  const MessageDetailInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MessageDetailInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MessageDetailState.initial()';
}


}




/// @nodoc


class MessageDetailLoading implements MessageDetailState {
  const MessageDetailLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MessageDetailLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MessageDetailState.loading()';
}


}




/// @nodoc


class MessageCreated implements MessageDetailState {
  const MessageCreated({required this.message});
  

 final  Message message;

/// Create a copy of MessageDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessageCreatedCopyWith<MessageCreated> get copyWith => _$MessageCreatedCopyWithImpl<MessageCreated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MessageCreated&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'MessageDetailState.created(message: $message)';
}


}

/// @nodoc
abstract mixin class $MessageCreatedCopyWith<$Res> implements $MessageDetailStateCopyWith<$Res> {
  factory $MessageCreatedCopyWith(MessageCreated value, $Res Function(MessageCreated) _then) = _$MessageCreatedCopyWithImpl;
@useResult
$Res call({
 Message message
});


$MessageCopyWith<$Res> get message;

}
/// @nodoc
class _$MessageCreatedCopyWithImpl<$Res>
    implements $MessageCreatedCopyWith<$Res> {
  _$MessageCreatedCopyWithImpl(this._self, this._then);

  final MessageCreated _self;
  final $Res Function(MessageCreated) _then;

/// Create a copy of MessageDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(MessageCreated(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as Message,
  ));
}

/// Create a copy of MessageDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MessageCopyWith<$Res> get message {
  
  return $MessageCopyWith<$Res>(_self.message, (value) {
    return _then(_self.copyWith(message: value));
  });
}
}

/// @nodoc


class MessageUpdated implements MessageDetailState {
  const MessageUpdated({required this.message});
  

 final  Message message;

/// Create a copy of MessageDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessageUpdatedCopyWith<MessageUpdated> get copyWith => _$MessageUpdatedCopyWithImpl<MessageUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MessageUpdated&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'MessageDetailState.updated(message: $message)';
}


}

/// @nodoc
abstract mixin class $MessageUpdatedCopyWith<$Res> implements $MessageDetailStateCopyWith<$Res> {
  factory $MessageUpdatedCopyWith(MessageUpdated value, $Res Function(MessageUpdated) _then) = _$MessageUpdatedCopyWithImpl;
@useResult
$Res call({
 Message message
});


$MessageCopyWith<$Res> get message;

}
/// @nodoc
class _$MessageUpdatedCopyWithImpl<$Res>
    implements $MessageUpdatedCopyWith<$Res> {
  _$MessageUpdatedCopyWithImpl(this._self, this._then);

  final MessageUpdated _self;
  final $Res Function(MessageUpdated) _then;

/// Create a copy of MessageDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(MessageUpdated(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as Message,
  ));
}

/// Create a copy of MessageDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MessageCopyWith<$Res> get message {
  
  return $MessageCopyWith<$Res>(_self.message, (value) {
    return _then(_self.copyWith(message: value));
  });
}
}

/// @nodoc


class MessageDeleted implements MessageDetailState {
  const MessageDeleted({required this.messageId});
  

 final  int messageId;

/// Create a copy of MessageDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessageDeletedCopyWith<MessageDeleted> get copyWith => _$MessageDeletedCopyWithImpl<MessageDeleted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MessageDeleted&&(identical(other.messageId, messageId) || other.messageId == messageId));
}


@override
int get hashCode => Object.hash(runtimeType,messageId);

@override
String toString() {
  return 'MessageDetailState.deleted(messageId: $messageId)';
}


}

/// @nodoc
abstract mixin class $MessageDeletedCopyWith<$Res> implements $MessageDetailStateCopyWith<$Res> {
  factory $MessageDeletedCopyWith(MessageDeleted value, $Res Function(MessageDeleted) _then) = _$MessageDeletedCopyWithImpl;
@useResult
$Res call({
 int messageId
});




}
/// @nodoc
class _$MessageDeletedCopyWithImpl<$Res>
    implements $MessageDeletedCopyWith<$Res> {
  _$MessageDeletedCopyWithImpl(this._self, this._then);

  final MessageDeleted _self;
  final $Res Function(MessageDeleted) _then;

/// Create a copy of MessageDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? messageId = null,}) {
  return _then(MessageDeleted(
messageId: null == messageId ? _self.messageId : messageId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class MessageDetailFailure implements MessageDetailState {
  const MessageDetailFailure({required this.error});
  

 final  String error;

/// Create a copy of MessageDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessageDetailFailureCopyWith<MessageDetailFailure> get copyWith => _$MessageDetailFailureCopyWithImpl<MessageDetailFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MessageDetailFailure&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'MessageDetailState.failure(error: $error)';
}


}

/// @nodoc
abstract mixin class $MessageDetailFailureCopyWith<$Res> implements $MessageDetailStateCopyWith<$Res> {
  factory $MessageDetailFailureCopyWith(MessageDetailFailure value, $Res Function(MessageDetailFailure) _then) = _$MessageDetailFailureCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$MessageDetailFailureCopyWithImpl<$Res>
    implements $MessageDetailFailureCopyWith<$Res> {
  _$MessageDetailFailureCopyWithImpl(this._self, this._then);

  final MessageDetailFailure _self;
  final $Res Function(MessageDetailFailure) _then;

/// Create a copy of MessageDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(MessageDetailFailure(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
