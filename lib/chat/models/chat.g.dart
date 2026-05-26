// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChatAdapter extends TypeAdapter<Chat> {
  @override
  final typeId = 60;

  @override
  Chat read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Chat(
        id: (fields[0] as num).toInt(),
        unreadMessages: (fields[2] as num).toInt(),
      )
      ..usersJson = fields[1] as String?
      ..lastMessageJson = fields[3] as String?;
  }

  @override
  void write(BinaryWriter writer, Chat obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.usersJson)
      ..writeByte(2)
      ..write(obj.unreadMessages)
      ..writeByte(3)
      ..write(obj.lastMessageJson);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChatAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
