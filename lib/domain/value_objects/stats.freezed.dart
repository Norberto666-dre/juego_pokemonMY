// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Stats {
  int get hp;
  int get atk;
  int get def;
  int get spa;
  int get spd;
  int get spe;

  /// Create a copy of Stats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $StatsCopyWith<Stats> get copyWith =>
      _$StatsCopyWithImpl<Stats>(this as Stats, _$identity);

  @override
  bool operator ==(Object other) {
    final _this = this as Stats;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Stats &&
            (identical(other.hp, _this.hp) || other.hp == _this.hp) &&
            (identical(other.atk, _this.atk) || other.atk == _this.atk) &&
            (identical(other.def, _this.def) || other.def == _this.def) &&
            (identical(other.spa, _this.spa) || other.spa == _this.spa) &&
            (identical(other.spd, _this.spd) || other.spd == _this.spd) &&
            (identical(other.spe, _this.spe) || other.spe == _this.spe));
  }

  @override
  int get hashCode {
    final _this = this as Stats;
    return Object.hash(runtimeType, _this.hp, _this.atk, _this.def, _this.spa,
        _this.spd, _this.spe);
  }

  @override
  String toString() {
    final _this = this as Stats;
    return 'Stats(hp: ${_this.hp}, atk: ${_this.atk}, def: ${_this.def}, spa: ${_this.spa}, spd: ${_this.spd}, spe: ${_this.spe})';
  }
}

/// @nodoc
abstract mixin class $StatsCopyWith<$Res> {
  factory $StatsCopyWith(Stats value, $Res Function(Stats) _then) =
      _$StatsCopyWithImpl;
  @useResult
  $Res call({int hp, int atk, int def, int spa, int spd, int spe});
}

/// @nodoc
class _$StatsCopyWithImpl<$Res> implements $StatsCopyWith<$Res> {
  _$StatsCopyWithImpl(this._self, this._then);

  final Stats _self;
  final $Res Function(Stats) _then;

  /// Create a copy of Stats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hp = null,
    Object? atk = null,
    Object? def = null,
    Object? spa = null,
    Object? spd = null,
    Object? spe = null,
  }) {
    return _then(Stats(
      hp: null == hp
          ? _self.hp
          : hp // ignore: cast_nullable_to_non_nullable
              as int,
      atk: null == atk
          ? _self.atk
          : atk // ignore: cast_nullable_to_non_nullable
              as int,
      def: null == def
          ? _self.def
          : def // ignore: cast_nullable_to_non_nullable
              as int,
      spa: null == spa
          ? _self.spa
          : spa // ignore: cast_nullable_to_non_nullable
              as int,
      spd: null == spd
          ? _self.spd
          : spd // ignore: cast_nullable_to_non_nullable
              as int,
      spe: null == spe
          ? _self.spe
          : spe // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [Stats].
extension StatsPatterns on Stats {
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
    TResult Function(_Stats value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Stats() when $default != null:
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
    TResult Function(_Stats value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Stats():
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
    TResult? Function(_Stats value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Stats() when $default != null:
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
    TResult Function(int hp, int atk, int def, int spa, int spd, int spe)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Stats() when $default != null:
        return $default(
            _that.hp, _that.atk, _that.def, _that.spa, _that.spd, _that.spe);
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
    TResult Function(int hp, int atk, int def, int spa, int spd, int spe)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Stats():
        return $default(
            _that.hp, _that.atk, _that.def, _that.spa, _that.spd, _that.spe);
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
    TResult? Function(int hp, int atk, int def, int spa, int spd, int spe)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Stats() when $default != null:
        return $default(
            _that.hp, _that.atk, _that.def, _that.spa, _that.spd, _that.spe);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Stats implements Stats {
  const _Stats(
      {required this.hp,
      required this.atk,
      required this.def,
      required this.spa,
      required this.spd,
      required this.spe});

  @override
  final int hp;
  @override
  final int atk;
  @override
  final int def;
  @override
  final int spa;
  @override
  final int spd;
  @override
  final int spe;

  /// Create a copy of Stats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$StatsCopyWith<_Stats> get copyWith =>
      __$StatsCopyWithImpl<_Stats>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Stats &&
            (identical(other.hp, hp) || other.hp == hp) &&
            (identical(other.atk, atk) || other.atk == atk) &&
            (identical(other.def, def) || other.def == def) &&
            (identical(other.spa, spa) || other.spa == spa) &&
            (identical(other.spd, spd) || other.spd == spd) &&
            (identical(other.spe, spe) || other.spe == spe));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, hp, atk, def, spa, spd, spe);
  }

  @override
  String toString() {
    return 'Stats(hp: $hp, atk: $atk, def: $def, spa: $spa, spd: $spd, spe: $spe)';
  }
}

/// @nodoc
abstract mixin class _$StatsCopyWith<$Res> implements $StatsCopyWith<$Res> {
  factory _$StatsCopyWith(_Stats value, $Res Function(_Stats) _then) =
      __$StatsCopyWithImpl;
  @override
  @useResult
  $Res call({int hp, int atk, int def, int spa, int spd, int spe});
}

/// @nodoc
class __$StatsCopyWithImpl<$Res> implements _$StatsCopyWith<$Res> {
  __$StatsCopyWithImpl(this._self, this._then);

  final _Stats _self;
  final $Res Function(_Stats) _then;

  /// Create a copy of Stats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? hp = null,
    Object? atk = null,
    Object? def = null,
    Object? spa = null,
    Object? spd = null,
    Object? spe = null,
  }) {
    return _then(_Stats(
      hp: null == hp
          ? _self.hp
          : hp // ignore: cast_nullable_to_non_nullable
              as int,
      atk: null == atk
          ? _self.atk
          : atk // ignore: cast_nullable_to_non_nullable
              as int,
      def: null == def
          ? _self.def
          : def // ignore: cast_nullable_to_non_nullable
              as int,
      spa: null == spa
          ? _self.spa
          : spa // ignore: cast_nullable_to_non_nullable
              as int,
      spd: null == spd
          ? _self.spd
          : spd // ignore: cast_nullable_to_non_nullable
              as int,
      spe: null == spe
          ? _self.spe
          : spe // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
