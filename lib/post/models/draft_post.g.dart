// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'draft_post.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DraftPostAdapter extends TypeAdapter<DraftPost> {
  @override
  final typeId = 50;

  @override
  DraftPost read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DraftPost(
        serverID: (fields[0] as num?)?.toInt(),
        body: fields[1] == null ? '' : fields[1] as String,
        filePaths: (fields[2] as List?)?.cast<String>(),
        syncStatus: fields[3] as String?,
        syncType: fields[4] as String?,
        createdAt: fields[6] as DateTime?,
        updatedAt: fields[5] as DateTime?,
      )
      ..locationJson = fields[7] as String?
      ..replyToJson = fields[8] as String?
      ..repostOfJson = fields[9] as String?
      ..communityNoteOfJson = fields[10] as String?
      ..ballotJson = fields[11] as String?
      ..surveyJson = fields[12] as String?
      ..petitionJson = fields[13] as String?
      ..broadcastJson = fields[14] as String?
      ..sectionJson = fields[15] as String?
      ..tagsJson = fields[16] as String?
      ..assetsJson = fields[17] as String?;
  }

  @override
  void write(BinaryWriter writer, DraftPost obj) {
    writer
      ..writeByte(18)
      ..writeByte(0)
      ..write(obj.serverID)
      ..writeByte(1)
      ..write(obj.body)
      ..writeByte(2)
      ..write(obj.filePaths)
      ..writeByte(3)
      ..write(obj.syncStatus)
      ..writeByte(4)
      ..write(obj.syncType)
      ..writeByte(5)
      ..write(obj.updatedAt)
      ..writeByte(6)
      ..write(obj.createdAt)
      ..writeByte(7)
      ..write(obj.locationJson)
      ..writeByte(8)
      ..write(obj.replyToJson)
      ..writeByte(9)
      ..write(obj.repostOfJson)
      ..writeByte(10)
      ..write(obj.communityNoteOfJson)
      ..writeByte(11)
      ..write(obj.ballotJson)
      ..writeByte(12)
      ..write(obj.surveyJson)
      ..writeByte(13)
      ..write(obj.petitionJson)
      ..writeByte(14)
      ..write(obj.broadcastJson)
      ..writeByte(15)
      ..write(obj.sectionJson)
      ..writeByte(16)
      ..write(obj.tagsJson)
      ..writeByte(17)
      ..write(obj.assetsJson);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DraftPostAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
