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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Start value)?  start,TResult Function( _PostDrafts value)?  postDrafts,TResult Function( _PostMessages value)?  postMessages,TResult Function( _UploadMessageAssets value)?  uploadMessageAssets,TResult Function( _PatchMessages value)?  patchMessages,TResult Function( _DeleteMessages value)?  deleteMessages,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Start() when start != null:
return start(_that);case _PostDrafts() when postDrafts != null:
return postDrafts(_that);case _PostMessages() when postMessages != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Start value)  start,required TResult Function( _PostDrafts value)  postDrafts,required TResult Function( _PostMessages value)  postMessages,required TResult Function( _UploadMessageAssets value)  uploadMessageAssets,required TResult Function( _PatchMessages value)  patchMessages,required TResult Function( _DeleteMessages value)  deleteMessages,}){
final _that = this;
switch (_that) {
case _Start():
return start(_that);case _PostDrafts():
return postDrafts(_that);case _PostMessages():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Start value)?  start,TResult? Function( _PostDrafts value)?  postDrafts,TResult? Function( _PostMessages value)?  postMessages,TResult? Function( _UploadMessageAssets value)?  uploadMessageAssets,TResult? Function( _PatchMessages value)?  patchMessages,TResult? Function( _DeleteMessages value)?  deleteMessages,}){
final _that = this;
switch (_that) {
case _Start() when start != null:
return start(_that);case _PostDrafts() when postDrafts != null:
return postDrafts(_that);case _PostMessages() when postMessages != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  start,TResult Function()?  postDrafts,TResult Function()?  postMessages,TResult Function()?  uploadMessageAssets,TResult Function()?  patchMessages,TResult Function()?  deleteMessages,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Start() when start != null:
return start();case _PostDrafts() when postDrafts != null:
return postDrafts();case _PostMessages() when postMessages != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  start,required TResult Function()  postDrafts,required TResult Function()  postMessages,required TResult Function()  uploadMessageAssets,required TResult Function()  patchMessages,required TResult Function()  deleteMessages,}) {final _that = this;
switch (_that) {
case _Start():
return start();case _PostDrafts():
return postDrafts();case _PostMessages():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  start,TResult? Function()?  postDrafts,TResult? Function()?  postMessages,TResult? Function()?  uploadMessageAssets,TResult? Function()?  patchMessages,TResult? Function()?  deleteMessages,}) {final _that = this;
switch (_that) {
case _Start() when start != null:
return start();case _PostDrafts() when postDrafts != null:
return postDrafts();case _PostMessages() when postMessages != null:
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Syncing value)?  syncing,TResult Function( DraftsSynced value)?  draftsSynced,TResult Function( PostMessagesSynced value)?  postMessagesSynced,TResult Function( AssetUploadMessagesSynced value)?  assetUploadMessagesSynced,TResult Function( PatchMessagesSynced value)?  patchMessagesSynced,TResult Function( DeleteMessagesSynced value)?  deleteMessagesSynced,TResult Function( SyncFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Syncing() when syncing != null:
return syncing(_that);case DraftsSynced() when draftsSynced != null:
return draftsSynced(_that);case PostMessagesSynced() when postMessagesSynced != null:
return postMessagesSynced(_that);case AssetUploadMessagesSynced() when assetUploadMessagesSynced != null:
return assetUploadMessagesSynced(_that);case PatchMessagesSynced() when patchMessagesSynced != null:
return patchMessagesSynced(_that);case DeleteMessagesSynced() when deleteMessagesSynced != null:
return deleteMessagesSynced(_that);case SyncFailure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Syncing value)  syncing,required TResult Function( DraftsSynced value)  draftsSynced,required TResult Function( PostMessagesSynced value)  postMessagesSynced,required TResult Function( AssetUploadMessagesSynced value)  assetUploadMessagesSynced,required TResult Function( PatchMessagesSynced value)  patchMessagesSynced,required TResult Function( DeleteMessagesSynced value)  deleteMessagesSynced,required TResult Function( SyncFailure value)  failure,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Syncing():
return syncing(_that);case DraftsSynced():
return draftsSynced(_that);case PostMessagesSynced():
return postMessagesSynced(_that);case AssetUploadMessagesSynced():
return assetUploadMessagesSynced(_that);case PatchMessagesSynced():
return patchMessagesSynced(_that);case DeleteMessagesSynced():
return deleteMessagesSynced(_that);case SyncFailure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Syncing value)?  syncing,TResult? Function( DraftsSynced value)?  draftsSynced,TResult? Function( PostMessagesSynced value)?  postMessagesSynced,TResult? Function( AssetUploadMessagesSynced value)?  assetUploadMessagesSynced,TResult? Function( PatchMessagesSynced value)?  patchMessagesSynced,TResult? Function( DeleteMessagesSynced value)?  deleteMessagesSynced,TResult? Function( SyncFailure value)?  failure,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Syncing() when syncing != null:
return syncing(_that);case DraftsSynced() when draftsSynced != null:
return draftsSynced(_that);case PostMessagesSynced() when postMessagesSynced != null:
return postMessagesSynced(_that);case AssetUploadMessagesSynced() when assetUploadMessagesSynced != null:
return assetUploadMessagesSynced(_that);case PatchMessagesSynced() when patchMessagesSynced != null:
return patchMessagesSynced(_that);case DeleteMessagesSynced() when deleteMessagesSynced != null:
return deleteMessagesSynced(_that);case SyncFailure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  syncing,TResult Function()?  draftsSynced,TResult Function()?  postMessagesSynced,TResult Function()?  assetUploadMessagesSynced,TResult Function()?  patchMessagesSynced,TResult Function()?  deleteMessagesSynced,TResult Function( String error)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Syncing() when syncing != null:
return syncing();case DraftsSynced() when draftsSynced != null:
return draftsSynced();case PostMessagesSynced() when postMessagesSynced != null:
return postMessagesSynced();case AssetUploadMessagesSynced() when assetUploadMessagesSynced != null:
return assetUploadMessagesSynced();case PatchMessagesSynced() when patchMessagesSynced != null:
return patchMessagesSynced();case DeleteMessagesSynced() when deleteMessagesSynced != null:
return deleteMessagesSynced();case SyncFailure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  syncing,required TResult Function()  draftsSynced,required TResult Function()  postMessagesSynced,required TResult Function()  assetUploadMessagesSynced,required TResult Function()  patchMessagesSynced,required TResult Function()  deleteMessagesSynced,required TResult Function( String error)  failure,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Syncing():
return syncing();case DraftsSynced():
return draftsSynced();case PostMessagesSynced():
return postMessagesSynced();case AssetUploadMessagesSynced():
return assetUploadMessagesSynced();case PatchMessagesSynced():
return patchMessagesSynced();case DeleteMessagesSynced():
return deleteMessagesSynced();case SyncFailure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  syncing,TResult? Function()?  draftsSynced,TResult? Function()?  postMessagesSynced,TResult? Function()?  assetUploadMessagesSynced,TResult? Function()?  patchMessagesSynced,TResult? Function()?  deleteMessagesSynced,TResult? Function( String error)?  failure,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Syncing() when syncing != null:
return syncing();case DraftsSynced() when draftsSynced != null:
return draftsSynced();case PostMessagesSynced() when postMessagesSynced != null:
return postMessagesSynced();case AssetUploadMessagesSynced() when assetUploadMessagesSynced != null:
return assetUploadMessagesSynced();case PatchMessagesSynced() when patchMessagesSynced != null:
return patchMessagesSynced();case DeleteMessagesSynced() when deleteMessagesSynced != null:
return deleteMessagesSynced();case SyncFailure() when failure != null:
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


class DraftsSynced implements SyncState {
  const DraftsSynced();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DraftsSynced);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SyncState.draftsSynced()';
}


}




/// @nodoc


class PostMessagesSynced implements SyncState {
  const PostMessagesSynced();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostMessagesSynced);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SyncState.postMessagesSynced()';
}


}




/// @nodoc


class AssetUploadMessagesSynced implements SyncState {
  const AssetUploadMessagesSynced();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AssetUploadMessagesSynced);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SyncState.assetUploadMessagesSynced()';
}


}




/// @nodoc


class PatchMessagesSynced implements SyncState {
  const PatchMessagesSynced();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PatchMessagesSynced);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SyncState.patchMessagesSynced()';
}


}




/// @nodoc


class DeleteMessagesSynced implements SyncState {
  const DeleteMessagesSynced();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteMessagesSynced);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SyncState.deleteMessagesSynced()';
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
