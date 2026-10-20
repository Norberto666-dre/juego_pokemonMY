// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deck.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Deck {
  String get id;
  String? get creatureUid;
  String get name;
  List<String> get cardIds;
  DateTime get updatedAt;

  /// Create a copy of Deck
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeckCopyWith<Deck> get copyWith =>
      _$DeckCopyWithImpl<Deck>(this as Deck, _$identity);

  @override
  bool operator ==(Object other) {
    final _this = this as Deck;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Deck &&
            (identical(other.id, _this.id) || other.id == _this.id) &&
            (identical(other.creatureUid, _this.creatureUid) ||
                other.creatureUid == _this.creatureUid) &&
            (identical(other.name, _this.name) || other.name == _this.name) &&
            const DeepCollectionEquality()
                .equals(other.cardIds, _this.cardIds) &&
            (identical(other.updatedAt, _this.updatedAt) ||
                other.updatedAt == _this.updatedAt));
  }

  @override
  int get hashCode {
    final _this = this as Deck;
    return Object.hash(runtimeType, _this.id, _this.creatureUid, _this.name,
        const DeepCollectionEquality().hash(_this.cardIds), _this.updatedAt);
  }

  @override
  String toString() {
    final _this = this as Deck;
    return 'Deck(id: ${_this.id}, creatureUid: ${_this.creatureUid}, name: ${_this.name}, cardIds: ${_this.cardIds}, updatedAt: ${_this.updatedAt})';
  }
}

/// @nodoc
abstract mixin class $DeckCopyWith<$Res> {
  factory $DeckCopyWith(Deck value, $Res Function(Deck) _then) =
      _$DeckCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String? creatureUid,
      String name,
      List<String> cardIds,
      DateTime updatedAt});
}

/// @nodoc
class _$DeckCopyWithImpl<$Res> implements $DeckCopyWith<$Res> {
  _$DeckCopyWithImpl(this._self, this._then);

  final Deck _self;
  final $Res Function(Deck) _then;

  /// Create a copy of Deck
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? creatureUid = freezed,
    Object? name = null,
    Object? cardIds = null,
    Object? updatedAt = null,
  }) {
    return _then(Deck(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      creatureUid: freezed == creatureUid
          ? _self.creatureUid
          : creatureUid // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      cardIds: null == cardIds
          ? _self.cardIds
          : cardIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// Adds pattern-matching-related methods to [Deck].
extension DeckPatterns on Deck {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Deck value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Deck() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Deck value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Deck():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Deck value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Deck() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String id, String? creatureUid, String name,
            List<String> cardIds, DateTime updatedAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Deck() when $default != null:
        return $default(_that.id, _that.creatureUid, _that.name, _that.cardIds,
            _that.updatedAt);
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String id, String? creatureUid, String name,
            List<String> cardIds, DateTime updatedAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Deck():
        return $default(_that.id, _that.creatureUid, _that.name, _that.cardIds,
            _that.updatedAt);
      case _:
        throw StateError('Unexpected subclass');
    }
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String id, String? creatureUid, String name,
            List<String> cardIds, DateTime updatedAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Deck() when $default != null:
        return $default(_that.id, _that.creatureUid, _that.name, _that.cardIds,
            _that.updatedAt);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Deck implements Deck {
  const _Deck(
      {required this.id,
      this.creatureUid,
      required this.name,
      required List<String> cardIds,
      required this.updatedAt})
      : _cardIds = cardIds;

  @override
  final String id;
  @override
  final String? creatureUid;
  @override
  final String name;
  final List<String> _cardIds;
  @override
  List<String> get cardIds {
    if (_cardIds is EqualUnmodifiableListView) return _cardIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cardIds);
  }

  @override
  final DateTime updatedAt;

  /// Create a copy of Deck
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DeckCopyWith<_Deck> get copyWith =>
      __$DeckCopyWithImpl<_Deck>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Deck &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.creatureUid, creatureUid) ||
                other.creatureUid == creatureUid) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other.cardIds, _cardIds) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, creatureUid, name,
        const DeepCollectionEquality().hash(_cardIds), updatedAt);
  }

  @override
  String toString() {
    return 'Deck(id: $id, creatureUid: $creatureUid, name: $name, cardIds: $cardIds, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$DeckCopyWith<$Res> implements $DeckCopyWith<$Res> {
  factory _$DeckCopyWith(_Deck value, $Res Function(_Deck) _then) =
      __$DeckCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String? creatureUid,
      String name,
      List<String> cardIds,
      DateTime updatedAt});
}

/// @nodoc
class __$DeckCopyWithImpl<$Res> implements _$DeckCopyWith<$Res> {
  __$DeckCopyWithImpl(this._self, this._then);

  final _Deck _self;
  final $Res Function(_Deck) _then;

  /// Create a copy of Deck
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? creatureUid = freezed,
    Object? name = null,
    Object? cardIds = null,
    Object? updatedAt = null,
  }) {
    return _then(_Deck(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      creatureUid: freezed == creatureUid
          ? _self.creatureUid
          : creatureUid // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      cardIds: null == cardIds
          ? _self._cardIds
          : cardIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
