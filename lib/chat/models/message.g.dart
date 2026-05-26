// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MessageAdapter extends TypeAdapter<Message> {
  @override
  final typeId = 61;

  @override
  Message read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Message(
        id: fields[0] == null ? 0 : (fields[0] as num).toInt(),
        serverId: (fields[1] as num?)?.toInt(),
        chatId: (fields[2] as num).toInt(),
        text: fields[3] == null ? '' : fields[3] as String,
        filePaths: fields[10] == null
            ? const []
            : (fields[10] as List).cast<String>(),
        isRead: fields[4] == null ? false : fields[4] as bool,
        isEdited: fields[5] == null ? false : fields[5] as bool,
        isDeleted: fields[6] == null ? false : fields[6] as bool,
        syncStatus: fields[7] == null ? SyncStatus.synced : fields[7] as String,
        syncType: fields[8] as String?,
        uuid: fields[9] as String,
        createdAt: fields[11] as DateTime,
        updatedAt: fields[12] as DateTime,
      )
      ..authorJson = fields[13] as String?
      ..locationJson = fields[14] as String?
      ..postJson = fields[15] as String?
      ..ballotJson = fields[16] as String?
      ..surveyJson = fields[17] as String?
      ..petitionJson = fields[18] as String?
      ..meetingJson = fields[19] as String?
      ..sectionJson = fields[20] as String?
      ..assetsJson = fields[21] as String?;
  }

  @override
  void write(BinaryWriter writer, Message obj) {
    writer
      ..writeByte(22)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.serverId)
      ..writeByte(2)
      ..write(obj.chatId)
      ..writeByte(3)
      ..write(obj.text)
      ..writeByte(4)
      ..write(obj.isRead)
      ..writeByte(5)
      ..write(obj.isEdited)
      ..writeByte(6)
      ..write(obj.isDeleted)
      ..writeByte(7)
      ..write(obj.syncStatus)
      ..writeByte(8)
      ..write(obj.syncType)
      ..writeByte(9)
      ..write(obj.uuid)
      ..writeByte(10)
      ..write(obj.filePaths)
      ..writeByte(11)
      ..write(obj.createdAt)
      ..writeByte(12)
      ..write(obj.updatedAt)
      ..writeByte(13)
      ..write(obj.authorJson)
      ..writeByte(14)
      ..write(obj.locationJson)
      ..writeByte(15)
      ..write(obj.postJson)
      ..writeByte(16)
      ..write(obj.ballotJson)
      ..writeByte(17)
      ..write(obj.surveyJson)
      ..writeByte(18)
      ..write(obj.petitionJson)
      ..writeByte(19)
      ..write(obj.meetingJson)
      ..writeByte(20)
      ..write(obj.sectionJson)
      ..writeByte(21)
      ..write(obj.assetsJson);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MessageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
