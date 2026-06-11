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
        id: (fields[0] as num?)?.toInt(),
        chatId: (fields[1] as num).toInt(),
        text: fields[2] == null ? '' : fields[2] as String,
        filePaths: fields[9] == null
            ? const []
            : (fields[9] as List).cast<String>(),
        isRead: fields[3] == null ? false : fields[3] as bool,
        isEdited: fields[4] == null ? false : fields[4] as bool,
        isDeleted: fields[5] == null ? false : fields[5] as bool,
        syncStatus: fields[6] == null ? SyncStatus.synced : fields[6] as String,
        syncType: fields[7] as String?,
        uuid: fields[8] as String,
        createdAt: fields[10] as DateTime,
        updatedAt: fields[11] as DateTime,
      )
      ..authorJson = fields[12] as String?
      ..locationJson = fields[13] as String?
      ..postJson = fields[14] as String?
      ..ballotJson = fields[15] as String?
      ..surveyJson = fields[16] as String?
      ..petitionJson = fields[17] as String?
      ..broadcastJson = fields[18] as String?
      ..sectionJson = fields[19] as String?
      ..assetsJson = fields[20] as String?;
  }

  @override
  void write(BinaryWriter writer, Message obj) {
    writer
      ..writeByte(21)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.chatId)
      ..writeByte(2)
      ..write(obj.text)
      ..writeByte(3)
      ..write(obj.isRead)
      ..writeByte(4)
      ..write(obj.isEdited)
      ..writeByte(5)
      ..write(obj.isDeleted)
      ..writeByte(6)
      ..write(obj.syncStatus)
      ..writeByte(7)
      ..write(obj.syncType)
      ..writeByte(8)
      ..write(obj.uuid)
      ..writeByte(9)
      ..write(obj.filePaths)
      ..writeByte(10)
      ..write(obj.createdAt)
      ..writeByte(11)
      ..write(obj.updatedAt)
      ..writeByte(12)
      ..write(obj.authorJson)
      ..writeByte(13)
      ..write(obj.locationJson)
      ..writeByte(14)
      ..write(obj.postJson)
      ..writeByte(15)
      ..write(obj.ballotJson)
      ..writeByte(16)
      ..write(obj.surveyJson)
      ..writeByte(17)
      ..write(obj.petitionJson)
      ..writeByte(18)
      ..write(obj.broadcastJson)
      ..writeByte(19)
      ..write(obj.sectionJson)
      ..writeByte(20)
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
