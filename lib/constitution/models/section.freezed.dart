// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'section.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Section {

 int get id; int get position; String? get tag; String get numeral; String get text;@JsonKey(name: 'is_title') bool get isTitle; List<Section> get subsections;@JsonKey(name: 'is_bookmarked') bool get isBookmarked;
/// Create a copy of Section
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SectionCopyWith<Section> get copyWith => _$SectionCopyWithImpl<Section>(this as Section, _$identity);

  /// Serializes this Section to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Section&&(identical(other.id, id) || other.id == id)&&(identical(other.position, position) || other.position == position)&&(identical(other.tag, tag) || other.tag == tag)&&(identical(other.numeral, numeral) || other.numeral == numeral)&&(identical(other.text, text) || other.text == text)&&(identical(other.isTitle, isTitle) || other.isTitle == isTitle)&&const DeepCollectionEquality().equals(other.subsections, subsections)&&(identical(other.isBookmarked, isBookmarked) || other.isBookmarked == isBookmarked));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,position,tag,numeral,text,isTitle,const DeepCollectionEquality().hash(subsections),isBookmarked);

@override
String toString() {
  return 'Section(id: $id, position: $position, tag: $tag, numeral: $numeral, text: $text, isTitle: $isTitle, subsections: $subsections, isBookmarked: $isBookmarked)';
}


}

/// @nodoc
abstract mixin class $SectionCopyWith<$Res>  {
  factory $SectionCopyWith(Section value, $Res Function(Section) _then) = _$SectionCopyWithImpl;
@useResult
$Res call({
 int id, int position, String? tag, String numeral, String text,@JsonKey(name: 'is_title') bool isTitle, List<Section> subsections,@JsonKey(name: 'is_bookmarked') bool isBookmarked
});




}
/// @nodoc
class _$SectionCopyWithImpl<$Res>
    implements $SectionCopyWith<$Res> {
  _$SectionCopyWithImpl(this._self, this._then);

  final Section _self;
  final $Res Function(Section) _then;

/// Create a copy of Section
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? position = null,Object? tag = freezed,Object? numeral = null,Object? text = null,Object? isTitle = null,Object? subsections = null,Object? isBookmarked = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as int,tag: freezed == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as String?,numeral: null == numeral ? _self.numeral : numeral // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,isTitle: null == isTitle ? _self.isTitle : isTitle // ignore: cast_nullable_to_non_nullable
as bool,subsections: null == subsections ? _self.subsections : subsections // ignore: cast_nullable_to_non_nullable
as List<Section>,isBookmarked: null == isBookmarked ? _self.isBookmarked : isBookmarked // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Section].
extension SectionPatterns on Section {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Section value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Section() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Section value)  $default,){
final _that = this;
switch (_that) {
case _Section():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Section value)?  $default,){
final _that = this;
switch (_that) {
case _Section() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int position,  String? tag,  String numeral,  String text, @JsonKey(name: 'is_title')  bool isTitle,  List<Section> subsections, @JsonKey(name: 'is_bookmarked')  bool isBookmarked)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Section() when $default != null:
return $default(_that.id,_that.position,_that.tag,_that.numeral,_that.text,_that.isTitle,_that.subsections,_that.isBookmarked);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int position,  String? tag,  String numeral,  String text, @JsonKey(name: 'is_title')  bool isTitle,  List<Section> subsections, @JsonKey(name: 'is_bookmarked')  bool isBookmarked)  $default,) {final _that = this;
switch (_that) {
case _Section():
return $default(_that.id,_that.position,_that.tag,_that.numeral,_that.text,_that.isTitle,_that.subsections,_that.isBookmarked);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int position,  String? tag,  String numeral,  String text, @JsonKey(name: 'is_title')  bool isTitle,  List<Section> subsections, @JsonKey(name: 'is_bookmarked')  bool isBookmarked)?  $default,) {final _that = this;
switch (_that) {
case _Section() when $default != null:
return $default(_that.id,_that.position,_that.tag,_that.numeral,_that.text,_that.isTitle,_that.subsections,_that.isBookmarked);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Section implements Section {
  const _Section({required this.id, required this.position, required this.tag, required this.numeral, required this.text, @JsonKey(name: 'is_title') required this.isTitle, required final  List<Section> subsections, @JsonKey(name: 'is_bookmarked') required this.isBookmarked}): _subsections = subsections;
  factory _Section.fromJson(Map<String, dynamic> json) => _$SectionFromJson(json);

@override final  int id;
@override final  int position;
@override final  String? tag;
@override final  String numeral;
@override final  String text;
@override@JsonKey(name: 'is_title') final  bool isTitle;
 final  List<Section> _subsections;
@override List<Section> get subsections {
  if (_subsections is EqualUnmodifiableListView) return _subsections;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_subsections);
}

@override@JsonKey(name: 'is_bookmarked') final  bool isBookmarked;

/// Create a copy of Section
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SectionCopyWith<_Section> get copyWith => __$SectionCopyWithImpl<_Section>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SectionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Section&&(identical(other.id, id) || other.id == id)&&(identical(other.position, position) || other.position == position)&&(identical(other.tag, tag) || other.tag == tag)&&(identical(other.numeral, numeral) || other.numeral == numeral)&&(identical(other.text, text) || other.text == text)&&(identical(other.isTitle, isTitle) || other.isTitle == isTitle)&&const DeepCollectionEquality().equals(other._subsections, _subsections)&&(identical(other.isBookmarked, isBookmarked) || other.isBookmarked == isBookmarked));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,position,tag,numeral,text,isTitle,const DeepCollectionEquality().hash(_subsections),isBookmarked);

@override
String toString() {
  return 'Section(id: $id, position: $position, tag: $tag, numeral: $numeral, text: $text, isTitle: $isTitle, subsections: $subsections, isBookmarked: $isBookmarked)';
}


}

/// @nodoc
abstract mixin class _$SectionCopyWith<$Res> implements $SectionCopyWith<$Res> {
  factory _$SectionCopyWith(_Section value, $Res Function(_Section) _then) = __$SectionCopyWithImpl;
@override @useResult
$Res call({
 int id, int position, String? tag, String numeral, String text,@JsonKey(name: 'is_title') bool isTitle, List<Section> subsections,@JsonKey(name: 'is_bookmarked') bool isBookmarked
});




}
/// @nodoc
class __$SectionCopyWithImpl<$Res>
    implements _$SectionCopyWith<$Res> {
  __$SectionCopyWithImpl(this._self, this._then);

  final _Section _self;
  final $Res Function(_Section) _then;

/// Create a copy of Section
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? position = null,Object? tag = freezed,Object? numeral = null,Object? text = null,Object? isTitle = null,Object? subsections = null,Object? isBookmarked = null,}) {
  return _then(_Section(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as int,tag: freezed == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as String?,numeral: null == numeral ? _self.numeral : numeral // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,isTitle: null == isTitle ? _self.isTitle : isTitle // ignore: cast_nullable_to_non_nullable
as bool,subsections: null == subsections ? _self._subsections : subsections // ignore: cast_nullable_to_non_nullable
as List<Section>,isBookmarked: null == isBookmarked ? _self.isBookmarked : isBookmarked // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
