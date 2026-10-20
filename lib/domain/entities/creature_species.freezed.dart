// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'creature_species.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreatureSpecies {
  int get id;
  String get name;
  List<PokeType> get types;
  Stats get baseStats;
  List<String> get abilityIds;
  String? get hiddenAbilityId;
  int get evolutionChainId;
  Rarity get rarity;
  int get captureRate;
  int get generation;
  String get region;
  String get spriteUrl;
  String? get spriteAnimatedUrl;
  bool get isLegendary;
  bool get isMythical;
  int get baseFriendship;
  GrowthRate get growthRate;
  int get baseExp;

  /// Create a copy of CreatureSpecies
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CreatureSpeciesCopyWith<CreatureSpecies> get copyWith =>
      _$CreatureSpeciesCopyWithImpl<CreatureSpecies>(
          this as CreatureSpecies, _$identity);

  @override
  bool operator ==(Object other) {
    final _this = this as CreatureSpecies;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CreatureSpecies &&
            (identical(other.id, _this.id) || other.id == _this.id) &&
            (identical(other.name, _this.name) || other.name == _this.name) &&
            const DeepCollectionEquality().equals(other.types, _this.types) &&
            (identical(other.baseStats, _this.baseStats) ||
                other.baseStats == _this.baseStats) &&
            const DeepCollectionEquality()
                .equals(other.abilityIds, _this.abilityIds) &&
            (identical(other.hiddenAbilityId, _this.hiddenAbilityId) ||
                other.hiddenAbilityId == _this.hiddenAbilityId) &&
            (identical(other.evolutionChainId, _this.evolutionChainId) ||
                other.evolutionChainId == _this.evolutionChainId) &&
            (identical(other.rarity, _this.rarity) ||
                other.rarity == _this.rarity) &&
            (identical(other.captureRate, _this.captureRate) ||
                other.captureRate == _this.captureRate) &&
            (identical(other.generation, _this.generation) ||
                other.generation == _this.generation) &&
            (identical(other.region, _this.region) ||
                other.region == _this.region) &&
            (identical(other.spriteUrl, _this.spriteUrl) ||
                other.spriteUrl == _this.spriteUrl) &&
            (identical(other.spriteAnimatedUrl, _this.spriteAnimatedUrl) ||
                other.spriteAnimatedUrl == _this.spriteAnimatedUrl) &&
            (identical(other.isLegendary, _this.isLegendary) ||
                other.isLegendary == _this.isLegendary) &&
            (identical(other.isMythical, _this.isMythical) ||
                other.isMythical == _this.isMythical) &&
            (identical(other.baseFriendship, _this.baseFriendship) ||
                other.baseFriendship == _this.baseFriendship) &&
            (identical(other.growthRate, _this.growthRate) ||
                other.growthRate == _this.growthRate) &&
            (identical(other.baseExp, _this.baseExp) ||
                other.baseExp == _this.baseExp));
  }

  @override
  int get hashCode {
    final _this = this as CreatureSpecies;
    return Object.hash(
        runtimeType,
        _this.id,
        _this.name,
        const DeepCollectionEquality().hash(_this.types),
        _this.baseStats,
        const DeepCollectionEquality().hash(_this.abilityIds),
        _this.hiddenAbilityId,
        _this.evolutionChainId,
        _this.rarity,
        _this.captureRate,
        _this.generation,
        _this.region,
        _this.spriteUrl,
        _this.spriteAnimatedUrl,
        _this.isLegendary,
        _this.isMythical,
        _this.baseFriendship,
        _this.growthRate,
        _this.baseExp);
  }

  @override
  String toString() {
    final _this = this as CreatureSpecies;
    return 'CreatureSpecies(id: ${_this.id}, name: ${_this.name}, types: ${_this.types}, baseStats: ${_this.baseStats}, abilityIds: ${_this.abilityIds}, hiddenAbilityId: ${_this.hiddenAbilityId}, evolutionChainId: ${_this.evolutionChainId}, rarity: ${_this.rarity}, captureRate: ${_this.captureRate}, generation: ${_this.generation}, region: ${_this.region}, spriteUrl: ${_this.spriteUrl}, spriteAnimatedUrl: ${_this.spriteAnimatedUrl}, isLegendary: ${_this.isLegendary}, isMythical: ${_this.isMythical}, baseFriendship: ${_this.baseFriendship}, growthRate: ${_this.growthRate}, baseExp: ${_this.baseExp})';
  }
}

/// @nodoc
abstract mixin class $CreatureSpeciesCopyWith<$Res> {
  factory $CreatureSpeciesCopyWith(
          CreatureSpecies value, $Res Function(CreatureSpecies) _then) =
      _$CreatureSpeciesCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String name,
      List<PokeType> types,
      Stats baseStats,
      List<String> abilityIds,
      String? hiddenAbilityId,
      int evolutionChainId,
      Rarity rarity,
      int captureRate,
      int generation,
      String region,
      String spriteUrl,
      String? spriteAnimatedUrl,
      bool isLegendary,
      bool isMythical,
      int baseFriendship,
      GrowthRate growthRate,
      int baseExp});

  $StatsCopyWith<$Res> get baseStats;
}

/// @nodoc
class _$CreatureSpeciesCopyWithImpl<$Res>
    implements $CreatureSpeciesCopyWith<$Res> {
  _$CreatureSpeciesCopyWithImpl(this._self, this._then);

  final CreatureSpecies _self;
  final $Res Function(CreatureSpecies) _then;

  /// Create a copy of CreatureSpecies
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? types = null,
    Object? baseStats = null,
    Object? abilityIds = null,
    Object? hiddenAbilityId = freezed,
    Object? evolutionChainId = null,
    Object? rarity = null,
    Object? captureRate = null,
    Object? generation = null,
    Object? region = null,
    Object? spriteUrl = null,
    Object? spriteAnimatedUrl = freezed,
    Object? isLegendary = null,
    Object? isMythical = null,
    Object? baseFriendship = null,
    Object? growthRate = null,
    Object? baseExp = null,
  }) {
    return _then(CreatureSpecies(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      types: null == types
          ? _self.types
          : types // ignore: cast_nullable_to_non_nullable
              as List<PokeType>,
      baseStats: null == baseStats
          ? _self.baseStats
          : baseStats // ignore: cast_nullable_to_non_nullable
              as Stats,
      abilityIds: null == abilityIds
          ? _self.abilityIds
          : abilityIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      hiddenAbilityId: freezed == hiddenAbilityId
          ? _self.hiddenAbilityId
          : hiddenAbilityId // ignore: cast_nullable_to_non_nullable
              as String?,
      evolutionChainId: null == evolutionChainId
          ? _self.evolutionChainId
          : evolutionChainId // ignore: cast_nullable_to_non_nullable
              as int,
      rarity: null == rarity
          ? _self.rarity
          : rarity // ignore: cast_nullable_to_non_nullable
              as Rarity,
      captureRate: null == captureRate
          ? _self.captureRate
          : captureRate // ignore: cast_nullable_to_non_nullable
              as int,
      generation: null == generation
          ? _self.generation
          : generation // ignore: cast_nullable_to_non_nullable
              as int,
      region: null == region
          ? _self.region
          : region // ignore: cast_nullable_to_non_nullable
              as String,
      spriteUrl: null == spriteUrl
          ? _self.spriteUrl
          : spriteUrl // ignore: cast_nullable_to_non_nullable
              as String,
      spriteAnimatedUrl: freezed == spriteAnimatedUrl
          ? _self.spriteAnimatedUrl
          : spriteAnimatedUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isLegendary: null == isLegendary
          ? _self.isLegendary
          : isLegendary // ignore: cast_nullable_to_non_nullable
              as bool,
      isMythical: null == isMythical
          ? _self.isMythical
          : isMythical // ignore: cast_nullable_to_non_nullable
              as bool,
      baseFriendship: null == baseFriendship
          ? _self.baseFriendship
          : baseFriendship // ignore: cast_nullable_to_non_nullable
              as int,
      growthRate: null == growthRate
          ? _self.growthRate
          : growthRate // ignore: cast_nullable_to_non_nullable
              as GrowthRate,
      baseExp: null == baseExp
          ? _self.baseExp
          : baseExp // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  /// Create a copy of CreatureSpecies
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StatsCopyWith<$Res> get baseStats {
    return $StatsCopyWith<$Res>(_self.baseStats, (value) {
      return _then(_self.copyWith(baseStats: value));
    });
  }
}

/// Adds pattern-matching-related methods to [CreatureSpecies].
extension CreatureSpeciesPatterns on CreatureSpecies {
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
    TResult Function(_CreatureSpecies value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CreatureSpecies() when $default != null:
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
    TResult Function(_CreatureSpecies value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreatureSpecies():
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
    TResult? Function(_CreatureSpecies value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreatureSpecies() when $default != null:
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
            int id,
            String name,
            List<PokeType> types,
            Stats baseStats,
            List<String> abilityIds,
            String? hiddenAbilityId,
            int evolutionChainId,
            Rarity rarity,
            int captureRate,
            int generation,
            String region,
            String spriteUrl,
            String? spriteAnimatedUrl,
            bool isLegendary,
            bool isMythical,
            int baseFriendship,
            GrowthRate growthRate,
            int baseExp)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CreatureSpecies() when $default != null:
        return $default(
            _that.id,
            _that.name,
            _that.types,
            _that.baseStats,
            _that.abilityIds,
            _that.hiddenAbilityId,
            _that.evolutionChainId,
            _that.rarity,
            _that.captureRate,
            _that.generation,
            _that.region,
            _that.spriteUrl,
            _that.spriteAnimatedUrl,
            _that.isLegendary,
            _that.isMythical,
            _that.baseFriendship,
            _that.growthRate,
            _that.baseExp);
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
            int id,
            String name,
            List<PokeType> types,
            Stats baseStats,
            List<String> abilityIds,
            String? hiddenAbilityId,
            int evolutionChainId,
            Rarity rarity,
            int captureRate,
            int generation,
            String region,
            String spriteUrl,
            String? spriteAnimatedUrl,
            bool isLegendary,
            bool isMythical,
            int baseFriendship,
            GrowthRate growthRate,
            int baseExp)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreatureSpecies():
        return $default(
            _that.id,
            _that.name,
            _that.types,
            _that.baseStats,
            _that.abilityIds,
            _that.hiddenAbilityId,
            _that.evolutionChainId,
            _that.rarity,
            _that.captureRate,
            _that.generation,
            _that.region,
            _that.spriteUrl,
            _that.spriteAnimatedUrl,
            _that.isLegendary,
            _that.isMythical,
            _that.baseFriendship,
            _that.growthRate,
            _that.baseExp);
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
            int id,
            String name,
            List<PokeType> types,
            Stats baseStats,
            List<String> abilityIds,
            String? hiddenAbilityId,
            int evolutionChainId,
            Rarity rarity,
            int captureRate,
            int generation,
            String region,
            String spriteUrl,
            String? spriteAnimatedUrl,
            bool isLegendary,
            bool isMythical,
            int baseFriendship,
            GrowthRate growthRate,
            int baseExp)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreatureSpecies() when $default != null:
        return $default(
            _that.id,
            _that.name,
            _that.types,
            _that.baseStats,
            _that.abilityIds,
            _that.hiddenAbilityId,
            _that.evolutionChainId,
            _that.rarity,
            _that.captureRate,
            _that.generation,
            _that.region,
            _that.spriteUrl,
            _that.spriteAnimatedUrl,
            _that.isLegendary,
            _that.isMythical,
            _that.baseFriendship,
            _that.growthRate,
            _that.baseExp);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _CreatureSpecies implements CreatureSpecies {
  const _CreatureSpecies(
      {required this.id,
      required this.name,
      required List<PokeType> types,
      required this.baseStats,
      required List<String> abilityIds,
      this.hiddenAbilityId,
      required this.evolutionChainId,
      required this.rarity,
      required this.captureRate,
      required this.generation,
      required this.region,
      required this.spriteUrl,
      this.spriteAnimatedUrl,
      this.isLegendary = false,
      this.isMythical = false,
      this.baseFriendship = 70,
      this.growthRate = GrowthRate.mediumFast,
      this.baseExp = 60})
      : _types = types,
        _abilityIds = abilityIds;

  @override
  final int id;
  @override
  final String name;
  final List<PokeType> _types;
  @override
  List<PokeType> get types {
    if (_types is EqualUnmodifiableListView) return _types;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_types);
  }

  @override
  final Stats baseStats;
  final List<String> _abilityIds;
  @override
  List<String> get abilityIds {
    if (_abilityIds is EqualUnmodifiableListView) return _abilityIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_abilityIds);
  }

  @override
  final String? hiddenAbilityId;
  @override
  final int evolutionChainId;
  @override
  final Rarity rarity;
  @override
  final int captureRate;
  @override
  final int generation;
  @override
  final String region;
  @override
  final String spriteUrl;
  @override
  final String? spriteAnimatedUrl;
  @override
  @JsonKey()
  final bool isLegendary;
  @override
  @JsonKey()
  final bool isMythical;
  @override
  @JsonKey()
  final int baseFriendship;
  @override
  @JsonKey()
  final GrowthRate growthRate;
  @override
  @JsonKey()
  final int baseExp;

  /// Create a copy of CreatureSpecies
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CreatureSpeciesCopyWith<_CreatureSpecies> get copyWith =>
      __$CreatureSpeciesCopyWithImpl<_CreatureSpecies>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CreatureSpecies &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other.types, _types) &&
            (identical(other.baseStats, baseStats) ||
                other.baseStats == baseStats) &&
            const DeepCollectionEquality()
                .equals(other.abilityIds, _abilityIds) &&
            (identical(other.hiddenAbilityId, hiddenAbilityId) ||
                other.hiddenAbilityId == hiddenAbilityId) &&
            (identical(other.evolutionChainId, evolutionChainId) ||
                other.evolutionChainId == evolutionChainId) &&
            (identical(other.rarity, rarity) || other.rarity == rarity) &&
            (identical(other.captureRate, captureRate) ||
                other.captureRate == captureRate) &&
            (identical(other.generation, generation) ||
                other.generation == generation) &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.spriteUrl, spriteUrl) ||
                other.spriteUrl == spriteUrl) &&
            (identical(other.spriteAnimatedUrl, spriteAnimatedUrl) ||
                other.spriteAnimatedUrl == spriteAnimatedUrl) &&
            (identical(other.isLegendary, isLegendary) ||
                other.isLegendary == isLegendary) &&
            (identical(other.isMythical, isMythical) ||
                other.isMythical == isMythical) &&
            (identical(other.baseFriendship, baseFriendship) ||
                other.baseFriendship == baseFriendship) &&
            (identical(other.growthRate, growthRate) ||
                other.growthRate == growthRate) &&
            (identical(other.baseExp, baseExp) || other.baseExp == baseExp));
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        id,
        name,
        const DeepCollectionEquality().hash(_types),
        baseStats,
        const DeepCollectionEquality().hash(_abilityIds),
        hiddenAbilityId,
        evolutionChainId,
        rarity,
        captureRate,
        generation,
        region,
        spriteUrl,
        spriteAnimatedUrl,
        isLegendary,
        isMythical,
        baseFriendship,
        growthRate,
        baseExp);
  }

  @override
  String toString() {
    return 'CreatureSpecies(id: $id, name: $name, types: $types, baseStats: $baseStats, abilityIds: $abilityIds, hiddenAbilityId: $hiddenAbilityId, evolutionChainId: $evolutionChainId, rarity: $rarity, captureRate: $captureRate, generation: $generation, region: $region, spriteUrl: $spriteUrl, spriteAnimatedUrl: $spriteAnimatedUrl, isLegendary: $isLegendary, isMythical: $isMythical, baseFriendship: $baseFriendship, growthRate: $growthRate, baseExp: $baseExp)';
  }
}

/// @nodoc
abstract mixin class _$CreatureSpeciesCopyWith<$Res>
    implements $CreatureSpeciesCopyWith<$Res> {
  factory _$CreatureSpeciesCopyWith(
          _CreatureSpecies value, $Res Function(_CreatureSpecies) _then) =
      __$CreatureSpeciesCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      List<PokeType> types,
      Stats baseStats,
      List<String> abilityIds,
      String? hiddenAbilityId,
      int evolutionChainId,
      Rarity rarity,
      int captureRate,
      int generation,
      String region,
      String spriteUrl,
      String? spriteAnimatedUrl,
      bool isLegendary,
      bool isMythical,
      int baseFriendship,
      GrowthRate growthRate,
      int baseExp});

  @override
  $StatsCopyWith<$Res> get baseStats;
}

/// @nodoc
class __$CreatureSpeciesCopyWithImpl<$Res>
    implements _$CreatureSpeciesCopyWith<$Res> {
  __$CreatureSpeciesCopyWithImpl(this._self, this._then);

  final _CreatureSpecies _self;
  final $Res Function(_CreatureSpecies) _then;

  /// Create a copy of CreatureSpecies
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? types = null,
    Object? baseStats = null,
    Object? abilityIds = null,
    Object? hiddenAbilityId = freezed,
    Object? evolutionChainId = null,
    Object? rarity = null,
    Object? captureRate = null,
    Object? generation = null,
    Object? region = null,
    Object? spriteUrl = null,
    Object? spriteAnimatedUrl = freezed,
    Object? isLegendary = null,
    Object? isMythical = null,
    Object? baseFriendship = null,
    Object? growthRate = null,
    Object? baseExp = null,
  }) {
    return _then(_CreatureSpecies(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      types: null == types
          ? _self._types
          : types // ignore: cast_nullable_to_non_nullable
              as List<PokeType>,
      baseStats: null == baseStats
          ? _self.baseStats
          : baseStats // ignore: cast_nullable_to_non_nullable
              as Stats,
      abilityIds: null == abilityIds
          ? _self._abilityIds
          : abilityIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      hiddenAbilityId: freezed == hiddenAbilityId
          ? _self.hiddenAbilityId
          : hiddenAbilityId // ignore: cast_nullable_to_non_nullable
              as String?,
      evolutionChainId: null == evolutionChainId
          ? _self.evolutionChainId
          : evolutionChainId // ignore: cast_nullable_to_non_nullable
              as int,
      rarity: null == rarity
          ? _self.rarity
          : rarity // ignore: cast_nullable_to_non_nullable
              as Rarity,
      captureRate: null == captureRate
          ? _self.captureRate
          : captureRate // ignore: cast_nullable_to_non_nullable
              as int,
      generation: null == generation
          ? _self.generation
          : generation // ignore: cast_nullable_to_non_nullable
              as int,
      region: null == region
          ? _self.region
          : region // ignore: cast_nullable_to_non_nullable
              as String,
      spriteUrl: null == spriteUrl
          ? _self.spriteUrl
          : spriteUrl // ignore: cast_nullable_to_non_nullable
              as String,
      spriteAnimatedUrl: freezed == spriteAnimatedUrl
          ? _self.spriteAnimatedUrl
          : spriteAnimatedUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isLegendary: null == isLegendary
          ? _self.isLegendary
          : isLegendary // ignore: cast_nullable_to_non_nullable
              as bool,
      isMythical: null == isMythical
          ? _self.isMythical
          : isMythical // ignore: cast_nullable_to_non_nullable
              as bool,
      baseFriendship: null == baseFriendship
          ? _self.baseFriendship
          : baseFriendship // ignore: cast_nullable_to_non_nullable
              as int,
      growthRate: null == growthRate
          ? _self.growthRate
          : growthRate // ignore: cast_nullable_to_non_nullable
              as GrowthRate,
      baseExp: null == baseExp
          ? _self.baseExp
          : baseExp // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  /// Create a copy of CreatureSpecies
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StatsCopyWith<$Res> get baseStats {
    return $StatsCopyWith<$Res>(_self.baseStats, (value) {
      return _then(_self.copyWith(baseStats: value));
    });
  }
}

// dart format on
