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
        id: fields[0] == null ? 0 : (fields[0] as num).toInt(),
        serverID: (fields[1] as num?)?.toInt(),
        body: fields[2] == null ? '' : fields[2] as String,
        filePaths: (fields[3] as List?)?.cast<String>(),
        syncStatus: fields[4] as String?,
        syncType: fields[5] as String?,
        createdAt: fields[7] as DateTime?,
        updatedAt: fields[6] as DateTime?,
      )
      ..locationJson = fields[8] as String?
      ..replyToJson = fields[9] as String?
      ..repostOfJson = fields[10] as String?
      ..communityNoteOfJson = fields[11] as String?
      ..ballotJson = fields[12] as String?
      ..surveyJson = fields[13] as String?
      ..petitionJson = fields[14] as String?
      ..meetingJson = fields[15] as String?
      ..sectionJson = fields[16] as String?
      ..tagsJson = fields[17] as String?
      ..assetsJson = fields[18] as String?;
  }

  @override
  void write(BinaryWriter writer, DraftPost obj) {
    writer
      ..writeByte(19)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.serverID)
      ..writeByte(2)
      ..write(obj.body)
      ..writeByte(3)
      ..write(obj.filePaths)
      ..writeByte(4)
      ..write(obj.syncStatus)
      ..writeByte(5)
      ..write(obj.syncType)
      ..writeByte(6)
      ..write(obj.updatedAt)
      ..writeByte(7)
      ..write(obj.createdAt)
      ..writeByte(8)
      ..write(obj.locationJson)
      ..writeByte(9)
      ..write(obj.replyToJson)
      ..writeByte(10)
      ..write(obj.repostOfJson)
      ..writeByte(11)
      ..write(obj.communityNoteOfJson)
      ..writeByte(12)
      ..write(obj.ballotJson)
      ..writeByte(13)
      ..write(obj.surveyJson)
      ..writeByte(14)
      ..write(obj.petitionJson)
      ..writeByte(15)
      ..write(obj.meetingJson)
      ..writeByte(16)
      ..write(obj.sectionJson)
      ..writeByte(17)
      ..write(obj.tagsJson)
      ..writeByte(18)
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
