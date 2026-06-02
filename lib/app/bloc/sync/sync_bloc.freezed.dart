// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sync_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SyncEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SyncEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SyncEvent()';
}


}

/// @nodoc
class $SyncEventCopyWith<$Res>  {
$SyncEventCopyWith(SyncEvent _, $Res Function(SyncEvent) __);
}


/// Adds pattern-matching-related methods to [SyncEvent].
extension SyncEventPatterns on SyncEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Start value)?  start,TResult Function( _PostDrafts value)?  postDrafts,TResult Function( _UploadPostAssets value)?  uploadPostAssets,TResult Function( _PostMessages value)?  postMessages,TResult Function( _UploadMessageAssets value)?  uploadMessageAssets,TResult Function( _PatchMessages value)?  patchMessages,TResult Function( _DeleteMessages value)?  deleteMessages,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Start() when start != null:
return start(_that);case _PostDrafts() when postDrafts != null:
return postDrafts(_that);case _UploadPostAssets() when uploadPostAssets != null:
return uploadPostAssets(_that);case _PostMessages() when postMessages != null:
return postMessages(_that);case _UploadMessageAssets() when uploadMessageAssets != null:
return uploadMessageAssets(_that);case _PatchMessages() when patchMessages != null:
return patchMessages(_that);case _DeleteMessages() when deleteMessages != null:
return deleteMessages(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Start value)  start,required TResult Function( _PostDrafts value)  postDrafts,required TResult Function( _UploadPostAssets value)  uploadPostAssets,required TResult Function( _PostMessages value)  postMessages,required TResult Function( _UploadMessageAssets value)  uploadMessageAssets,required TResult Function( _PatchMessages value)  patchMessages,required TResult Function( _DeleteMessages value)  deleteMessages,}){
final _that = this;
switch (_that) {
case _Start():
return start(_that);case _PostDrafts():
return postDrafts(_that);case _UploadPostAssets():
return uploadPostAssets(_that);case _PostMessages():
return postMessages(_that);case _UploadMessageAssets():
return uploadMessageAssets(_that);case _PatchMessages():
return patchMessages(_that);case _DeleteMessages():
return deleteMessages(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Start value)?  start,TResult? Function( _PostDrafts value)?  postDrafts,TResult? Function( _UploadPostAssets value)?  uploadPostAssets,TResult? Function( _PostMessages value)?  postMessages,TResult? Function( _UploadMessageAssets value)?  uploadMessageAssets,TResult? Function( _PatchMessages value)?  patchMessages,TResult? Function( _DeleteMessages value)?  deleteMessages,}){
final _that = this;
switch (_that) {
case _Start() when start != null:
return start(_that);case _PostDrafts() when postDrafts != null:
return postDrafts(_that);case _UploadPostAssets() when uploadPostAssets != null:
return uploadPostAssets(_that);case _PostMessages() when postMessages != null:
return postMessages(_that);case _UploadMessageAssets() when uploadMessageAssets != null:
return uploadMessageAssets(_that);case _PatchMessages() when patchMessages != null:
return patchMessages(_that);case _DeleteMessages() when deleteMessages != null:
return deleteMessages(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  start,TResult Function()?  postDrafts,TResult Function()?  uploadPostAssets,TResult Function()?  postMessages,TResult Function()?  uploadMessageAssets,TResult Function()?  patchMessages,TResult Function()?  deleteMessages,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Start() when start != null:
return start();case _PostDrafts() when postDrafts != null:
return postDrafts();case _UploadPostAssets() when uploadPostAssets != null:
return uploadPostAssets();case _PostMessages() when postMessages != null:
return postMessages();case _UploadMessageAssets() when uploadMessageAssets != null:
return uploadMessageAssets();case _PatchMessages() when patchMessages != null:
return patchMessages();case _DeleteMessages() when deleteMessages != null:
return deleteMessages();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  start,required TResult Function()  postDrafts,required TResult Function()  uploadPostAssets,required TResult Function()  postMessages,required TResult Function()  uploadMessageAssets,required TResult Function()  patchMessages,required TResult Function()  deleteMessages,}) {final _that = this;
switch (_that) {
case _Start():
return start();case _PostDrafts():
return postDrafts();case _UploadPostAssets():
return uploadPostAssets();case _PostMessages():
return postMessages();case _UploadMessageAssets():
return uploadMessageAssets();case _PatchMessages():
return patchMessages();case _DeleteMessages():
return deleteMessages();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  start,TResult? Function()?  postDrafts,TResult? Function()?  uploadPostAssets,TResult? Function()?  postMessages,TResult? Function()?  uploadMessageAssets,TResult? Function()?  patchMessages,TResult? Function()?  deleteMessages,}) {final _that = this;
switch (_that) {
case _Start() when start != null:
return start();case _PostDrafts() when postDrafts != null:
return postDrafts();case _UploadPostAssets() when uploadPostAssets != null:
return uploadPostAssets();case _PostMessages() when postMessages != null:
return postMessages();case _UploadMessageAssets() when uploadMessageAssets != null:
return uploadMessageAssets();case _PatchMessages() when patchMessages != null:
return patchMessages();case _DeleteMessages() when deleteMessages != null:
return deleteMessages();case _:
  return null;

}
}

}

/// @nodoc


class _Start implements SyncEvent {
  const _Start();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Start);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SyncEvent.start()';
}


}




/// @nodoc


class _PostDrafts implements SyncEvent {
  const _PostDrafts();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostDrafts);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SyncEvent.postDrafts()';
}


}




/// @nodoc


class _UploadPostAssets implements SyncEvent {
  const _UploadPostAssets();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UploadPostAssets);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SyncEvent.uploadPostAssets()';
}


}




/// @nodoc


class _PostMessages implements SyncEvent {
  const _PostMessages();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostMessages);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SyncEvent.postMessages()';
}


}




/// @nodoc


class _UploadMessageAssets implements SyncEvent {
  const _UploadMessageAssets();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UploadMessageAssets);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SyncEvent.uploadMessageAssets()';
}


}




/// @nodoc


class _PatchMessages implements SyncEvent {
  const _PatchMessages();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PatchMessages);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SyncEvent.patchMessages()';
}


}




/// @nodoc


class _DeleteMessages implements SyncEvent {
  const _DeleteMessages();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeleteMessages);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SyncEvent.deleteMessages()';
}


}




/// @nodoc
mixin _$SyncState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SyncState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SyncState()';
}


}

/// @nodoc
class $SyncStateCopyWith<$Res>  {
$SyncStateCopyWith(SyncState _, $Res Function(SyncState) __);
}


/// Adds pattern-matching-related methods to [SyncState].
extension SyncStatePatterns on SyncState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Syncing value)?  syncing,TResult Function( DraftSynced value)?  draftSynced,TResult Function( MessageSynced value)?  messageSynced,TResult Function( SyncFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Syncing() when syncing != null:
return syncing(_that);case DraftSynced() when draftSynced != null:
return draftSynced(_that);case MessageSynced() when messageSynced != null:
return messageSynced(_that);case SyncFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Syncing value)  syncing,required TResult Function( DraftSynced value)  draftSynced,required TResult Function( MessageSynced value)  messageSynced,required TResult Function( SyncFailure value)  failure,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Syncing():
return syncing(_that);case DraftSynced():
return draftSynced(_that);case MessageSynced():
return messageSynced(_that);case SyncFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Syncing value)?  syncing,TResult? Function( DraftSynced value)?  draftSynced,TResult? Function( MessageSynced value)?  messageSynced,TResult? Function( SyncFailure value)?  failure,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Syncing() when syncing != null:
return syncing(_that);case DraftSynced() when draftSynced != null:
return draftSynced(_that);case MessageSynced() when messageSynced != null:
return messageSynced(_that);case SyncFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  syncing,TResult Function( DraftPost draft)?  draftSynced,TResult Function( Message message)?  messageSynced,TResult Function( String error)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Syncing() when syncing != null:
return syncing();case DraftSynced() when draftSynced != null:
return draftSynced(_that.draft);case MessageSynced() when messageSynced != null:
return messageSynced(_that.message);case SyncFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  syncing,required TResult Function( DraftPost draft)  draftSynced,required TResult Function( Message message)  messageSynced,required TResult Function( String error)  failure,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Syncing():
return syncing();case DraftSynced():
return draftSynced(_that.draft);case MessageSynced():
return messageSynced(_that.message);case SyncFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  syncing,TResult? Function( DraftPost draft)?  draftSynced,TResult? Function( Message message)?  messageSynced,TResult? Function( String error)?  failure,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Syncing() when syncing != null:
return syncing();case DraftSynced() when draftSynced != null:
return draftSynced(_that.draft);case MessageSynced() when messageSynced != null:
return messageSynced(_that.message);case SyncFailure() when failure != null:
return failure(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements SyncState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SyncState.initial()';
}


}




/// @nodoc


class _Syncing implements SyncState {
  const _Syncing();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Syncing);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SyncState.syncing()';
}


}




/// @nodoc


class DraftSynced implements SyncState {
  const DraftSynced({required this.draft});
  

 final  DraftPost draft;

/// Create a copy of SyncState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DraftSyncedCopyWith<DraftSynced> get copyWith => _$DraftSyncedCopyWithImpl<DraftSynced>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DraftSynced&&(identical(other.draft, draft) || other.draft == draft));
}


@override
int get hashCode => Object.hash(runtimeType,draft);

@override
String toString() {
  return 'SyncState.draftSynced(draft: $draft)';
}


}

/// @nodoc
abstract mixin class $DraftSyncedCopyWith<$Res> implements $SyncStateCopyWith<$Res> {
  factory $DraftSyncedCopyWith(DraftSynced value, $Res Function(DraftSynced) _then) = _$DraftSyncedCopyWithImpl;
@useResult
$Res call({
 DraftPost draft
});




}
/// @nodoc
class _$DraftSyncedCopyWithImpl<$Res>
    implements $DraftSyncedCopyWith<$Res> {
  _$DraftSyncedCopyWithImpl(this._self, this._then);

  final DraftSynced _self;
  final $Res Function(DraftSynced) _then;

/// Create a copy of SyncState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? draft = null,}) {
  return _then(DraftSynced(
draft: null == draft ? _self.draft : draft // ignore: cast_nullable_to_non_nullable
as DraftPost,
  ));
}


}

/// @nodoc


class MessageSynced implements SyncState {
  const MessageSynced({required this.message});
  

 final  Message message;

/// Create a copy of SyncState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessageSyncedCopyWith<MessageSynced> get copyWith => _$MessageSyncedCopyWithImpl<MessageSynced>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MessageSynced&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'SyncState.messageSynced(message: $message)';
}


}

/// @nodoc
abstract mixin class $MessageSyncedCopyWith<$Res> implements $SyncStateCopyWith<$Res> {
  factory $MessageSyncedCopyWith(MessageSynced value, $Res Function(MessageSynced) _then) = _$MessageSyncedCopyWithImpl;
@useResult
$Res call({
 Message message
});




}
/// @nodoc
class _$MessageSyncedCopyWithImpl<$Res>
    implements $MessageSyncedCopyWith<$Res> {
  _$MessageSyncedCopyWithImpl(this._self, this._then);

  final MessageSynced _self;
  final $Res Function(MessageSynced) _then;

/// Create a copy of SyncState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(MessageSynced(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as Message,
  ));
}


}

/// @nodoc


class SyncFailure implements SyncState {
  const SyncFailure({required this.error});
  

 final  String error;

/// Create a copy of SyncState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SyncFailureCopyWith<SyncFailure> get copyWith => _$SyncFailureCopyWithImpl<SyncFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SyncFailure&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'SyncState.failure(error: $error)';
}


}

/// @nodoc
abstract mixin class $SyncFailureCopyWith<$Res> implements $SyncStateCopyWith<$Res> {
  factory $SyncFailureCopyWith(SyncFailure value, $Res Function(SyncFailure) _then) = _$SyncFailureCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$SyncFailureCopyWithImpl<$Res>
    implements $SyncFailureCopyWith<$Res> {
  _$SyncFailureCopyWithImpl(this._self, this._then);

  final SyncFailure _self;
  final $Res Function(SyncFailure) _then;

/// Create a copy of SyncState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(SyncFailure(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
