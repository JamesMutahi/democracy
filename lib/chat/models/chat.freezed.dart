// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Chat {

 int get id; List<User> get users;@JsonKey(name: 'last_message') Message? get lastMessage; List<Message> get messages; List<int> get blockers;
/// Create a copy of Chat
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatCopyWith<Chat> get copyWith => _$ChatCopyWithImpl<Chat>(this as Chat, _$identity);

  /// Serializes this Chat to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Chat&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.users, users)&&(identical(other.lastMessage, lastMessage) || other.lastMessage == lastMessage)&&const DeepCollectionEquality().equals(other.messages, messages)&&const DeepCollectionEquality().equals(other.blockers, blockers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(users),lastMessage,const DeepCollectionEquality().hash(messages),const DeepCollectionEquality().hash(blockers));

@override
String toString() {
  return 'Chat(id: $id, users: $users, lastMessage: $lastMessage, messages: $messages, blockers: $blockers)';
}


}

/// @nodoc
abstract mixin class $ChatCopyWith<$Res>  {
  factory $ChatCopyWith(Chat value, $Res Function(Chat) _then) = _$ChatCopyWithImpl;
@useResult
$Res call({
 int id, List<User> users,@JsonKey(name: 'last_message') Message? lastMessage, List<Message> messages, List<int> blockers
});


$MessageCopyWith<$Res>? get lastMessage;

}
/// @nodoc
class _$ChatCopyWithImpl<$Res>
    implements $ChatCopyWith<$Res> {
  _$ChatCopyWithImpl(this._self, this._then);

  final Chat _self;
  final $Res Function(Chat) _then;

/// Create a copy of Chat
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? users = null,Object? lastMessage = freezed,Object? messages = null,Object? blockers = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,users: null == users ? _self.users : users // ignore: cast_nullable_to_non_nullable
as List<User>,lastMessage: freezed == lastMessage ? _self.lastMessage : lastMessage // ignore: cast_nullable_to_non_nullable
as Message?,messages: null == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as List<Message>,blockers: null == blockers ? _self.blockers : blockers // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}
/// Create a copy of Chat
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MessageCopyWith<$Res>? get lastMessage {
    if (_self.lastMessage == null) {
    return null;
  }

  return $MessageCopyWith<$Res>(_self.lastMessage!, (value) {
    return _then(_self.copyWith(lastMessage: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _Chat implements Chat {
  const _Chat({required this.id, required final  List<User> users, @JsonKey(name: 'last_message') required this.lastMessage, required final  List<Message> messages, required final  List<int> blockers}): _users = users,_messages = messages,_blockers = blockers;
  factory _Chat.fromJson(Map<String, dynamic> json) => _$ChatFromJson(json);

@override final  int id;
 final  List<User> _users;
@override List<User> get users {
  if (_users is EqualUnmodifiableListView) return _users;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_users);
}

@override@JsonKey(name: 'last_message') final  Message? lastMessage;
 final  List<Message> _messages;
@override List<Message> get messages {
  if (_messages is EqualUnmodifiableListView) return _messages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_messages);
}

 final  List<int> _blockers;
@override List<int> get blockers {
  if (_blockers is EqualUnmodifiableListView) return _blockers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_blockers);
}


/// Create a copy of Chat
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatCopyWith<_Chat> get copyWith => __$ChatCopyWithImpl<_Chat>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Chat&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other._users, _users)&&(identical(other.lastMessage, lastMessage) || other.lastMessage == lastMessage)&&const DeepCollectionEquality().equals(other._messages, _messages)&&const DeepCollectionEquality().equals(other._blockers, _blockers));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,const DeepCollectionEquality().hash(_users),lastMessage,const DeepCollectionEquality().hash(_messages),const DeepCollectionEquality().hash(_blockers));

@override
String toString() {
  return 'Chat(id: $id, users: $users, lastMessage: $lastMessage, messages: $messages, blockers: $blockers)';
}


}

/// @nodoc
abstract mixin class _$ChatCopyWith<$Res> implements $ChatCopyWith<$Res> {
  factory _$ChatCopyWith(_Chat value, $Res Function(_Chat) _then) = __$ChatCopyWithImpl;
@override @useResult
$Res call({
 int id, List<User> users,@JsonKey(name: 'last_message') Message? lastMessage, List<Message> messages, List<int> blockers
});


@override $MessageCopyWith<$Res>? get lastMessage;

}
/// @nodoc
class __$ChatCopyWithImpl<$Res>
    implements _$ChatCopyWith<$Res> {
  __$ChatCopyWithImpl(this._self, this._then);

  final _Chat _self;
  final $Res Function(_Chat) _then;

/// Create a copy of Chat
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? users = null,Object? lastMessage = freezed,Object? messages = null,Object? blockers = null,}) {
  return _then(_Chat(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,users: null == users ? _self._users : users // ignore: cast_nullable_to_non_nullable
as List<User>,lastMessage: freezed == lastMessage ? _self.lastMessage : lastMessage // ignore: cast_nullable_to_non_nullable
as Message?,messages: null == messages ? _self._messages : messages // ignore: cast_nullable_to_non_nullable
as List<Message>,blockers: null == blockers ? _self._blockers : blockers // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}

/// Create a copy of Chat
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MessageCopyWith<$Res>? get lastMessage {
    if (_self.lastMessage == null) {
    return null;
  }

  return $MessageCopyWith<$Res>(_self.lastMessage!, (value) {
    return _then(_self.copyWith(lastMessage: value));
  });
}
}

// dart format on
