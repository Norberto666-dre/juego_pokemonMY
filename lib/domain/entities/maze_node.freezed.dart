// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'maze_node.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MazeNode {
  String get id;
  int get depth;
  int get lane;
  NodeType get type;
  Biome get biome;
  List<String> get nextIds;
  bool get revealed;
  bool get visited;
  String? get secretTargetId;

  /// Create a copy of MazeNode
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MazeNodeCopyWith<MazeNode> get copyWith =>
      _$MazeNodeCopyWithImpl<MazeNode>(this as MazeNode, _$identity);

  @override
  bool operator ==(Object other) {
    final _this = this as MazeNode;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MazeNode &&
            (identical(other.id, _this.id) || other.id == _this.id) &&
            (identical(other.depth, _this.depth) ||
                other.depth == _this.depth) &&
            (identical(other.lane, _this.lane) || other.lane == _this.lane) &&
            (identical(other.type, _this.type) || other.type == _this.type) &&
            (identical(other.biome, _this.biome) ||
                other.biome == _this.biome) &&
            const DeepCollectionEquality()
                .equals(other.nextIds, _this.nextIds) &&
            (identical(other.revealed, _this.revealed) ||
                other.revealed == _this.revealed) &&
            (identical(other.visited, _this.visited) ||
                other.visited == _this.visited) &&
            (identical(other.secretTargetId, _this.secretTargetId) ||
                other.secretTargetId == _this.secretTargetId));
  }

  @override
  int get hashCode {
    final _this = this as MazeNode;
    return Object.hash(
        runtimeType,
        _this.id,
        _this.depth,
        _this.lane,
        _this.type,
        _this.biome,
        const DeepCollectionEquality().hash(_this.nextIds),
        _this.revealed,
        _this.visited,
        _this.secretTargetId);
  }

  @override
  String toString() {
    final _this = this as MazeNode;
    return 'MazeNode(id: ${_this.id}, depth: ${_this.depth}, lane: ${_this.lane}, type: ${_this.type}, biome: ${_this.biome}, nextIds: ${_this.nextIds}, revealed: ${_this.revealed}, visited: ${_this.visited}, secretTargetId: ${_this.secretTargetId})';
  }
}

/// @nodoc
abstract mixin class $MazeNodeCopyWith<$Res> {
  factory $MazeNodeCopyWith(MazeNode value, $Res Function(MazeNode) _then) =
      _$MazeNodeCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      int depth,
      int lane,
      NodeType type,
      Biome biome,
      List<String> nextIds,
      bool revealed,
      bool visited,
      String? secretTargetId});
}

/// @nodoc
class _$MazeNodeCopyWithImpl<$Res> implements $MazeNodeCopyWith<$Res> {
  _$MazeNodeCopyWithImpl(this._self, this._then);

  final MazeNode _self;
  final $Res Function(MazeNode) _then;

  /// Create a copy of MazeNode
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? depth = null,
    Object? lane = null,
    Object? type = null,
    Object? biome = null,
    Object? nextIds = null,
    Object? revealed = null,
    Object? visited = null,
    Object? secretTargetId = freezed,
  }) {
    return _then(MazeNode(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      depth: null == depth
          ? _self.depth
          : depth // ignore: cast_nullable_to_non_nullable
              as int,
      lane: null == lane
          ? _self.lane
          : lane // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as NodeType,
      biome: null == biome
          ? _self.biome
          : biome // ignore: cast_nullable_to_non_nullable
              as Biome,
      nextIds: null == nextIds
          ? _self.nextIds
          : nextIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      revealed: null == revealed
          ? _self.revealed
          : revealed // ignore: cast_nullable_to_non_nullable
              as bool,
      visited: null == visited
          ? _self.visited
          : visited // ignore: cast_nullable_to_non_nullable
              as bool,
      secretTargetId: freezed == secretTargetId
          ? _self.secretTargetId
          : secretTargetId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [MazeNode].
extension MazeNodePatterns on MazeNode {
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
    TResult Function(_MazeNode value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MazeNode() when $default != null:
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
    TResult Function(_MazeNode value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MazeNode():
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
    TResult? Function(_MazeNode value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MazeNode() when $default != null:
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
            int depth,
            int lane,
            NodeType type,
            Biome biome,
            List<String> nextIds,
            bool revealed,
            bool visited,
            String? secretTargetId)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MazeNode() when $default != null:
        return $default(
            _that.id,
            _that.depth,
            _that.lane,
            _that.type,
            _that.biome,
            _that.nextIds,
            _that.revealed,
            _that.visited,
            _that.secretTargetId);
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
            int depth,
            int lane,
            NodeType type,
            Biome biome,
            List<String> nextIds,
            bool revealed,
            bool visited,
            String? secretTargetId)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MazeNode():
        return $default(
            _that.id,
            _that.depth,
            _that.lane,
            _that.type,
            _that.biome,
            _that.nextIds,
            _that.revealed,
            _that.visited,
            _that.secretTargetId);
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
            int depth,
            int lane,
            NodeType type,
            Biome biome,
            List<String> nextIds,
            bool revealed,
            bool visited,
            String? secretTargetId)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MazeNode() when $default != null:
        return $default(
            _that.id,
            _that.depth,
            _that.lane,
            _that.type,
            _that.biome,
            _that.nextIds,
            _that.revealed,
            _that.visited,
            _that.secretTargetId);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _MazeNode implements MazeNode {
  const _MazeNode(
      {required this.id,
      required this.depth,
      required this.lane,
      required this.type,
      required this.biome,
      required List<String> nextIds,
      this.revealed = false,
      this.visited = false,
      this.secretTargetId})
      : _nextIds = nextIds;

  @override
  final String id;
  @override
  final int depth;
  @override
  final int lane;
  @override
  final NodeType type;
  @override
  final Biome biome;
  final List<String> _nextIds;
  @override
  List<String> get nextIds {
    if (_nextIds is EqualUnmodifiableListView) return _nextIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_nextIds);
  }

  @override
  @JsonKey()
  final bool revealed;
  @override
  @JsonKey()
  final bool visited;
  @override
  final String? secretTargetId;

  /// Create a copy of MazeNode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MazeNodeCopyWith<_MazeNode> get copyWith =>
      __$MazeNodeCopyWithImpl<_MazeNode>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MazeNode &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.depth, depth) || other.depth == depth) &&
            (identical(other.lane, lane) || other.lane == lane) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.biome, biome) || other.biome == biome) &&
            const DeepCollectionEquality().equals(other.nextIds, _nextIds) &&
            (identical(other.revealed, revealed) ||
                other.revealed == revealed) &&
            (identical(other.visited, visited) || other.visited == visited) &&
            (identical(other.secretTargetId, secretTargetId) ||
                other.secretTargetId == secretTargetId));
  }

  @override
  int get hashCode {
    return Object.hash(
        runtimeType,
        id,
        depth,
        lane,
        type,
        biome,
        const DeepCollectionEquality().hash(_nextIds),
        revealed,
        visited,
        secretTargetId);
  }

  @override
  String toString() {
    return 'MazeNode(id: $id, depth: $depth, lane: $lane, type: $type, biome: $biome, nextIds: $nextIds, revealed: $revealed, visited: $visited, secretTargetId: $secretTargetId)';
  }
}

/// @nodoc
abstract mixin class _$MazeNodeCopyWith<$Res>
    implements $MazeNodeCopyWith<$Res> {
  factory _$MazeNodeCopyWith(_MazeNode value, $Res Function(_MazeNode) _then) =
      __$MazeNodeCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      int depth,
      int lane,
      NodeType type,
      Biome biome,
      List<String> nextIds,
      bool revealed,
      bool visited,
      String? secretTargetId});
}

/// @nodoc
class __$MazeNodeCopyWithImpl<$Res> implements _$MazeNodeCopyWith<$Res> {
  __$MazeNodeCopyWithImpl(this._self, this._then);

  final _MazeNode _self;
  final $Res Function(_MazeNode) _then;

  /// Create a copy of MazeNode
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? depth = null,
    Object? lane = null,
    Object? type = null,
    Object? biome = null,
    Object? nextIds = null,
    Object? revealed = null,
    Object? visited = null,
    Object? secretTargetId = freezed,
  }) {
    return _then(_MazeNode(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      depth: null == depth
          ? _self.depth
          : depth // ignore: cast_nullable_to_non_nullable
              as int,
      lane: null == lane
          ? _self.lane
          : lane // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as NodeType,
      biome: null == biome
          ? _self.biome
          : biome // ignore: cast_nullable_to_non_nullable
              as Biome,
      nextIds: null == nextIds
          ? _self._nextIds
          : nextIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      revealed: null == revealed
          ? _self.revealed
          : revealed // ignore: cast_nullable_to_non_nullable
              as bool,
      visited: null == visited
          ? _self.visited
          : visited // ignore: cast_nullable_to_non_nullable
              as bool,
      secretTargetId: freezed == secretTargetId
          ? _self.secretTargetId
          : secretTargetId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
