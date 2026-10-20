// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'player_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlayerProfile {
  String get id;
  String get name;
  String get avatarId;
  int get level;
  int get exp;
  int get coins;
  int get gems;
  int get tokens;
  int get tickets;
  int get elo;
  int get maxDepth;
  List<String> get badges;
  DateTime get createdAt;

  /// Create a copy of PlayerProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PlayerProfileCopyWith<PlayerProfile> get copyWith =>
      _$PlayerProfileCopyWithImpl<PlayerProfile>(
          this as PlayerProfile, _$identity);

  @override
  bool operator ==(Object other) {
    final _this = this as PlayerProfile;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PlayerProfile &&
            (identical(other.id, _this.id) || other.id == _this.id) &&
            (identical(other.name, _this.name) || other.name == _this.name) &&
            (identical(other.avatarId, _this.avatarId) ||
                other.avatarId == _this.avatarId) &&
            (identical(other.level, _this.level) ||
                other.level == _this.level) &&
            (identical(other.exp, _this.exp) || other.exp == _this.exp) &&
            (identical(other.coins, _this.coins) ||
                other.coins == _this.coins) &&
            (identical(other.gems, _this.gems) || other.gems == _this.gems) &&
            (identical(other.tokens, _this.tokens) ||
                other.tokens == _this.tokens) &&
            (identical(other.tickets, _this.tickets) ||
                other.tickets == _this.tickets) &&
            (identical(other.elo, _this.elo) || other.elo == _this.elo) &&
            (identical(other.maxDepth, _this.maxDepth) ||
                other.maxDepth == _this.maxDepth) &&
            const DeepCollectionEquality().equals(other.badges, _this.badges) &&
            (identical(other.createdAt, _this.createdAt) ||
                other.createdAt == _this.createdAt));
  }

  @override
  int get hashCode {
    final _this = this as PlayerProfile;
    return Object.hash(
        runtimeType,
        _this.id,
        _this.name,
        _this.avatarId,
        _this.level,
        _this.exp,
        _this.coins,
        _this.gems,
        _this.tokens,
        _this.tickets,
        _this.elo,
        _this.maxDepth,
        const DeepCollectionEquality().hash(_this.badges),
        _this.createdAt);
  }

  @override
  String toString() {
    final _this = this as PlayerProfile;
    return 'PlayerProfile(id: ${_this.id}, name: ${_this.name}, avatarId: ${_this.avatarId}, level: ${_this.level}, exp: ${_this.exp}, coins: ${_this.coins}, gems: ${_this.gems}, tokens: ${_this.tokens}, tickets: ${_this.tickets}, elo: ${_this.elo}, maxDepth: ${_this.maxDepth}, badges: ${_this.badges}, createdAt: ${_this.createdAt})';
  }
}

/// @nodoc
abstract mixin class $PlayerProfileCopyWith<$Res> {
  factory $PlayerProfileCopyWith(
          PlayerProfile value, $Res Function(PlayerProfile) _then) =
      _$PlayerProfileCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String name,
      String avatarId,
      int level,
      int exp,
      int coins,
      int gems,
      int tokens,
      int tickets,
      int elo,
      int maxDepth,
      List<String> badges,
      DateTime createdAt});
}

/// @nodoc
class _$PlayerProfileCopyWithImpl<$Res>
    implements $PlayerProfileCopyWith<$Res> {
  _$PlayerProfileCopyWithImpl(this._self, this._then);

  final PlayerProfile _self;
  final $Res Function(PlayerProfile) _then;

  /// Create a copy of PlayerProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? avatarId = null,
    Object? level = null,
    Object? exp = null,
    Object? coins = null,
    Object? gems = null,
    Object? tokens = null,
    Object? tickets = null,
    Object? elo = null,
    Object? maxDepth = null,
    Object? badges = null,
    Object? createdAt = null,
  }) {
    return _then(PlayerProfile(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      avatarId: null == avatarId
          ? _self.avatarId
          : avatarId // ignore: cast_nullable_to_non_nullable
              as String,
      level: null == level
          ? _self.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      exp: null == exp
          ? _self.exp
          : exp // ignore: cast_nullable_to_non_nullable
              as int,
      coins: null == coins
          ? _self.coins
          : coins // ignore: cast_nullable_to_non_nullable
              as int,
      gems: null == gems
          ? _self.gems
          : gems // ignore: cast_nullable_to_non_nullable
              as int,
      tokens: null == tokens
          ? _self.tokens
          : tokens // ignore: cast_nullable_to_non_nullable
              as int,
      tickets: null == tickets
          ? _self.tickets
          : tickets // ignore: cast_nullable_to_non_nullable
              as int,
      elo: null == elo
          ? _self.elo
          : elo // ignore: cast_nullable_to_non_nullable
              as int,
      maxDepth: null == maxDepth
          ? _self.maxDepth
          : maxDepth // ignore: cast_nullable_to_non_nullable
              as int,
      badges: null == badges
          ? _self.badges
          : badges // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// Adds pattern-matching-related methods to [PlayerProfile].
extension PlayerProfilePatterns on PlayerProfile {
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
    TResult Function(_PlayerProfile value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PlayerProfile() when $default != null:
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
    TResult Function(_PlayerProfile value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlayerProfile():
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
    TResult? Function(_PlayerProfile value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlayerProfile() when $default != null:
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
            String avatarId,
            int level,
            int exp,
            int coins,
            int gems,
            int tokens,
            int tickets,
            int elo,
            int maxDepth,
            List<String> badges,
            DateTime createdAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PlayerProfile() when $default != null:
        return $default(
            _that.id,
            _that.name,
            _that.avatarId,
            _that.level,
            _that.exp,
            _that.coins,
            _that.gems,
            _that.tokens,
            _that.tickets,
            _that.elo,
            _that.maxDepth,
            _that.badges,
            _that.createdAt);
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
            String avatarId,
            int level,
            int exp,
            int coins,
            int gems,
            int tokens,
            int tickets,
            int elo,
            int maxDepth,
            List<String> badges,
            DateTime createdAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlayerProfile():
        return $default(
            _that.id,
            _that.name,
            _that.avatarId,
            _that.level,
            _that.exp,
            _that.coins,
            _that.gems,
            _that.tokens,
            _that.tickets,
            _that.elo,
            _that.maxDepth,
            _that.badges,
            _that.createdAt);
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
            String avatarId,
            int level,
            int exp,
            int coins,
            int gems,
            int tokens,
            int tickets,
            int elo,
            int maxDepth,
            List<String> badges,
            DateTime createdAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlayerProfile() when $default != null:
        return $default(
            _that.id,
            _that.name,
            _that.avatarId,
            _that.level,
            _that.exp,
            _that.coins,
            _that.gems,
            _that.tokens,
            _that.tickets,
            _that.elo,
            _that.maxDepth,
            _that.badges,
            _that.createdAt);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _PlayerProfile implements PlayerProfile {
  const _PlayerProfile(
      {required this.id,
      required this.name,
      required this.avatarId,
      required this.level,
      required this.exp,
      required this.coins,
      required this.gems,
      required this.tokens,
      required this.tickets,
      required this.elo,
      required this.maxDepth,
      required List<String> badges,
      required this.createdAt})
      : _badges = badges;

  @override
  final String id;
  @override
  final String name;
  @override
  final String avatarId;
  @override
  final int level;
  @override
  final int exp;
  @override
  final int coins;
  @override
  final int gems;
  @override
  final int tokens;
  @override
  final int tickets;
  @override
  final int elo;
  @override
  final int maxDepth;
  final List<String> _badges;
  @override
  List<String> get badges {
    if (_badges is EqualUnmodifiableListView) return _badges;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_badges);
  }

  @override
  final DateTime createdAt;

  /// Create a copy of PlayerProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PlayerProfileCopyWith<_PlayerProfile> get copyWith =>
      __$PlayerProfileCopyWithImpl<_PlayerProfile>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PlayerProfile &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.avatarId, avatarId) ||
                other.avatarId == avatarId) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.exp, exp) || other.exp == exp) &&
            (identical(other.coins, coins) || other.coins == coins) &&
            (identical(other.gems, gems) || other.gems == gems) &&
            (identical(other.tokens, tokens) || other.tokens == tokens) &&
            (identical(other.tickets, tickets) || other.tickets == tickets) &&
            (identical(other.elo, elo) || other.elo == elo) &&
            (identical(other.maxDepth, maxDepth) ||
                other.maxDepth == maxDepth) &&
            const DeepCollectionEquality().equals(other.badges, _badges) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        id,
        name,
        avatarId,
        level,
        exp,
        coins,
        gems,
        tokens,
        tickets,
        elo,
        maxDepth,
        const DeepCollectionEquality().hash(_badges),
        createdAt);
  }

  @override
  String toString() {
    return 'PlayerProfile(id: $id, name: $name, avatarId: $avatarId, level: $level, exp: $exp, coins: $coins, gems: $gems, tokens: $tokens, tickets: $tickets, elo: $elo, maxDepth: $maxDepth, badges: $badges, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class _$PlayerProfileCopyWith<$Res>
    implements $PlayerProfileCopyWith<$Res> {
  factory _$PlayerProfileCopyWith(
          _PlayerProfile value, $Res Function(_PlayerProfile) _then) =
      __$PlayerProfileCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String avatarId,
      int level,
      int exp,
      int coins,
      int gems,
      int tokens,
      int tickets,
      int elo,
      int maxDepth,
      List<String> badges,
      DateTime createdAt});
}

/// @nodoc
class __$PlayerProfileCopyWithImpl<$Res>
    implements _$PlayerProfileCopyWith<$Res> {
  __$PlayerProfileCopyWithImpl(this._self, this._then);

  final _PlayerProfile _self;
  final $Res Function(_PlayerProfile) _then;

  /// Create a copy of PlayerProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? avatarId = null,
    Object? level = null,
    Object? exp = null,
    Object? coins = null,
    Object? gems = null,
    Object? tokens = null,
    Object? tickets = null,
    Object? elo = null,
    Object? maxDepth = null,
    Object? badges = null,
    Object? createdAt = null,
  }) {
    return _then(_PlayerProfile(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      avatarId: null == avatarId
          ? _self.avatarId
          : avatarId // ignore: cast_nullable_to_non_nullable
              as String,
      level: null == level
          ? _self.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      exp: null == exp
          ? _self.exp
          : exp // ignore: cast_nullable_to_non_nullable
              as int,
      coins: null == coins
          ? _self.coins
          : coins // ignore: cast_nullable_to_non_nullable
              as int,
      gems: null == gems
          ? _self.gems
          : gems // ignore: cast_nullable_to_non_nullable
              as int,
      tokens: null == tokens
          ? _self.tokens
          : tokens // ignore: cast_nullable_to_non_nullable
              as int,
      tickets: null == tickets
          ? _self.tickets
          : tickets // ignore: cast_nullable_to_non_nullable
              as int,
      elo: null == elo
          ? _self.elo
          : elo // ignore: cast_nullable_to_non_nullable
              as int,
      maxDepth: null == maxDepth
          ? _self.maxDepth
          : maxDepth // ignore: cast_nullable_to_non_nullable
              as int,
      badges: null == badges
          ? _self._badges
          : badges // ignore: cast_nullable_to_non_nullable
              as List<String>,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
