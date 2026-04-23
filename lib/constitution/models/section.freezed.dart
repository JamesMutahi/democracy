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

 int get id; String get numeral; String get text;@JsonKey(name: 'is_title') bool get isTitle;@JsonKey(name: 'parent_count') int get parentCount;
/// Create a copy of Section
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SectionCopyWith<Section> get copyWith => _$SectionCopyWithImpl<Section>(this as Section, _$identity);

  /// Serializes this Section to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Section&&(identical(other.id, id) || other.id == id)&&(identical(other.numeral, numeral) || other.numeral == numeral)&&(identical(other.text, text) || other.text == text)&&(identical(other.isTitle, isTitle) || other.isTitle == isTitle)&&(identical(other.parentCount, parentCount) || other.parentCount == parentCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,numeral,text,isTitle,parentCount);

@override
String toString() {
  return 'Section(id: $id, numeral: $numeral, text: $text, isTitle: $isTitle, parentCount: $parentCount)';
}


}

/// @nodoc
abstract mixin class $SectionCopyWith<$Res>  {
  factory $SectionCopyWith(Section value, $Res Function(Section) _then) = _$SectionCopyWithImpl;
@useResult
$Res call({
 int id, String numeral, String text,@JsonKey(name: 'is_title') bool isTitle,@JsonKey(name: 'parent_count') int parentCount
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? numeral = null,Object? text = null,Object? isTitle = null,Object? parentCount = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,numeral: null == numeral ? _self.numeral : numeral // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,isTitle: null == isTitle ? _self.isTitle : isTitle // ignore: cast_nullable_to_non_nullable
as bool,parentCount: null == parentCount ? _self.parentCount : parentCount // ignore: cast_nullable_to_non_nullable
as int,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String numeral,  String text, @JsonKey(name: 'is_title')  bool isTitle, @JsonKey(name: 'parent_count')  int parentCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Section() when $default != null:
return $default(_that.id,_that.numeral,_that.text,_that.isTitle,_that.parentCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String numeral,  String text, @JsonKey(name: 'is_title')  bool isTitle, @JsonKey(name: 'parent_count')  int parentCount)  $default,) {final _that = this;
switch (_that) {
case _Section():
return $default(_that.id,_that.numeral,_that.text,_that.isTitle,_that.parentCount);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String numeral,  String text, @JsonKey(name: 'is_title')  bool isTitle, @JsonKey(name: 'parent_count')  int parentCount)?  $default,) {final _that = this;
switch (_that) {
case _Section() when $default != null:
return $default(_that.id,_that.numeral,_that.text,_that.isTitle,_that.parentCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Section implements Section {
  const _Section({required this.id, required this.numeral, required this.text, @JsonKey(name: 'is_title') required this.isTitle, @JsonKey(name: 'parent_count') required this.parentCount});
  factory _Section.fromJson(Map<String, dynamic> json) => _$SectionFromJson(json);

@override final  int id;
@override final  String numeral;
@override final  String text;
@override@JsonKey(name: 'is_title') final  bool isTitle;
@override@JsonKey(name: 'parent_count') final  int parentCount;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Section&&(identical(other.id, id) || other.id == id)&&(identical(other.numeral, numeral) || other.numeral == numeral)&&(identical(other.text, text) || other.text == text)&&(identical(other.isTitle, isTitle) || other.isTitle == isTitle)&&(identical(other.parentCount, parentCount) || other.parentCount == parentCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,numeral,text,isTitle,parentCount);

@override
String toString() {
  return 'Section(id: $id, numeral: $numeral, text: $text, isTitle: $isTitle, parentCount: $parentCount)';
}


}

/// @nodoc
abstract mixin class _$SectionCopyWith<$Res> implements $SectionCopyWith<$Res> {
  factory _$SectionCopyWith(_Section value, $Res Function(_Section) _then) = __$SectionCopyWithImpl;
@override @useResult
$Res call({
 int id, String numeral, String text,@JsonKey(name: 'is_title') bool isTitle,@JsonKey(name: 'parent_count') int parentCount
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? numeral = null,Object? text = null,Object? isTitle = null,Object? parentCount = null,}) {
  return _then(_Section(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,numeral: null == numeral ? _self.numeral : numeral // ignore: cast_nullable_to_non_nullable
as String,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,isTitle: null == isTitle ? _self.isTitle : isTitle // ignore: cast_nullable_to_non_nullable
as bool,parentCount: null == parentCount ? _self.parentCount : parentCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
