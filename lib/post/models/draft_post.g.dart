// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'draft_post.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetDraftPostCollection on Isar {
  IsarCollection<DraftPost> get draftPosts => this.collection();
}

const DraftPostSchema = CollectionSchema(
  name: r'DraftPost',
  id: 6410146564399493810,
  properties: {
    r'ballot': PropertySchema(id: 0, name: r'ballot', type: IsarType.string),
    r'body': PropertySchema(id: 1, name: r'body', type: IsarType.string),
    r'communityNoteOf': PropertySchema(
      id: 2,
      name: r'communityNoteOf',
      type: IsarType.string,
    ),
    r'createdAt': PropertySchema(
      id: 3,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'filePaths': PropertySchema(
      id: 4,
      name: r'filePaths',
      type: IsarType.stringList,
    ),
    r'location': PropertySchema(
      id: 5,
      name: r'location',
      type: IsarType.string,
    ),
    r'meeting': PropertySchema(id: 6, name: r'meeting', type: IsarType.string),
    r'petition': PropertySchema(
      id: 7,
      name: r'petition',
      type: IsarType.string,
    ),
    r'replyTo': PropertySchema(id: 8, name: r'replyTo', type: IsarType.string),
    r'repostOf': PropertySchema(
      id: 9,
      name: r'repostOf',
      type: IsarType.string,
    ),
    r'section': PropertySchema(id: 10, name: r'section', type: IsarType.string),
    r'survey': PropertySchema(id: 11, name: r'survey', type: IsarType.string),
    r'tags': PropertySchema(id: 12, name: r'tags', type: IsarType.string),
    r'updatedAt': PropertySchema(
      id: 13,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
  },

  estimateSize: _draftPostEstimateSize,
  serialize: _draftPostSerialize,
  deserialize: _draftPostDeserialize,
  deserializeProp: _draftPostDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},

  getId: _draftPostGetId,
  getLinks: _draftPostGetLinks,
  attach: _draftPostAttach,
  version: '3.3.2',
);

int _draftPostEstimateSize(
  DraftPost object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.ballotJson;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.body.length * 3;
  {
    final value = object.communityNoteOfJson;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.filePaths.length * 3;
  {
    for (var i = 0; i < object.filePaths.length; i++) {
      final value = object.filePaths[i];
      bytesCount += value.length * 3;
    }
  }
  {
    final value = object.locationJson;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.meetingJson;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.petitionJson;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.replyToJson;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.repostOfJson;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.sectionJson;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.surveyJson;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.tagsJson;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _draftPostSerialize(
  DraftPost object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.ballotJson);
  writer.writeString(offsets[1], object.body);
  writer.writeString(offsets[2], object.communityNoteOfJson);
  writer.writeDateTime(offsets[3], object.createdAt);
  writer.writeStringList(offsets[4], object.filePaths);
  writer.writeString(offsets[5], object.locationJson);
  writer.writeString(offsets[6], object.meetingJson);
  writer.writeString(offsets[7], object.petitionJson);
  writer.writeString(offsets[8], object.replyToJson);
  writer.writeString(offsets[9], object.repostOfJson);
  writer.writeString(offsets[10], object.sectionJson);
  writer.writeString(offsets[11], object.surveyJson);
  writer.writeString(offsets[12], object.tagsJson);
  writer.writeDateTime(offsets[13], object.updatedAt);
}

DraftPost _draftPostDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DraftPost();
  object.ballotJson = reader.readStringOrNull(offsets[0]);
  object.body = reader.readString(offsets[1]);
  object.communityNoteOfJson = reader.readStringOrNull(offsets[2]);
  object.createdAt = reader.readDateTime(offsets[3]);
  object.filePaths = reader.readStringList(offsets[4]) ?? [];
  object.id = id;
  object.locationJson = reader.readStringOrNull(offsets[5]);
  object.meetingJson = reader.readStringOrNull(offsets[6]);
  object.petitionJson = reader.readStringOrNull(offsets[7]);
  object.replyToJson = reader.readStringOrNull(offsets[8]);
  object.repostOfJson = reader.readStringOrNull(offsets[9]);
  object.sectionJson = reader.readStringOrNull(offsets[10]);
  object.surveyJson = reader.readStringOrNull(offsets[11]);
  object.tagsJson = reader.readStringOrNull(offsets[12]);
  object.updatedAt = reader.readDateTime(offsets[13]);
  return object;
}

P _draftPostDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readStringList(offset) ?? []) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    case 13:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _draftPostGetId(DraftPost object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _draftPostGetLinks(DraftPost object) {
  return [];
}

void _draftPostAttach(IsarCollection<dynamic> col, Id id, DraftPost object) {
  object.id = id;
}

extension DraftPostQueryWhereSort
    on QueryBuilder<DraftPost, DraftPost, QWhere> {
  QueryBuilder<DraftPost, DraftPost, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension DraftPostQueryWhere
    on QueryBuilder<DraftPost, DraftPost, QWhereClause> {
  QueryBuilder<DraftPost, DraftPost, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerId,
          includeLower: includeLower,
          upper: upperId,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension DraftPostQueryFilter
    on QueryBuilder<DraftPost, DraftPost, QFilterCondition> {
  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition> ballotJsonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'ballot'),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition>
  ballotJsonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'ballot'),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition> ballotJsonEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'ballot',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition>
  ballotJsonGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'ballot',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition> ballotJsonLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'ballot',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition> ballotJsonBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'ballot',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition>
  ballotJsonStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'ballot',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition> ballotJsonEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'ballot',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition> ballotJsonContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'ballot',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition> ballotJsonMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'ballot',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition>
  ballotJsonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'ballot', value: ''),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition>
  ballotJsonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'ballot', value: ''),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition> bodyEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'body',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition> bodyGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'body',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition> bodyLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'body',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition> bodyBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'body',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition> bodyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'body',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition> bodyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'body',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition> bodyContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'body',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition> bodyMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'body',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition> bodyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'body', value: ''),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition> bodyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'body', value: ''),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition>
  communityNoteOfJsonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'communityNoteOf'),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition>
  communityNoteOfJsonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'communityNoteOf'),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition>
  communityNoteOfJsonEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'communityNoteOf',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition>
  communityNoteOfJsonGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'communityNoteOf',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition>
  communityNoteOfJsonLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'communityNoteOf',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition>
  communityNoteOfJsonBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'communityNoteOf',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition>
  communityNoteOfJsonStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'communityNoteOf',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition>
  communityNoteOfJsonEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'communityNoteOf',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition>
  communityNoteOfJsonContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'communityNoteOf',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition>
  communityNoteOfJsonMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'communityNoteOf',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition>
  communityNoteOfJsonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'communityNoteOf', value: ''),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition>
  communityNoteOfJsonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'communityNoteOf', value: ''),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition> createdAtEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'createdAt', value: value),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition>
  createdAtGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'createdAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition> createdAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'createdAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition> createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'createdAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition>
  filePathsElementEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'filePaths',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition>
  filePathsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'filePaths',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition>
  filePathsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'filePaths',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition>
  filePathsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'filePaths',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition>
  filePathsElementStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'filePaths',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition>
  filePathsElementEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'filePaths',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition>
  filePathsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'filePaths',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition>
  filePathsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'filePaths',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition>
  filePathsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'filePaths', value: ''),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition>
  filePathsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'filePaths', value: ''),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition>
  filePathsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'filePaths', length, true, length, true);
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition> filePathsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'filePaths', 0, true, 0, true);
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition>
  filePathsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'filePaths', 0, false, 999999, true);
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition>
  filePathsLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'filePaths', 0, true, length, include);
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition>
  filePathsLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'filePaths', length, include, 999999, true);
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition>
  filePathsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'filePaths',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition> idEqualTo(
    Id value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition>
  locationJsonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'location'),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition>
  locationJsonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'location'),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition> locationJsonEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'location',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition>
  locationJsonGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'location',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition>
  locationJsonLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'location',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition> locationJsonBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'location',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition>
  locationJsonStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'location',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition>
  locationJsonEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'location',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition>
  locationJsonContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'location',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition> locationJsonMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'location',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition>
  locationJsonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'location', value: ''),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition>
  locationJsonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'location', value: ''),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition>
  meetingJsonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'meeting'),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition>
  meetingJsonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'meeting'),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition> meetingJsonEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'meeting',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition>
  meetingJsonGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'meeting',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition> meetingJsonLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'meeting',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition> meetingJsonBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'meeting',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition>
  meetingJsonStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'meeting',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition> meetingJsonEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'meeting',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition> meetingJsonContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'meeting',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition> meetingJsonMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'meeting',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition>
  meetingJsonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'meeting', value: ''),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition>
  meetingJsonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'meeting', value: ''),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition>
  petitionJsonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'petition'),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition>
  petitionJsonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'petition'),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition> petitionJsonEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'petition',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition>
  petitionJsonGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'petition',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition>
  petitionJsonLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'petition',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition> petitionJsonBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'petition',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition>
  petitionJsonStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'petition',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition>
  petitionJsonEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'petition',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition>
  petitionJsonContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'petition',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition> petitionJsonMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'petition',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition>
  petitionJsonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'petition', value: ''),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition>
  petitionJsonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'petition', value: ''),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition>
  replyToJsonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'replyTo'),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition>
  replyToJsonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'replyTo'),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition> replyToJsonEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'replyTo',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition>
  replyToJsonGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'replyTo',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition> replyToJsonLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'replyTo',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition> replyToJsonBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'replyTo',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition>
  replyToJsonStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'replyTo',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition> replyToJsonEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'replyTo',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition> replyToJsonContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'replyTo',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition> replyToJsonMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'replyTo',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition>
  replyToJsonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'replyTo', value: ''),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition>
  replyToJsonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'replyTo', value: ''),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition>
  repostOfJsonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'repostOf'),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition>
  repostOfJsonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'repostOf'),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition> repostOfJsonEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'repostOf',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition>
  repostOfJsonGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'repostOf',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition>
  repostOfJsonLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'repostOf',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition> repostOfJsonBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'repostOf',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition>
  repostOfJsonStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'repostOf',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition>
  repostOfJsonEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'repostOf',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition>
  repostOfJsonContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'repostOf',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition> repostOfJsonMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'repostOf',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition>
  repostOfJsonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'repostOf', value: ''),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition>
  repostOfJsonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'repostOf', value: ''),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition>
  sectionJsonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'section'),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition>
  sectionJsonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'section'),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition> sectionJsonEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'section',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition>
  sectionJsonGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'section',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition> sectionJsonLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'section',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition> sectionJsonBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'section',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition>
  sectionJsonStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'section',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition> sectionJsonEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'section',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition> sectionJsonContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'section',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition> sectionJsonMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'section',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition>
  sectionJsonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'section', value: ''),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition>
  sectionJsonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'section', value: ''),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition> surveyJsonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'survey'),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition>
  surveyJsonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'survey'),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition> surveyJsonEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'survey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition>
  surveyJsonGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'survey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition> surveyJsonLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'survey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition> surveyJsonBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'survey',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition>
  surveyJsonStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'survey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition> surveyJsonEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'survey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition> surveyJsonContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'survey',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition> surveyJsonMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'survey',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition>
  surveyJsonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'survey', value: ''),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition>
  surveyJsonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'survey', value: ''),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition> tagsJsonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'tags'),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition>
  tagsJsonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'tags'),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition> tagsJsonEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'tags',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition> tagsJsonGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'tags',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition> tagsJsonLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'tags',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition> tagsJsonBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'tags',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition> tagsJsonStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'tags',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition> tagsJsonEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'tags',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition> tagsJsonContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'tags',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition> tagsJsonMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'tags',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition> tagsJsonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'tags', value: ''),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition>
  tagsJsonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'tags', value: ''),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition> updatedAtEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'updatedAt', value: value),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition>
  updatedAtGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'updatedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition> updatedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'updatedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterFilterCondition> updatedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'updatedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension DraftPostQueryObject
    on QueryBuilder<DraftPost, DraftPost, QFilterCondition> {}

extension DraftPostQueryLinks
    on QueryBuilder<DraftPost, DraftPost, QFilterCondition> {}

extension DraftPostQuerySortBy on QueryBuilder<DraftPost, DraftPost, QSortBy> {
  QueryBuilder<DraftPost, DraftPost, QAfterSortBy> sortByBallotJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ballot', Sort.asc);
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterSortBy> sortByBallotJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ballot', Sort.desc);
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterSortBy> sortByBody() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'body', Sort.asc);
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterSortBy> sortByBodyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'body', Sort.desc);
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterSortBy> sortByCommunityNoteOfJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'communityNoteOf', Sort.asc);
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterSortBy>
  sortByCommunityNoteOfJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'communityNoteOf', Sort.desc);
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterSortBy> sortByLocationJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'location', Sort.asc);
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterSortBy> sortByLocationJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'location', Sort.desc);
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterSortBy> sortByMeetingJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'meeting', Sort.asc);
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterSortBy> sortByMeetingJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'meeting', Sort.desc);
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterSortBy> sortByPetitionJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'petition', Sort.asc);
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterSortBy> sortByPetitionJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'petition', Sort.desc);
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterSortBy> sortByReplyToJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'replyTo', Sort.asc);
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterSortBy> sortByReplyToJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'replyTo', Sort.desc);
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterSortBy> sortByRepostOfJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'repostOf', Sort.asc);
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterSortBy> sortByRepostOfJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'repostOf', Sort.desc);
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterSortBy> sortBySectionJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'section', Sort.asc);
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterSortBy> sortBySectionJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'section', Sort.desc);
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterSortBy> sortBySurveyJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'survey', Sort.asc);
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterSortBy> sortBySurveyJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'survey', Sort.desc);
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterSortBy> sortByTagsJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tags', Sort.asc);
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterSortBy> sortByTagsJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tags', Sort.desc);
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension DraftPostQuerySortThenBy
    on QueryBuilder<DraftPost, DraftPost, QSortThenBy> {
  QueryBuilder<DraftPost, DraftPost, QAfterSortBy> thenByBallotJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ballot', Sort.asc);
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterSortBy> thenByBallotJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ballot', Sort.desc);
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterSortBy> thenByBody() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'body', Sort.asc);
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterSortBy> thenByBodyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'body', Sort.desc);
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterSortBy> thenByCommunityNoteOfJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'communityNoteOf', Sort.asc);
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterSortBy>
  thenByCommunityNoteOfJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'communityNoteOf', Sort.desc);
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterSortBy> thenByLocationJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'location', Sort.asc);
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterSortBy> thenByLocationJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'location', Sort.desc);
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterSortBy> thenByMeetingJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'meeting', Sort.asc);
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterSortBy> thenByMeetingJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'meeting', Sort.desc);
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterSortBy> thenByPetitionJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'petition', Sort.asc);
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterSortBy> thenByPetitionJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'petition', Sort.desc);
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterSortBy> thenByReplyToJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'replyTo', Sort.asc);
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterSortBy> thenByReplyToJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'replyTo', Sort.desc);
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterSortBy> thenByRepostOfJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'repostOf', Sort.asc);
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterSortBy> thenByRepostOfJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'repostOf', Sort.desc);
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterSortBy> thenBySectionJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'section', Sort.asc);
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterSortBy> thenBySectionJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'section', Sort.desc);
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterSortBy> thenBySurveyJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'survey', Sort.asc);
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterSortBy> thenBySurveyJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'survey', Sort.desc);
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterSortBy> thenByTagsJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tags', Sort.asc);
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterSortBy> thenByTagsJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tags', Sort.desc);
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<DraftPost, DraftPost, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension DraftPostQueryWhereDistinct
    on QueryBuilder<DraftPost, DraftPost, QDistinct> {
  QueryBuilder<DraftPost, DraftPost, QDistinct> distinctByBallotJson({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ballot', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DraftPost, DraftPost, QDistinct> distinctByBody({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'body', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DraftPost, DraftPost, QDistinct> distinctByCommunityNoteOfJson({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'communityNoteOf',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<DraftPost, DraftPost, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<DraftPost, DraftPost, QDistinct> distinctByFilePaths() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'filePaths');
    });
  }

  QueryBuilder<DraftPost, DraftPost, QDistinct> distinctByLocationJson({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'location', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DraftPost, DraftPost, QDistinct> distinctByMeetingJson({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'meeting', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DraftPost, DraftPost, QDistinct> distinctByPetitionJson({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'petition', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DraftPost, DraftPost, QDistinct> distinctByReplyToJson({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'replyTo', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DraftPost, DraftPost, QDistinct> distinctByRepostOfJson({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'repostOf', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DraftPost, DraftPost, QDistinct> distinctBySectionJson({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'section', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DraftPost, DraftPost, QDistinct> distinctBySurveyJson({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'survey', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DraftPost, DraftPost, QDistinct> distinctByTagsJson({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tags', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DraftPost, DraftPost, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension DraftPostQueryProperty
    on QueryBuilder<DraftPost, DraftPost, QQueryProperty> {
  QueryBuilder<DraftPost, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<DraftPost, String?, QQueryOperations> ballotJsonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ballot');
    });
  }

  QueryBuilder<DraftPost, String, QQueryOperations> bodyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'body');
    });
  }

  QueryBuilder<DraftPost, String?, QQueryOperations>
  communityNoteOfJsonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'communityNoteOf');
    });
  }

  QueryBuilder<DraftPost, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<DraftPost, List<String>, QQueryOperations> filePathsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'filePaths');
    });
  }

  QueryBuilder<DraftPost, String?, QQueryOperations> locationJsonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'location');
    });
  }

  QueryBuilder<DraftPost, String?, QQueryOperations> meetingJsonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'meeting');
    });
  }

  QueryBuilder<DraftPost, String?, QQueryOperations> petitionJsonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'petition');
    });
  }

  QueryBuilder<DraftPost, String?, QQueryOperations> replyToJsonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'replyTo');
    });
  }

  QueryBuilder<DraftPost, String?, QQueryOperations> repostOfJsonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'repostOf');
    });
  }

  QueryBuilder<DraftPost, String?, QQueryOperations> sectionJsonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'section');
    });
  }

  QueryBuilder<DraftPost, String?, QQueryOperations> surveyJsonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'survey');
    });
  }

  QueryBuilder<DraftPost, String?, QQueryOperations> tagsJsonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tags');
    });
  }

  QueryBuilder<DraftPost, DateTime, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}
