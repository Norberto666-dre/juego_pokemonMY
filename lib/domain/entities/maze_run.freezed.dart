// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'maze_run.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MazeRun {
  String get id;
  int get seed;
  int get currentDepth;
  String get currentNodeId;
  List<String> get visitedNodeIds;
  List<String> get discoveredSecretIds;
  String get status;

  /// Create a copy of MazeRun
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MazeRunCopyWith<MazeRun> get copyWith =>
      _$MazeRunCopyWithImpl<MazeRun>(this as MazeRun, _$identity);

  @override
  bool operator ==(Object other) {
    final _this = this as MazeRun;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MazeRun &&
            (identical(other.id, _this.id) || other.id == _this.id) &&
            (identical(other.seed, _this.seed) || other.seed == _this.seed) &&
            (identical(other.currentDepth, _this.currentDepth) ||
                other.currentDepth == _this.currentDepth) &&
            (identical(other.currentNodeId, _this.currentNodeId) ||
                other.currentNodeId == _this.currentNodeId) &&
            const DeepCollectionEquality()
                .equals(other.visitedNodeIds, _this.visitedNodeIds) &&
            const DeepCollectionEquality()
                .equals(other.discoveredSecretIds, _this.discoveredSecretIds) &&
            (identical(other.status, _this.status) ||
                other.status == _this.status));
  }

  @override
  int get hashCode {
    final _this = this as MazeRun;
    return Object.hash(
        runtimeType,
        _this.id,
        _this.seed,
        _this.currentDepth,
        _this.currentNodeId,
        const DeepCollectionEquality().hash(_this.visitedNodeIds),
        const DeepCollectionEquality().hash(_this.discoveredSecretIds),
        _this.status);
  }

  @override
  String toString() {
    final _this = this as MazeRun;
    return 'MazeRun(id: ${_this.id}, seed: ${_this.seed}, currentDepth: ${_this.currentDepth}, currentNodeId: ${_this.currentNodeId}, visitedNodeIds: ${_this.visitedNodeIds}, discoveredSecretIds: ${_this.discoveredSecretIds}, status: ${_this.status})';
  }
}

/// @nodoc
abstract mixin class $MazeRunCopyWith<$Res> {
  factory $MazeRunCopyWith(MazeRun value, $Res Function(MazeRun) _then) =
      _$MazeRunCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      int seed,
      int currentDepth,
      String currentNodeId,
      List<String> visitedNodeIds,
      List<String> discoveredSecretIds,
      String status});
}

/// @nodoc
class _$MazeRunCopyWithImpl<$Res> implements $MazeRunCopyWith<$Res> {
  _$MazeRunCopyWithImpl(this._self, this._then);

  final MazeRun _self;
  final $Res Function(MazeRun) _then;

  /// Create a copy of MazeRun
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? seed = null,
    Object? currentDepth = null,
    Object? currentNodeId = null,
    Object? visitedNodeIds = null,
    Object? discoveredSecretIds = null,
    Object? status = null,
  }) {
    return _then(MazeRun(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      seed: null == seed
          ? _self.seed
          : seed // ignore: cast_nullable_to_non_nullable
              as int,
      currentDepth: null == currentDepth
          ? _self.currentDepth
          : currentDepth // ignore: cast_nullable_to_non_nullable
              as int,
      currentNodeId: null == currentNodeId
          ? _self.currentNodeId
          : currentNodeId // ignore: cast_nullable_to_non_nullable
              as String,
      visitedNodeIds: null == visitedNodeIds
          ? _self.visitedNodeIds
          : visitedNodeIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      discoveredSecretIds: null == discoveredSecretIds
          ? _self.discoveredSecretIds
          : discoveredSecretIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [MazeRun].
extension MazeRunPatterns on MazeRun {
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
    TResult Function(_MazeRun value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MazeRun() when $default != null:
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
    TResult Function(_MazeRun value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MazeRun():
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
    TResult? Function(_MazeRun value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MazeRun() when $default != null:
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
            int seed,
            int currentDepth,
            String currentNodeId,
            List<String> visitedNodeIds,
            List<String> discoveredSecretIds,
            String status)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MazeRun() when $default != null:
        return $default(
            _that.id,
            _that.seed,
            _that.currentDepth,
            _that.currentNodeId,
            _that.visitedNodeIds,
            _that.discoveredSecretIds,
            _that.status);
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
            int seed,
            int currentDepth,
            String currentNodeId,
            List<String> visitedNodeIds,
            List<String> discoveredSecretIds,
            String status)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MazeRun():
        return $default(
            _that.id,
            _that.seed,
            _that.currentDepth,
            _that.currentNodeId,
            _that.visitedNodeIds,
            _that.discoveredSecretIds,
            _that.status);
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
            int seed,
            int currentDepth,
            String currentNodeId,
            List<String> visitedNodeIds,
            List<String> discoveredSecretIds,
            String status)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MazeRun() when $default != null:
        return $default(
            _that.id,
            _that.seed,
            _that.currentDepth,
            _that.currentNodeId,
            _that.visitedNodeIds,
            _that.discoveredSecretIds,
            _that.status);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _MazeRun implements MazeRun {
  const _MazeRun(
      {required this.id,
      required this.seed,
      required this.currentDepth,
      required this.currentNodeId,
      required List<String> visitedNodeIds,
      required List<String> discoveredSecretIds,
      this.status = 'active'})
      : _visitedNodeIds = visitedNodeIds,
        _discoveredSecretIds = discoveredSecretIds;

  @override
  final String id;
  @override
  final int seed;
  @override
  final int currentDepth;
  @override
  final String currentNodeId;
  final List<String> _visitedNodeIds;
  @override
  List<String> get visitedNodeIds {
    if (_visitedNodeIds is EqualUnmodifiableListView) return _visitedNodeIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_visitedNodeIds);
  }

  final List<String> _discoveredSecretIds;
  @override
  List<String> get discoveredSecretIds {
    if (_discoveredSecretIds is EqualUnmodifiableListView)
      return _discoveredSecretIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_discoveredSecretIds);
  }

  @override
  @JsonKey()
  final String status;

  /// Create a copy of MazeRun
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MazeRunCopyWith<_MazeRun> get copyWith =>
      __$MazeRunCopyWithImpl<_MazeRun>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MazeRun &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.seed, seed) || other.seed == seed) &&
            (identical(other.currentDepth, currentDepth) ||
                other.currentDepth == currentDepth) &&
            (identical(other.currentNodeId, currentNodeId) ||
                other.currentNodeId == currentNodeId) &&
            const DeepCollectionEquality()
                .equals(other.visitedNodeIds, _visitedNodeIds) &&
            const DeepCollectionEquality()
                .equals(other.discoveredSecretIds, _discoveredSecretIds) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        id,
        seed,
        currentDepth,
        currentNodeId,
        const DeepCollectionEquality().hash(_visitedNodeIds),
        const DeepCollectionEquality().hash(_discoveredSecretIds),
        status);
  }

  @override
  String toString() {
    return 'MazeRun(id: $id, seed: $seed, currentDepth: $currentDepth, currentNodeId: $currentNodeId, visitedNodeIds: $visitedNodeIds, discoveredSecretIds: $discoveredSecretIds, status: $status)';
  }
}

/// @nodoc
abstract mixin class _$MazeRunCopyWith<$Res> implements $MazeRunCopyWith<$Res> {
  factory _$MazeRunCopyWith(_MazeRun value, $Res Function(_MazeRun) _then) =
      __$MazeRunCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      int seed,
      int currentDepth,
      String currentNodeId,
      List<String> visitedNodeIds,
      List<String> discoveredSecretIds,
      String status});
}

/// @nodoc
class __$MazeRunCopyWithImpl<$Res> implements _$MazeRunCopyWith<$Res> {
  __$MazeRunCopyWithImpl(this._self, this._then);

  final _MazeRun _self;
  final $Res Function(_MazeRun) _then;

  /// Create a copy of MazeRun
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? seed = null,
    Object? currentDepth = null,
    Object? currentNodeId = null,
    Object? visitedNodeIds = null,
    Object? discoveredSecretIds = null,
    Object? status = null,
  }) {
    return _then(_MazeRun(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      seed: null == seed
          ? _self.seed
          : seed // ignore: cast_nullable_to_non_nullable
              as int,
      currentDepth: null == currentDepth
          ? _self.currentDepth
          : currentDepth // ignore: cast_nullable_to_non_nullable
              as int,
      currentNodeId: null == currentNodeId
          ? _self.currentNodeId
          : currentNodeId // ignore: cast_nullable_to_non_nullable
              as String,
      visitedNodeIds: null == visitedNodeIds
          ? _self._visitedNodeIds
          : visitedNodeIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      discoveredSecretIds: null == discoveredSecretIds
          ? _self._discoveredSecretIds
          : discoveredSecretIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
