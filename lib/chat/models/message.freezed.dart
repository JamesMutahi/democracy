// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Message {

 int get id;@JsonKey(name: 'chat') int get chatId; User get author; String get text; Post? get post; Ballot? get ballot; Survey? get survey; Petition? get petition; Meeting? get meeting; Section? get section; List<Asset> get assets; LatLng? get location;@JsonKey(name: 'is_read') bool get isRead;@JsonKey(name: 'is_edited') bool get isEdited;@JsonKey(name: 'is_deleted') bool get isDeleted;@JsonKey(name: 'created_at') DateTime get createdAt;@JsonKey(name: 'updated_at') DateTime get updatedAt;
/// Create a copy of Message
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessageCopyWith<Message> get copyWith => _$MessageCopyWithImpl<Message>(this as Message, _$identity);

  /// Serializes this Message to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Message&&(identical(other.id, id) || other.id == id)&&(identical(other.chatId, chatId) || other.chatId == chatId)&&(identical(other.author, author) || other.author == author)&&(identical(other.text, text) || other.text == text)&&(identical(other.post, post) || other.post == post)&&(identical(other.ballot, ballot) || other.ballot == ballot)&&(identical(other.survey, survey) || other.survey == survey)&&(identical(other.petition, petition) || other.petition == petition)&&(identical(other.meeting, meeting) || other.meeting == meeting)&&(identical(other.section, section) || other.section == section)&&const DeepCollectionEquality().equals(other.assets, assets)&&(identical(other.location, location) || other.location == location)&&(identical(other.isRead, isRead) || other.isRead == isRead)&&(identical(other.isEdited, isEdited) || other.isEdited == isEdited)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,chatId,author,text,post,ballot,survey,petition,meeting,section,const DeepCollectionEquality().hash(assets),location,isRead,isEdited,isDeleted,createdAt,updatedAt);

@override
String toString() {
  return 'Message(id: $id, chatId: $chatId, author: $author, text: $text, post: $post, ballot: $ballot, survey: $survey, petition: $petition, meeting: $meeting, section: $section, assets: $assets, location: $location, isRead: $isRead, isEdited: $isEdited, isDeleted: $isDeleted, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $MessageCopyWith<$Res>  {
  factory $MessageCopyWith(Message value, $Res Function(Message) _then) = _$MessageCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'chat') int chatId, User author, String text, Post? post, Ballot? ballot, Survey? survey, Petition? petition, Meeting? meeting, Section? section, List<Asset> assets, LatLng? location,@JsonKey(name: 'is_read') bool isRead,@JsonKey(name: 'is_edited') bool isEdited,@JsonKey(name: 'is_deleted') bool isDeleted,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
});


$UserCopyWith<$Res> get author;$PostCopyWith<$Res>? get post;$BallotCopyWith<$Res>? get ballot;$SurveyCopyWith<$Res>? get survey;$PetitionCopyWith<$Res>? get petition;$MeetingCopyWith<$Res>? get meeting;$SectionCopyWith<$Res>? get section;

}
/// @nodoc
class _$MessageCopyWithImpl<$Res>
    implements $MessageCopyWith<$Res> {
  _$MessageCopyWithImpl(this._self, this._then);

  final Message _self;
  final $Res Function(Message) _then;

/// Create a copy of Message
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? chatId = null,Object? author = null,Object? text = null,Object? post = freezed,Object? ballot = freezed,Object? survey = freezed,Object? petition = freezed,Object? meeting = freezed,Object? section = freezed,Object? assets = null,Object? location = freezed,Object? isRead = null,Object? isEdited = null,Object? isDeleted = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,chatId: null == chatId ? _self.chatId : chatId // ignore: cast_nullable_to_non_nullable
as int,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as User,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,post: freezed == post ? _self.post : post // ignore: cast_nullable_to_non_nullable
as Post?,ballot: freezed == ballot ? _self.ballot : ballot // ignore: cast_nullable_to_non_nullable
as Ballot?,survey: freezed == survey ? _self.survey : survey // ignore: cast_nullable_to_non_nullable
as Survey?,petition: freezed == petition ? _self.petition : petition // ignore: cast_nullable_to_non_nullable
as Petition?,meeting: freezed == meeting ? _self.meeting : meeting // ignore: cast_nullable_to_non_nullable
as Meeting?,section: freezed == section ? _self.section : section // ignore: cast_nullable_to_non_nullable
as Section?,assets: null == assets ? _self.assets : assets // ignore: cast_nullable_to_non_nullable
as List<Asset>,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as LatLng?,isRead: null == isRead ? _self.isRead : isRead // ignore: cast_nullable_to_non_nullable
as bool,isEdited: null == isEdited ? _self.isEdited : isEdited // ignore: cast_nullable_to_non_nullable
as bool,isDeleted: null == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of Message
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get author {
  
  return $UserCopyWith<$Res>(_self.author, (value) {
    return _then(_self.copyWith(author: value));
  });
}/// Create a copy of Message
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PostCopyWith<$Res>? get post {
    if (_self.post == null) {
    return null;
  }

  return $PostCopyWith<$Res>(_self.post!, (value) {
    return _then(_self.copyWith(post: value));
  });
}/// Create a copy of Message
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BallotCopyWith<$Res>? get ballot {
    if (_self.ballot == null) {
    return null;
  }

  return $BallotCopyWith<$Res>(_self.ballot!, (value) {
    return _then(_self.copyWith(ballot: value));
  });
}/// Create a copy of Message
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SurveyCopyWith<$Res>? get survey {
    if (_self.survey == null) {
    return null;
  }

  return $SurveyCopyWith<$Res>(_self.survey!, (value) {
    return _then(_self.copyWith(survey: value));
  });
}/// Create a copy of Message
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PetitionCopyWith<$Res>? get petition {
    if (_self.petition == null) {
    return null;
  }

  return $PetitionCopyWith<$Res>(_self.petition!, (value) {
    return _then(_self.copyWith(petition: value));
  });
}/// Create a copy of Message
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MeetingCopyWith<$Res>? get meeting {
    if (_self.meeting == null) {
    return null;
  }

  return $MeetingCopyWith<$Res>(_self.meeting!, (value) {
    return _then(_self.copyWith(meeting: value));
  });
}/// Create a copy of Message
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SectionCopyWith<$Res>? get section {
    if (_self.section == null) {
    return null;
  }

  return $SectionCopyWith<$Res>(_self.section!, (value) {
    return _then(_self.copyWith(section: value));
  });
}
}


/// Adds pattern-matching-related methods to [Message].
extension MessagePatterns on Message {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Message value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Message() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Message value)  $default,){
final _that = this;
switch (_that) {
case _Message():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Message value)?  $default,){
final _that = this;
switch (_that) {
case _Message() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'chat')  int chatId,  User author,  String text,  Post? post,  Ballot? ballot,  Survey? survey,  Petition? petition,  Meeting? meeting,  Section? section,  List<Asset> assets,  LatLng? location, @JsonKey(name: 'is_read')  bool isRead, @JsonKey(name: 'is_edited')  bool isEdited, @JsonKey(name: 'is_deleted')  bool isDeleted, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Message() when $default != null:
return $default(_that.id,_that.chatId,_that.author,_that.text,_that.post,_that.ballot,_that.survey,_that.petition,_that.meeting,_that.section,_that.assets,_that.location,_that.isRead,_that.isEdited,_that.isDeleted,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'chat')  int chatId,  User author,  String text,  Post? post,  Ballot? ballot,  Survey? survey,  Petition? petition,  Meeting? meeting,  Section? section,  List<Asset> assets,  LatLng? location, @JsonKey(name: 'is_read')  bool isRead, @JsonKey(name: 'is_edited')  bool isEdited, @JsonKey(name: 'is_deleted')  bool isDeleted, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _Message():
return $default(_that.id,_that.chatId,_that.author,_that.text,_that.post,_that.ballot,_that.survey,_that.petition,_that.meeting,_that.section,_that.assets,_that.location,_that.isRead,_that.isEdited,_that.isDeleted,_that.createdAt,_that.updatedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'chat')  int chatId,  User author,  String text,  Post? post,  Ballot? ballot,  Survey? survey,  Petition? petition,  Meeting? meeting,  Section? section,  List<Asset> assets,  LatLng? location, @JsonKey(name: 'is_read')  bool isRead, @JsonKey(name: 'is_edited')  bool isEdited, @JsonKey(name: 'is_deleted')  bool isDeleted, @JsonKey(name: 'created_at')  DateTime createdAt, @JsonKey(name: 'updated_at')  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _Message() when $default != null:
return $default(_that.id,_that.chatId,_that.author,_that.text,_that.post,_that.ballot,_that.survey,_that.petition,_that.meeting,_that.section,_that.assets,_that.location,_that.isRead,_that.isEdited,_that.isDeleted,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Message implements Message {
  const _Message({required this.id, @JsonKey(name: 'chat') required this.chatId, required this.author, required this.text, required this.post, required this.ballot, required this.survey, required this.petition, required this.meeting, required this.section, required final  List<Asset> assets, required this.location, @JsonKey(name: 'is_read') required this.isRead, @JsonKey(name: 'is_edited') required this.isEdited, @JsonKey(name: 'is_deleted') required this.isDeleted, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt}): _assets = assets;
  factory _Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);

@override final  int id;
@override@JsonKey(name: 'chat') final  int chatId;
@override final  User author;
@override final  String text;
@override final  Post? post;
@override final  Ballot? ballot;
@override final  Survey? survey;
@override final  Petition? petition;
@override final  Meeting? meeting;
@override final  Section? section;
 final  List<Asset> _assets;
@override List<Asset> get assets {
  if (_assets is EqualUnmodifiableListView) return _assets;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_assets);
}

@override final  LatLng? location;
@override@JsonKey(name: 'is_read') final  bool isRead;
@override@JsonKey(name: 'is_edited') final  bool isEdited;
@override@JsonKey(name: 'is_deleted') final  bool isDeleted;
@override@JsonKey(name: 'created_at') final  DateTime createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime updatedAt;

/// Create a copy of Message
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MessageCopyWith<_Message> get copyWith => __$MessageCopyWithImpl<_Message>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MessageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Message&&(identical(other.id, id) || other.id == id)&&(identical(other.chatId, chatId) || other.chatId == chatId)&&(identical(other.author, author) || other.author == author)&&(identical(other.text, text) || other.text == text)&&(identical(other.post, post) || other.post == post)&&(identical(other.ballot, ballot) || other.ballot == ballot)&&(identical(other.survey, survey) || other.survey == survey)&&(identical(other.petition, petition) || other.petition == petition)&&(identical(other.meeting, meeting) || other.meeting == meeting)&&(identical(other.section, section) || other.section == section)&&const DeepCollectionEquality().equals(other._assets, _assets)&&(identical(other.location, location) || other.location == location)&&(identical(other.isRead, isRead) || other.isRead == isRead)&&(identical(other.isEdited, isEdited) || other.isEdited == isEdited)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,chatId,author,text,post,ballot,survey,petition,meeting,section,const DeepCollectionEquality().hash(_assets),location,isRead,isEdited,isDeleted,createdAt,updatedAt);

@override
String toString() {
  return 'Message(id: $id, chatId: $chatId, author: $author, text: $text, post: $post, ballot: $ballot, survey: $survey, petition: $petition, meeting: $meeting, section: $section, assets: $assets, location: $location, isRead: $isRead, isEdited: $isEdited, isDeleted: $isDeleted, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$MessageCopyWith<$Res> implements $MessageCopyWith<$Res> {
  factory _$MessageCopyWith(_Message value, $Res Function(_Message) _then) = __$MessageCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'chat') int chatId, User author, String text, Post? post, Ballot? ballot, Survey? survey, Petition? petition, Meeting? meeting, Section? section, List<Asset> assets, LatLng? location,@JsonKey(name: 'is_read') bool isRead,@JsonKey(name: 'is_edited') bool isEdited,@JsonKey(name: 'is_deleted') bool isDeleted,@JsonKey(name: 'created_at') DateTime createdAt,@JsonKey(name: 'updated_at') DateTime updatedAt
});


@override $UserCopyWith<$Res> get author;@override $PostCopyWith<$Res>? get post;@override $BallotCopyWith<$Res>? get ballot;@override $SurveyCopyWith<$Res>? get survey;@override $PetitionCopyWith<$Res>? get petition;@override $MeetingCopyWith<$Res>? get meeting;@override $SectionCopyWith<$Res>? get section;

}
/// @nodoc
class __$MessageCopyWithImpl<$Res>
    implements _$MessageCopyWith<$Res> {
  __$MessageCopyWithImpl(this._self, this._then);

  final _Message _self;
  final $Res Function(_Message) _then;

/// Create a copy of Message
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? chatId = null,Object? author = null,Object? text = null,Object? post = freezed,Object? ballot = freezed,Object? survey = freezed,Object? petition = freezed,Object? meeting = freezed,Object? section = freezed,Object? assets = null,Object? location = freezed,Object? isRead = null,Object? isEdited = null,Object? isDeleted = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_Message(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,chatId: null == chatId ? _self.chatId : chatId // ignore: cast_nullable_to_non_nullable
as int,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as User,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,post: freezed == post ? _self.post : post // ignore: cast_nullable_to_non_nullable
as Post?,ballot: freezed == ballot ? _self.ballot : ballot // ignore: cast_nullable_to_non_nullable
as Ballot?,survey: freezed == survey ? _self.survey : survey // ignore: cast_nullable_to_non_nullable
as Survey?,petition: freezed == petition ? _self.petition : petition // ignore: cast_nullable_to_non_nullable
as Petition?,meeting: freezed == meeting ? _self.meeting : meeting // ignore: cast_nullable_to_non_nullable
as Meeting?,section: freezed == section ? _self.section : section // ignore: cast_nullable_to_non_nullable
as Section?,assets: null == assets ? _self._assets : assets // ignore: cast_nullable_to_non_nullable
as List<Asset>,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as LatLng?,isRead: null == isRead ? _self.isRead : isRead // ignore: cast_nullable_to_non_nullable
as bool,isEdited: null == isEdited ? _self.isEdited : isEdited // ignore: cast_nullable_to_non_nullable
as bool,isDeleted: null == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of Message
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res> get author {
  
  return $UserCopyWith<$Res>(_self.author, (value) {
    return _then(_self.copyWith(author: value));
  });
}/// Create a copy of Message
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PostCopyWith<$Res>? get post {
    if (_self.post == null) {
    return null;
  }

  return $PostCopyWith<$Res>(_self.post!, (value) {
    return _then(_self.copyWith(post: value));
  });
}/// Create a copy of Message
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BallotCopyWith<$Res>? get ballot {
    if (_self.ballot == null) {
    return null;
  }

  return $BallotCopyWith<$Res>(_self.ballot!, (value) {
    return _then(_self.copyWith(ballot: value));
  });
}/// Create a copy of Message
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SurveyCopyWith<$Res>? get survey {
    if (_self.survey == null) {
    return null;
  }

  return $SurveyCopyWith<$Res>(_self.survey!, (value) {
    return _then(_self.copyWith(survey: value));
  });
}/// Create a copy of Message
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PetitionCopyWith<$Res>? get petition {
    if (_self.petition == null) {
    return null;
  }

  return $PetitionCopyWith<$Res>(_self.petition!, (value) {
    return _then(_self.copyWith(petition: value));
  });
}/// Create a copy of Message
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MeetingCopyWith<$Res>? get meeting {
    if (_self.meeting == null) {
    return null;
  }

  return $MeetingCopyWith<$Res>(_self.meeting!, (value) {
    return _then(_self.copyWith(meeting: value));
  });
}/// Create a copy of Message
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SectionCopyWith<$Res>? get section {
    if (_self.section == null) {
    return null;
  }

  return $SectionCopyWith<$Res>(_self.section!, (value) {
    return _then(_self.copyWith(section: value));
  });
}
}

// dart format on
