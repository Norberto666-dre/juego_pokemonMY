// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'card_action.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CardAction {
  String get id;
  String get name;
  CardKind get kind;
  int get energyCost;
  Rarity get rarity;
  String? get moveId;
  String? get itemId;
  int get priority;
  int get usesPerBattle;
  String? get artUrl;
  String? get tcgCardId;
  int get level;

  /// Create a copy of CardAction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CardActionCopyWith<CardAction> get copyWith =>
      _$CardActionCopyWithImpl<CardAction>(this as CardAction, _$identity);

  @override
  bool operator ==(Object other) {
    final _this = this as CardAction;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CardAction &&
            (identical(other.id, _this.id) || other.id == _this.id) &&
            (identical(other.name, _this.name) || other.name == _this.name) &&
            (identical(other.kind, _this.kind) || other.kind == _this.kind) &&
            (identical(other.energyCost, _this.energyCost) ||
                other.energyCost == _this.energyCost) &&
            (identical(other.rarity, _this.rarity) ||
                other.rarity == _this.rarity) &&
            (identical(other.moveId, _this.moveId) ||
                other.moveId == _this.moveId) &&
            (identical(other.itemId, _this.itemId) ||
                other.itemId == _this.itemId) &&
            (identical(other.priority, _this.priority) ||
                other.priority == _this.priority) &&
            (identical(other.usesPerBattle, _this.usesPerBattle) ||
                other.usesPerBattle == _this.usesPerBattle) &&
            (identical(other.artUrl, _this.artUrl) ||
                other.artUrl == _this.artUrl) &&
            (identical(other.tcgCardId, _this.tcgCardId) ||
                other.tcgCardId == _this.tcgCardId) &&
            (identical(other.level, _this.level) ||
                other.level == _this.level));
  }

  @override
  int get hashCode {
    final _this = this as CardAction;
    return Object.hash(
        runtimeType,
        _this.id,
        _this.name,
        _this.kind,
        _this.energyCost,
        _this.rarity,
        _this.moveId,
        _this.itemId,
        _this.priority,
        _this.usesPerBattle,
        _this.artUrl,
        _this.tcgCardId,
        _this.level);
  }

  @override
  String toString() {
    final _this = this as CardAction;
    return 'CardAction(id: ${_this.id}, name: ${_this.name}, kind: ${_this.kind}, energyCost: ${_this.energyCost}, rarity: ${_this.rarity}, moveId: ${_this.moveId}, itemId: ${_this.itemId}, priority: ${_this.priority}, usesPerBattle: ${_this.usesPerBattle}, artUrl: ${_this.artUrl}, tcgCardId: ${_this.tcgCardId}, level: ${_this.level})';
  }
}

/// @nodoc
abstract mixin class $CardActionCopyWith<$Res> {
  factory $CardActionCopyWith(
          CardAction value, $Res Function(CardAction) _then) =
      _$CardActionCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String name,
      CardKind kind,
      int energyCost,
      Rarity rarity,
      String? moveId,
      String? itemId,
      int priority,
      int usesPerBattle,
      String? artUrl,
      String? tcgCardId,
      int level});
}

/// @nodoc
class _$CardActionCopyWithImpl<$Res> implements $CardActionCopyWith<$Res> {
  _$CardActionCopyWithImpl(this._self, this._then);

  final CardAction _self;
  final $Res Function(CardAction) _then;

  /// Create a copy of CardAction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? kind = null,
    Object? energyCost = null,
    Object? rarity = null,
    Object? moveId = freezed,
    Object? itemId = freezed,
    Object? priority = null,
    Object? usesPerBattle = null,
    Object? artUrl = freezed,
    Object? tcgCardId = freezed,
    Object? level = null,
  }) {
    return _then(CardAction(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      kind: null == kind
          ? _self.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as CardKind,
      energyCost: null == energyCost
          ? _self.energyCost
          : energyCost // ignore: cast_nullable_to_non_nullable
              as int,
      rarity: null == rarity
          ? _self.rarity
          : rarity // ignore: cast_nullable_to_non_nullable
              as Rarity,
      moveId: freezed == moveId
          ? _self.moveId
          : moveId // ignore: cast_nullable_to_non_nullable
              as String?,
      itemId: freezed == itemId
          ? _self.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String?,
      priority: null == priority
          ? _self.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int,
      usesPerBattle: null == usesPerBattle
          ? _self.usesPerBattle
          : usesPerBattle // ignore: cast_nullable_to_non_nullable
              as int,
      artUrl: freezed == artUrl
          ? _self.artUrl
          : artUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      tcgCardId: freezed == tcgCardId
          ? _self.tcgCardId
          : tcgCardId // ignore: cast_nullable_to_non_nullable
              as String?,
      level: null == level
          ? _self.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [CardAction].
extension CardActionPatterns on CardAction {
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
    TResult Function(_CardAction value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CardAction() when $default != null:
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
    TResult Function(_CardAction value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CardAction():
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
    TResult? Function(_CardAction value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CardAction() when $default != null:
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
    TResult Function(
            String id,
            String name,
            CardKind kind,
            int energyCost,
            Rarity rarity,
            String? moveId,
            String? itemId,
            int priority,
            int usesPerBattle,
            String? artUrl,
            String? tcgCardId,
            int level)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CardAction() when $default != null:
        return $default(
            _that.id,
            _that.name,
            _that.kind,
            _that.energyCost,
            _that.rarity,
            _that.moveId,
            _that.itemId,
            _that.priority,
            _that.usesPerBattle,
            _that.artUrl,
            _that.tcgCardId,
            _that.level);
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
    TResult Function(
            String id,
            String name,
            CardKind kind,
            int energyCost,
            Rarity rarity,
            String? moveId,
            String? itemId,
            int priority,
            int usesPerBattle,
            String? artUrl,
            String? tcgCardId,
            int level)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CardAction():
        return $default(
            _that.id,
            _that.name,
            _that.kind,
            _that.energyCost,
            _that.rarity,
            _that.moveId,
            _that.itemId,
            _that.priority,
            _that.usesPerBattle,
            _that.artUrl,
            _that.tcgCardId,
            _that.level);
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
    TResult? Function(
            String id,
            String name,
            CardKind kind,
            int energyCost,
            Rarity rarity,
            String? moveId,
            String? itemId,
            int priority,
            int usesPerBattle,
            String? artUrl,
            String? tcgCardId,
            int level)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CardAction() when $default != null:
        return $default(
            _that.id,
            _that.name,
            _that.kind,
            _that.energyCost,
            _that.rarity,
            _that.moveId,
            _that.itemId,
            _that.priority,
            _that.usesPerBattle,
            _that.artUrl,
            _that.tcgCardId,
            _that.level);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _CardAction implements CardAction {
  const _CardAction(
      {required this.id,
      required this.name,
      required this.kind,
      required this.energyCost,
      required this.rarity,
      this.moveId,
      this.itemId,
      this.priority = 0,
      this.usesPerBattle = 1,
      this.artUrl,
      this.tcgCardId,
      this.level = 1});

  @override
  final String id;
  @override
  final String name;
  @override
  final CardKind kind;
  @override
  final int energyCost;
  @override
  final Rarity rarity;
  @override
  final String? moveId;
  @override
  final String? itemId;
  @override
  @JsonKey()
  final int priority;
  @override
  @JsonKey()
  final int usesPerBattle;
  @override
  final String? artUrl;
  @override
  final String? tcgCardId;
  @override
  @JsonKey()
  final int level;

  /// Create a copy of CardAction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CardActionCopyWith<_CardAction> get copyWith =>
      __$CardActionCopyWithImpl<_CardAction>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CardAction &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.kind, kind) || other.kind == kind) &&
            (identical(other.energyCost, energyCost) ||
                other.energyCost == energyCost) &&
            (identical(other.rarity, rarity) || other.rarity == rarity) &&
            (identical(other.moveId, moveId) || other.moveId == moveId) &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.usesPerBattle, usesPerBattle) ||
                other.usesPerBattle == usesPerBattle) &&
            (identical(other.artUrl, artUrl) || other.artUrl == artUrl) &&
            (identical(other.tcgCardId, tcgCardId) ||
                other.tcgCardId == tcgCardId) &&
            (identical(other.level, level) || other.level == level));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, name, kind, energyCost, rarity, moveId,
        itemId, priority, usesPerBattle, artUrl, tcgCardId, level);
  }

  @override
  String toString() {
    return 'CardAction(id: $id, name: $name, kind: $kind, energyCost: $energyCost, rarity: $rarity, moveId: $moveId, itemId: $itemId, priority: $priority, usesPerBattle: $usesPerBattle, artUrl: $artUrl, tcgCardId: $tcgCardId, level: $level)';
  }
}

/// @nodoc
abstract mixin class _$CardActionCopyWith<$Res>
    implements $CardActionCopyWith<$Res> {
  factory _$CardActionCopyWith(
          _CardAction value, $Res Function(_CardAction) _then) =
      __$CardActionCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      CardKind kind,
      int energyCost,
      Rarity rarity,
      String? moveId,
      String? itemId,
      int priority,
      int usesPerBattle,
      String? artUrl,
      String? tcgCardId,
      int level});
}

/// @nodoc
class __$CardActionCopyWithImpl<$Res> implements _$CardActionCopyWith<$Res> {
  __$CardActionCopyWithImpl(this._self, this._then);

  final _CardAction _self;
  final $Res Function(_CardAction) _then;

  /// Create a copy of CardAction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? kind = null,
    Object? energyCost = null,
    Object? rarity = null,
    Object? moveId = freezed,
    Object? itemId = freezed,
    Object? priority = null,
    Object? usesPerBattle = null,
    Object? artUrl = freezed,
    Object? tcgCardId = freezed,
    Object? level = null,
  }) {
    return _then(_CardAction(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      kind: null == kind
          ? _self.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as CardKind,
      energyCost: null == energyCost
          ? _self.energyCost
          : energyCost // ignore: cast_nullable_to_non_nullable
              as int,
      rarity: null == rarity
          ? _self.rarity
          : rarity // ignore: cast_nullable_to_non_nullable
              as Rarity,
      moveId: freezed == moveId
          ? _self.moveId
          : moveId // ignore: cast_nullable_to_non_nullable
              as String?,
      itemId: freezed == itemId
          ? _self.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String?,
      priority: null == priority
          ? _self.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int,
      usesPerBattle: null == usesPerBattle
          ? _self.usesPerBattle
          : usesPerBattle // ignore: cast_nullable_to_non_nullable
              as int,
      artUrl: freezed == artUrl
          ? _self.artUrl
          : artUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      tcgCardId: freezed == tcgCardId
          ? _self.tcgCardId
          : tcgCardId // ignore: cast_nullable_to_non_nullable
              as String?,
      level: null == level
          ? _self.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
