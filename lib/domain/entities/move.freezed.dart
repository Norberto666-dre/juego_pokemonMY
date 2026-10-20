// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'move.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Move {
  String get id;
  String get name;
  PokeType get type;
  MoveCategory get category;
  int? get power;
  int? get accuracy;
  int get pp;
  int get priority;
  MoveEffect get effect;
  String? get description;

  /// Create a copy of Move
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MoveCopyWith<Move> get copyWith =>
      _$MoveCopyWithImpl<Move>(this as Move, _$identity);

  @override
  bool operator ==(Object other) {
    final _this = this as Move;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Move &&
            (identical(other.id, _this.id) || other.id == _this.id) &&
            (identical(other.name, _this.name) || other.name == _this.name) &&
            (identical(other.type, _this.type) || other.type == _this.type) &&
            (identical(other.category, _this.category) ||
                other.category == _this.category) &&
            (identical(other.power, _this.power) ||
                other.power == _this.power) &&
            (identical(other.accuracy, _this.accuracy) ||
                other.accuracy == _this.accuracy) &&
            (identical(other.pp, _this.pp) || other.pp == _this.pp) &&
            (identical(other.priority, _this.priority) ||
                other.priority == _this.priority) &&
            (identical(other.effect, _this.effect) ||
                other.effect == _this.effect) &&
            (identical(other.description, _this.description) ||
                other.description == _this.description));
  }

  @override
  int get hashCode {
    final _this = this as Move;
    return Object.hash(
        runtimeType,
        _this.id,
        _this.name,
        _this.type,
        _this.category,
        _this.power,
        _this.accuracy,
        _this.pp,
        _this.priority,
        _this.effect,
        _this.description);
  }

  @override
  String toString() {
    final _this = this as Move;
    return 'Move(id: ${_this.id}, name: ${_this.name}, type: ${_this.type}, category: ${_this.category}, power: ${_this.power}, accuracy: ${_this.accuracy}, pp: ${_this.pp}, priority: ${_this.priority}, effect: ${_this.effect}, description: ${_this.description})';
  }
}

/// @nodoc
abstract mixin class $MoveCopyWith<$Res> {
  factory $MoveCopyWith(Move value, $Res Function(Move) _then) =
      _$MoveCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String name,
      PokeType type,
      MoveCategory category,
      int? power,
      int? accuracy,
      int pp,
      int priority,
      MoveEffect effect,
      String? description});

  $MoveEffectCopyWith<$Res> get effect;
}

/// @nodoc
class _$MoveCopyWithImpl<$Res> implements $MoveCopyWith<$Res> {
  _$MoveCopyWithImpl(this._self, this._then);

  final Move _self;
  final $Res Function(Move) _then;

  /// Create a copy of Move
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? category = null,
    Object? power = freezed,
    Object? accuracy = freezed,
    Object? pp = null,
    Object? priority = null,
    Object? effect = null,
    Object? description = freezed,
  }) {
    return _then(Move(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as PokeType,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as MoveCategory,
      power: freezed == power
          ? _self.power
          : power // ignore: cast_nullable_to_non_nullable
              as int?,
      accuracy: freezed == accuracy
          ? _self.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as int?,
      pp: null == pp
          ? _self.pp
          : pp // ignore: cast_nullable_to_non_nullable
              as int,
      priority: null == priority
          ? _self.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int,
      effect: null == effect
          ? _self.effect
          : effect // ignore: cast_nullable_to_non_nullable
              as MoveEffect,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of Move
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MoveEffectCopyWith<$Res> get effect {
    return $MoveEffectCopyWith<$Res>(_self.effect, (value) {
      return _then(_self.copyWith(effect: value));
    });
  }
}

/// Adds pattern-matching-related methods to [Move].
extension MovePatterns on Move {
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
    TResult Function(_Move value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Move() when $default != null:
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
    TResult Function(_Move value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Move():
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
    TResult? Function(_Move value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Move() when $default != null:
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
            PokeType type,
            MoveCategory category,
            int? power,
            int? accuracy,
            int pp,
            int priority,
            MoveEffect effect,
            String? description)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Move() when $default != null:
        return $default(
            _that.id,
            _that.name,
            _that.type,
            _that.category,
            _that.power,
            _that.accuracy,
            _that.pp,
            _that.priority,
            _that.effect,
            _that.description);
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
            PokeType type,
            MoveCategory category,
            int? power,
            int? accuracy,
            int pp,
            int priority,
            MoveEffect effect,
            String? description)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Move():
        return $default(
            _that.id,
            _that.name,
            _that.type,
            _that.category,
            _that.power,
            _that.accuracy,
            _that.pp,
            _that.priority,
            _that.effect,
            _that.description);
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
            PokeType type,
            MoveCategory category,
            int? power,
            int? accuracy,
            int pp,
            int priority,
            MoveEffect effect,
            String? description)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Move() when $default != null:
        return $default(
            _that.id,
            _that.name,
            _that.type,
            _that.category,
            _that.power,
            _that.accuracy,
            _that.pp,
            _that.priority,
            _that.effect,
            _that.description);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Move implements Move {
  const _Move(
      {required this.id,
      required this.name,
      required this.type,
      required this.category,
      this.power,
      this.accuracy,
      required this.pp,
      this.priority = 0,
      required this.effect,
      this.description});

  @override
  final String id;
  @override
  final String name;
  @override
  final PokeType type;
  @override
  final MoveCategory category;
  @override
  final int? power;
  @override
  final int? accuracy;
  @override
  final int pp;
  @override
  @JsonKey()
  final int priority;
  @override
  final MoveEffect effect;
  @override
  final String? description;

  /// Create a copy of Move
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MoveCopyWith<_Move> get copyWith =>
      __$MoveCopyWithImpl<_Move>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Move &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.power, power) || other.power == power) &&
            (identical(other.accuracy, accuracy) ||
                other.accuracy == accuracy) &&
            (identical(other.pp, pp) || other.pp == pp) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.effect, effect) || other.effect == effect) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, name, type, category, power, accuracy,
        pp, priority, effect, description);
  }

  @override
  String toString() {
    return 'Move(id: $id, name: $name, type: $type, category: $category, power: $power, accuracy: $accuracy, pp: $pp, priority: $priority, effect: $effect, description: $description)';
  }
}

/// @nodoc
abstract mixin class _$MoveCopyWith<$Res> implements $MoveCopyWith<$Res> {
  factory _$MoveCopyWith(_Move value, $Res Function(_Move) _then) =
      __$MoveCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      PokeType type,
      MoveCategory category,
      int? power,
      int? accuracy,
      int pp,
      int priority,
      MoveEffect effect,
      String? description});

  @override
  $MoveEffectCopyWith<$Res> get effect;
}

/// @nodoc
class __$MoveCopyWithImpl<$Res> implements _$MoveCopyWith<$Res> {
  __$MoveCopyWithImpl(this._self, this._then);

  final _Move _self;
  final $Res Function(_Move) _then;

  /// Create a copy of Move
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
    Object? category = null,
    Object? power = freezed,
    Object? accuracy = freezed,
    Object? pp = null,
    Object? priority = null,
    Object? effect = null,
    Object? description = freezed,
  }) {
    return _then(_Move(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as PokeType,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as MoveCategory,
      power: freezed == power
          ? _self.power
          : power // ignore: cast_nullable_to_non_nullable
              as int?,
      accuracy: freezed == accuracy
          ? _self.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as int?,
      pp: null == pp
          ? _self.pp
          : pp // ignore: cast_nullable_to_non_nullable
              as int,
      priority: null == priority
          ? _self.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int,
      effect: null == effect
          ? _self.effect
          : effect // ignore: cast_nullable_to_non_nullable
              as MoveEffect,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of Move
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MoveEffectCopyWith<$Res> get effect {
    return $MoveEffectCopyWith<$Res>(_self.effect, (value) {
      return _then(_self.copyWith(effect: value));
    });
  }
}

/// @nodoc
mixin _$MoveEffect {
  StatusCondition? get inflictStatus;
  int get statusChance;
  Map<String, int> get statStages;
  bool get targetsSelf;
  int get healPercent;
  int get recoilPercent;
  double get critRatioBonus;

  /// Create a copy of MoveEffect
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MoveEffectCopyWith<MoveEffect> get copyWith =>
      _$MoveEffectCopyWithImpl<MoveEffect>(this as MoveEffect, _$identity);

  @override
  bool operator ==(Object other) {
    final _this = this as MoveEffect;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MoveEffect &&
            (identical(other.inflictStatus, _this.inflictStatus) ||
                other.inflictStatus == _this.inflictStatus) &&
            (identical(other.statusChance, _this.statusChance) ||
                other.statusChance == _this.statusChance) &&
            const DeepCollectionEquality()
                .equals(other.statStages, _this.statStages) &&
            (identical(other.targetsSelf, _this.targetsSelf) ||
                other.targetsSelf == _this.targetsSelf) &&
            (identical(other.healPercent, _this.healPercent) ||
                other.healPercent == _this.healPercent) &&
            (identical(other.recoilPercent, _this.recoilPercent) ||
                other.recoilPercent == _this.recoilPercent) &&
            (identical(other.critRatioBonus, _this.critRatioBonus) ||
                other.critRatioBonus == _this.critRatioBonus));
  }

  @override
  int get hashCode {
    final _this = this as MoveEffect;
    return Object.hash(
        runtimeType,
        _this.inflictStatus,
        _this.statusChance,
        const DeepCollectionEquality().hash(_this.statStages),
        _this.targetsSelf,
        _this.healPercent,
        _this.recoilPercent,
        _this.critRatioBonus);
  }

  @override
  String toString() {
    final _this = this as MoveEffect;
    return 'MoveEffect(inflictStatus: ${_this.inflictStatus}, statusChance: ${_this.statusChance}, statStages: ${_this.statStages}, targetsSelf: ${_this.targetsSelf}, healPercent: ${_this.healPercent}, recoilPercent: ${_this.recoilPercent}, critRatioBonus: ${_this.critRatioBonus})';
  }
}

/// @nodoc
abstract mixin class $MoveEffectCopyWith<$Res> {
  factory $MoveEffectCopyWith(
          MoveEffect value, $Res Function(MoveEffect) _then) =
      _$MoveEffectCopyWithImpl;
  @useResult
  $Res call(
      {StatusCondition? inflictStatus,
      int statusChance,
      Map<String, int> statStages,
      bool targetsSelf,
      int healPercent,
      int recoilPercent,
      double critRatioBonus});
}

/// @nodoc
class _$MoveEffectCopyWithImpl<$Res> implements $MoveEffectCopyWith<$Res> {
  _$MoveEffectCopyWithImpl(this._self, this._then);

  final MoveEffect _self;
  final $Res Function(MoveEffect) _then;

  /// Create a copy of MoveEffect
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? inflictStatus = freezed,
    Object? statusChance = null,
    Object? statStages = null,
    Object? targetsSelf = null,
    Object? healPercent = null,
    Object? recoilPercent = null,
    Object? critRatioBonus = null,
  }) {
    return _then(MoveEffect(
      inflictStatus: freezed == inflictStatus
          ? _self.inflictStatus
          : inflictStatus // ignore: cast_nullable_to_non_nullable
              as StatusCondition?,
      statusChance: null == statusChance
          ? _self.statusChance
          : statusChance // ignore: cast_nullable_to_non_nullable
              as int,
      statStages: null == statStages
          ? _self.statStages
          : statStages // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      targetsSelf: null == targetsSelf
          ? _self.targetsSelf
          : targetsSelf // ignore: cast_nullable_to_non_nullable
              as bool,
      healPercent: null == healPercent
          ? _self.healPercent
          : healPercent // ignore: cast_nullable_to_non_nullable
              as int,
      recoilPercent: null == recoilPercent
          ? _self.recoilPercent
          : recoilPercent // ignore: cast_nullable_to_non_nullable
              as int,
      critRatioBonus: null == critRatioBonus
          ? _self.critRatioBonus
          : critRatioBonus // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// Adds pattern-matching-related methods to [MoveEffect].
extension MoveEffectPatterns on MoveEffect {
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
    TResult Function(_MoveEffect value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MoveEffect() when $default != null:
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
    TResult Function(_MoveEffect value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MoveEffect():
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
    TResult? Function(_MoveEffect value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MoveEffect() when $default != null:
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
            StatusCondition? inflictStatus,
            int statusChance,
            Map<String, int> statStages,
            bool targetsSelf,
            int healPercent,
            int recoilPercent,
            double critRatioBonus)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MoveEffect() when $default != null:
        return $default(
            _that.inflictStatus,
            _that.statusChance,
            _that.statStages,
            _that.targetsSelf,
            _that.healPercent,
            _that.recoilPercent,
            _that.critRatioBonus);
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
            StatusCondition? inflictStatus,
            int statusChance,
            Map<String, int> statStages,
            bool targetsSelf,
            int healPercent,
            int recoilPercent,
            double critRatioBonus)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MoveEffect():
        return $default(
            _that.inflictStatus,
            _that.statusChance,
            _that.statStages,
            _that.targetsSelf,
            _that.healPercent,
            _that.recoilPercent,
            _that.critRatioBonus);
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
            StatusCondition? inflictStatus,
            int statusChance,
            Map<String, int> statStages,
            bool targetsSelf,
            int healPercent,
            int recoilPercent,
            double critRatioBonus)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MoveEffect() when $default != null:
        return $default(
            _that.inflictStatus,
            _that.statusChance,
            _that.statStages,
            _that.targetsSelf,
            _that.healPercent,
            _that.recoilPercent,
            _that.critRatioBonus);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _MoveEffect implements MoveEffect {
  const _MoveEffect(
      {this.inflictStatus,
      this.statusChance = 0,
      Map<String, int> statStages = const <String, int>{},
      this.targetsSelf = false,
      this.healPercent = 0,
      this.recoilPercent = 0,
      this.critRatioBonus = 1.0})
      : _statStages = statStages;

  @override
  final StatusCondition? inflictStatus;
  @override
  @JsonKey()
  final int statusChance;
  final Map<String, int> _statStages;
  @override
  @JsonKey()
  Map<String, int> get statStages {
    if (_statStages is EqualUnmodifiableMapView) return _statStages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_statStages);
  }

  @override
  @JsonKey()
  final bool targetsSelf;
  @override
  @JsonKey()
  final int healPercent;
  @override
  @JsonKey()
  final int recoilPercent;
  @override
  @JsonKey()
  final double critRatioBonus;

  /// Create a copy of MoveEffect
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MoveEffectCopyWith<_MoveEffect> get copyWith =>
      __$MoveEffectCopyWithImpl<_MoveEffect>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MoveEffect &&
            (identical(other.inflictStatus, inflictStatus) ||
                other.inflictStatus == inflictStatus) &&
            (identical(other.statusChance, statusChance) ||
                other.statusChance == statusChance) &&
            const DeepCollectionEquality()
                .equals(other.statStages, _statStages) &&
            (identical(other.targetsSelf, targetsSelf) ||
                other.targetsSelf == targetsSelf) &&
            (identical(other.healPercent, healPercent) ||
                other.healPercent == healPercent) &&
            (identical(other.recoilPercent, recoilPercent) ||
                other.recoilPercent == recoilPercent) &&
            (identical(other.critRatioBonus, critRatioBonus) ||
                other.critRatioBonus == critRatioBonus));
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        inflictStatus,
        statusChance,
        const DeepCollectionEquality().hash(_statStages),
        targetsSelf,
        healPercent,
        recoilPercent,
        critRatioBonus);
  }

  @override
  String toString() {
    return 'MoveEffect(inflictStatus: $inflictStatus, statusChance: $statusChance, statStages: $statStages, targetsSelf: $targetsSelf, healPercent: $healPercent, recoilPercent: $recoilPercent, critRatioBonus: $critRatioBonus)';
  }
}

/// @nodoc
abstract mixin class _$MoveEffectCopyWith<$Res>
    implements $MoveEffectCopyWith<$Res> {
  factory _$MoveEffectCopyWith(
          _MoveEffect value, $Res Function(_MoveEffect) _then) =
      __$MoveEffectCopyWithImpl;
  @override
  @useResult
  $Res call(
      {StatusCondition? inflictStatus,
      int statusChance,
      Map<String, int> statStages,
      bool targetsSelf,
      int healPercent,
      int recoilPercent,
      double critRatioBonus});
}

/// @nodoc
class __$MoveEffectCopyWithImpl<$Res> implements _$MoveEffectCopyWith<$Res> {
  __$MoveEffectCopyWithImpl(this._self, this._then);

  final _MoveEffect _self;
  final $Res Function(_MoveEffect) _then;

  /// Create a copy of MoveEffect
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? inflictStatus = freezed,
    Object? statusChance = null,
    Object? statStages = null,
    Object? targetsSelf = null,
    Object? healPercent = null,
    Object? recoilPercent = null,
    Object? critRatioBonus = null,
  }) {
    return _then(_MoveEffect(
      inflictStatus: freezed == inflictStatus
          ? _self.inflictStatus
          : inflictStatus // ignore: cast_nullable_to_non_nullable
              as StatusCondition?,
      statusChance: null == statusChance
          ? _self.statusChance
          : statusChance // ignore: cast_nullable_to_non_nullable
              as int,
      statStages: null == statStages
          ? _self._statStages
          : statStages // ignore: cast_nullable_to_non_nullable
              as Map<String, int>,
      targetsSelf: null == targetsSelf
          ? _self.targetsSelf
          : targetsSelf // ignore: cast_nullable_to_non_nullable
              as bool,
      healPercent: null == healPercent
          ? _self.healPercent
          : healPercent // ignore: cast_nullable_to_non_nullable
              as int,
      recoilPercent: null == recoilPercent
          ? _self.recoilPercent
          : recoilPercent // ignore: cast_nullable_to_non_nullable
              as int,
      critRatioBonus: null == critRatioBonus
          ? _self.critRatioBonus
          : critRatioBonus // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

// dart format on
