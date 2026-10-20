// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'creature_instance.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreatureInstance {
  String get uid;
  int get speciesId;
  String get nickname;
  int get level;
  int get exp;
  Ivs get ivs;
  Evs get evs;
  Nature get nature;
  String get abilityId;
  List<String> get moveIds;
  String? get heldItemId;
  bool get shiny;
  int get friendship;
  bool get favorite;
  DateTime get capturedAt;
  String get slotKind;
  int? get slotIndex;
  int? get currentHp;
  StatusCondition get status;

  /// Create a copy of CreatureInstance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CreatureInstanceCopyWith<CreatureInstance> get copyWith =>
      _$CreatureInstanceCopyWithImpl<CreatureInstance>(
          this as CreatureInstance, _$identity);

  @override
  bool operator ==(Object other) {
    final _this = this as CreatureInstance;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CreatureInstance &&
            (identical(other.uid, _this.uid) || other.uid == _this.uid) &&
            (identical(other.speciesId, _this.speciesId) ||
                other.speciesId == _this.speciesId) &&
            (identical(other.nickname, _this.nickname) ||
                other.nickname == _this.nickname) &&
            (identical(other.level, _this.level) ||
                other.level == _this.level) &&
            (identical(other.exp, _this.exp) || other.exp == _this.exp) &&
            (identical(other.ivs, _this.ivs) || other.ivs == _this.ivs) &&
            (identical(other.evs, _this.evs) || other.evs == _this.evs) &&
            (identical(other.nature, _this.nature) ||
                other.nature == _this.nature) &&
            (identical(other.abilityId, _this.abilityId) ||
                other.abilityId == _this.abilityId) &&
            const DeepCollectionEquality()
                .equals(other.moveIds, _this.moveIds) &&
            (identical(other.heldItemId, _this.heldItemId) ||
                other.heldItemId == _this.heldItemId) &&
            (identical(other.shiny, _this.shiny) ||
                other.shiny == _this.shiny) &&
            (identical(other.friendship, _this.friendship) ||
                other.friendship == _this.friendship) &&
            (identical(other.favorite, _this.favorite) ||
                other.favorite == _this.favorite) &&
            (identical(other.capturedAt, _this.capturedAt) ||
                other.capturedAt == _this.capturedAt) &&
            (identical(other.slotKind, _this.slotKind) ||
                other.slotKind == _this.slotKind) &&
            (identical(other.slotIndex, _this.slotIndex) ||
                other.slotIndex == _this.slotIndex) &&
            (identical(other.currentHp, _this.currentHp) ||
                other.currentHp == _this.currentHp) &&
            (identical(other.status, _this.status) ||
                other.status == _this.status));
  }

  @override
  int get hashCode {
    final _this = this as CreatureInstance;
    return Object.hashAll([
      runtimeType,
      _this.uid,
      _this.speciesId,
      _this.nickname,
      _this.level,
      _this.exp,
      _this.ivs,
      _this.evs,
      _this.nature,
      _this.abilityId,
      const DeepCollectionEquality().hash(_this.moveIds),
      _this.heldItemId,
      _this.shiny,
      _this.friendship,
      _this.favorite,
      _this.capturedAt,
      _this.slotKind,
      _this.slotIndex,
      _this.currentHp,
      _this.status
    ]);
  }

  @override
  String toString() {
    final _this = this as CreatureInstance;
    return 'CreatureInstance(uid: ${_this.uid}, speciesId: ${_this.speciesId}, nickname: ${_this.nickname}, level: ${_this.level}, exp: ${_this.exp}, ivs: ${_this.ivs}, evs: ${_this.evs}, nature: ${_this.nature}, abilityId: ${_this.abilityId}, moveIds: ${_this.moveIds}, heldItemId: ${_this.heldItemId}, shiny: ${_this.shiny}, friendship: ${_this.friendship}, favorite: ${_this.favorite}, capturedAt: ${_this.capturedAt}, slotKind: ${_this.slotKind}, slotIndex: ${_this.slotIndex}, currentHp: ${_this.currentHp}, status: ${_this.status})';
  }
}

/// @nodoc
abstract mixin class $CreatureInstanceCopyWith<$Res> {
  factory $CreatureInstanceCopyWith(
          CreatureInstance value, $Res Function(CreatureInstance) _then) =
      _$CreatureInstanceCopyWithImpl;
  @useResult
  $Res call(
      {String uid,
      int speciesId,
      String nickname,
      int level,
      int exp,
      Ivs ivs,
      Evs evs,
      Nature nature,
      String abilityId,
      List<String> moveIds,
      String? heldItemId,
      bool shiny,
      int friendship,
      bool favorite,
      DateTime capturedAt,
      String slotKind,
      int? slotIndex,
      int? currentHp,
      StatusCondition status});

  $IvsCopyWith<$Res> get ivs;
  $EvsCopyWith<$Res> get evs;
}

/// @nodoc
class _$CreatureInstanceCopyWithImpl<$Res>
    implements $CreatureInstanceCopyWith<$Res> {
  _$CreatureInstanceCopyWithImpl(this._self, this._then);

  final CreatureInstance _self;
  final $Res Function(CreatureInstance) _then;

  /// Create a copy of CreatureInstance
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? speciesId = null,
    Object? nickname = null,
    Object? level = null,
    Object? exp = null,
    Object? ivs = null,
    Object? evs = null,
    Object? nature = null,
    Object? abilityId = null,
    Object? moveIds = null,
    Object? heldItemId = freezed,
    Object? shiny = null,
    Object? friendship = null,
    Object? favorite = null,
    Object? capturedAt = null,
    Object? slotKind = null,
    Object? slotIndex = freezed,
    Object? currentHp = freezed,
    Object? status = null,
  }) {
    return _then(CreatureInstance(
      uid: null == uid
          ? _self.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      speciesId: null == speciesId
          ? _self.speciesId
          : speciesId // ignore: cast_nullable_to_non_nullable
              as int,
      nickname: null == nickname
          ? _self.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      level: null == level
          ? _self.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      exp: null == exp
          ? _self.exp
          : exp // ignore: cast_nullable_to_non_nullable
              as int,
      ivs: null == ivs
          ? _self.ivs
          : ivs // ignore: cast_nullable_to_non_nullable
              as Ivs,
      evs: null == evs
          ? _self.evs
          : evs // ignore: cast_nullable_to_non_nullable
              as Evs,
      nature: null == nature
          ? _self.nature
          : nature // ignore: cast_nullable_to_non_nullable
              as Nature,
      abilityId: null == abilityId
          ? _self.abilityId
          : abilityId // ignore: cast_nullable_to_non_nullable
              as String,
      moveIds: null == moveIds
          ? _self.moveIds
          : moveIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      heldItemId: freezed == heldItemId
          ? _self.heldItemId
          : heldItemId // ignore: cast_nullable_to_non_nullable
              as String?,
      shiny: null == shiny
          ? _self.shiny
          : shiny // ignore: cast_nullable_to_non_nullable
              as bool,
      friendship: null == friendship
          ? _self.friendship
          : friendship // ignore: cast_nullable_to_non_nullable
              as int,
      favorite: null == favorite
          ? _self.favorite
          : favorite // ignore: cast_nullable_to_non_nullable
              as bool,
      capturedAt: null == capturedAt
          ? _self.capturedAt
          : capturedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      slotKind: null == slotKind
          ? _self.slotKind
          : slotKind // ignore: cast_nullable_to_non_nullable
              as String,
      slotIndex: freezed == slotIndex
          ? _self.slotIndex
          : slotIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      currentHp: freezed == currentHp
          ? _self.currentHp
          : currentHp // ignore: cast_nullable_to_non_nullable
              as int?,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as StatusCondition,
    ));
  }

  /// Create a copy of CreatureInstance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $IvsCopyWith<$Res> get ivs {
    return $IvsCopyWith<$Res>(_self.ivs, (value) {
      return _then(_self.copyWith(ivs: value));
    });
  }

  /// Create a copy of CreatureInstance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EvsCopyWith<$Res> get evs {
    return $EvsCopyWith<$Res>(_self.evs, (value) {
      return _then(_self.copyWith(evs: value));
    });
  }
}

/// Adds pattern-matching-related methods to [CreatureInstance].
extension CreatureInstancePatterns on CreatureInstance {
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
    TResult Function(_CreatureInstance value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CreatureInstance() when $default != null:
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
    TResult Function(_CreatureInstance value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreatureInstance():
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
    TResult? Function(_CreatureInstance value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreatureInstance() when $default != null:
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
            String uid,
            int speciesId,
            String nickname,
            int level,
            int exp,
            Ivs ivs,
            Evs evs,
            Nature nature,
            String abilityId,
            List<String> moveIds,
            String? heldItemId,
            bool shiny,
            int friendship,
            bool favorite,
            DateTime capturedAt,
            String slotKind,
            int? slotIndex,
            int? currentHp,
            StatusCondition status)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CreatureInstance() when $default != null:
        return $default(
            _that.uid,
            _that.speciesId,
            _that.nickname,
            _that.level,
            _that.exp,
            _that.ivs,
            _that.evs,
            _that.nature,
            _that.abilityId,
            _that.moveIds,
            _that.heldItemId,
            _that.shiny,
            _that.friendship,
            _that.favorite,
            _that.capturedAt,
            _that.slotKind,
            _that.slotIndex,
            _that.currentHp,
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
            String uid,
            int speciesId,
            String nickname,
            int level,
            int exp,
            Ivs ivs,
            Evs evs,
            Nature nature,
            String abilityId,
            List<String> moveIds,
            String? heldItemId,
            bool shiny,
            int friendship,
            bool favorite,
            DateTime capturedAt,
            String slotKind,
            int? slotIndex,
            int? currentHp,
            StatusCondition status)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreatureInstance():
        return $default(
            _that.uid,
            _that.speciesId,
            _that.nickname,
            _that.level,
            _that.exp,
            _that.ivs,
            _that.evs,
            _that.nature,
            _that.abilityId,
            _that.moveIds,
            _that.heldItemId,
            _that.shiny,
            _that.friendship,
            _that.favorite,
            _that.capturedAt,
            _that.slotKind,
            _that.slotIndex,
            _that.currentHp,
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
            String uid,
            int speciesId,
            String nickname,
            int level,
            int exp,
            Ivs ivs,
            Evs evs,
            Nature nature,
            String abilityId,
            List<String> moveIds,
            String? heldItemId,
            bool shiny,
            int friendship,
            bool favorite,
            DateTime capturedAt,
            String slotKind,
            int? slotIndex,
            int? currentHp,
            StatusCondition status)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CreatureInstance() when $default != null:
        return $default(
            _that.uid,
            _that.speciesId,
            _that.nickname,
            _that.level,
            _that.exp,
            _that.ivs,
            _that.evs,
            _that.nature,
            _that.abilityId,
            _that.moveIds,
            _that.heldItemId,
            _that.shiny,
            _that.friendship,
            _that.favorite,
            _that.capturedAt,
            _that.slotKind,
            _that.slotIndex,
            _that.currentHp,
            _that.status);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _CreatureInstance implements CreatureInstance {
  const _CreatureInstance(
      {required this.uid,
      required this.speciesId,
      this.nickname = '',
      required this.level,
      required this.exp,
      required this.ivs,
      required this.evs,
      required this.nature,
      required this.abilityId,
      required List<String> moveIds,
      this.heldItemId,
      this.shiny = false,
      this.friendship = 70,
      this.favorite = false,
      required this.capturedAt,
      this.slotKind = 'pc',
      this.slotIndex,
      this.currentHp,
      this.status = StatusCondition.none})
      : _moveIds = moveIds;

  @override
  final String uid;
  @override
  final int speciesId;
  @override
  @JsonKey()
  final String nickname;
  @override
  final int level;
  @override
  final int exp;
  @override
  final Ivs ivs;
  @override
  final Evs evs;
  @override
  final Nature nature;
  @override
  final String abilityId;
  final List<String> _moveIds;
  @override
  List<String> get moveIds {
    if (_moveIds is EqualUnmodifiableListView) return _moveIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_moveIds);
  }

  @override
  final String? heldItemId;
  @override
  @JsonKey()
  final bool shiny;
  @override
  @JsonKey()
  final int friendship;
  @override
  @JsonKey()
  final bool favorite;
  @override
  final DateTime capturedAt;
  @override
  @JsonKey()
  final String slotKind;
  @override
  final int? slotIndex;
  @override
  final int? currentHp;
  @override
  @JsonKey()
  final StatusCondition status;

  /// Create a copy of CreatureInstance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CreatureInstanceCopyWith<_CreatureInstance> get copyWith =>
      __$CreatureInstanceCopyWithImpl<_CreatureInstance>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CreatureInstance &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.speciesId, speciesId) ||
                other.speciesId == speciesId) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.exp, exp) || other.exp == exp) &&
            (identical(other.ivs, ivs) || other.ivs == ivs) &&
            (identical(other.evs, evs) || other.evs == evs) &&
            (identical(other.nature, nature) || other.nature == nature) &&
            (identical(other.abilityId, abilityId) ||
                other.abilityId == abilityId) &&
            const DeepCollectionEquality().equals(other.moveIds, _moveIds) &&
            (identical(other.heldItemId, heldItemId) ||
                other.heldItemId == heldItemId) &&
            (identical(other.shiny, shiny) || other.shiny == shiny) &&
            (identical(other.friendship, friendship) ||
                other.friendship == friendship) &&
            (identical(other.favorite, favorite) ||
                other.favorite == favorite) &&
            (identical(other.capturedAt, capturedAt) ||
                other.capturedAt == capturedAt) &&
            (identical(other.slotKind, slotKind) ||
                other.slotKind == slotKind) &&
            (identical(other.slotIndex, slotIndex) ||
                other.slotIndex == slotIndex) &&
            (identical(other.currentHp, currentHp) ||
                other.currentHp == currentHp) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode {
    return Object.hashAll([
      runtimeType,
      uid,
      speciesId,
      nickname,
      level,
      exp,
      ivs,
      evs,
      nature,
      abilityId,
      const DeepCollectionEquality().hash(_moveIds),
      heldItemId,
      shiny,
      friendship,
      favorite,
      capturedAt,
      slotKind,
      slotIndex,
      currentHp,
      status
    ]);
  }

  @override
  String toString() {
    return 'CreatureInstance(uid: $uid, speciesId: $speciesId, nickname: $nickname, level: $level, exp: $exp, ivs: $ivs, evs: $evs, nature: $nature, abilityId: $abilityId, moveIds: $moveIds, heldItemId: $heldItemId, shiny: $shiny, friendship: $friendship, favorite: $favorite, capturedAt: $capturedAt, slotKind: $slotKind, slotIndex: $slotIndex, currentHp: $currentHp, status: $status)';
  }
}

/// @nodoc
abstract mixin class _$CreatureInstanceCopyWith<$Res>
    implements $CreatureInstanceCopyWith<$Res> {
  factory _$CreatureInstanceCopyWith(
          _CreatureInstance value, $Res Function(_CreatureInstance) _then) =
      __$CreatureInstanceCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String uid,
      int speciesId,
      String nickname,
      int level,
      int exp,
      Ivs ivs,
      Evs evs,
      Nature nature,
      String abilityId,
      List<String> moveIds,
      String? heldItemId,
      bool shiny,
      int friendship,
      bool favorite,
      DateTime capturedAt,
      String slotKind,
      int? slotIndex,
      int? currentHp,
      StatusCondition status});

  @override
  $IvsCopyWith<$Res> get ivs;
  @override
  $EvsCopyWith<$Res> get evs;
}

/// @nodoc
class __$CreatureInstanceCopyWithImpl<$Res>
    implements _$CreatureInstanceCopyWith<$Res> {
  __$CreatureInstanceCopyWithImpl(this._self, this._then);

  final _CreatureInstance _self;
  final $Res Function(_CreatureInstance) _then;

  /// Create a copy of CreatureInstance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? uid = null,
    Object? speciesId = null,
    Object? nickname = null,
    Object? level = null,
    Object? exp = null,
    Object? ivs = null,
    Object? evs = null,
    Object? nature = null,
    Object? abilityId = null,
    Object? moveIds = null,
    Object? heldItemId = freezed,
    Object? shiny = null,
    Object? friendship = null,
    Object? favorite = null,
    Object? capturedAt = null,
    Object? slotKind = null,
    Object? slotIndex = freezed,
    Object? currentHp = freezed,
    Object? status = null,
  }) {
    return _then(_CreatureInstance(
      uid: null == uid
          ? _self.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      speciesId: null == speciesId
          ? _self.speciesId
          : speciesId // ignore: cast_nullable_to_non_nullable
              as int,
      nickname: null == nickname
          ? _self.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      level: null == level
          ? _self.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      exp: null == exp
          ? _self.exp
          : exp // ignore: cast_nullable_to_non_nullable
              as int,
      ivs: null == ivs
          ? _self.ivs
          : ivs // ignore: cast_nullable_to_non_nullable
              as Ivs,
      evs: null == evs
          ? _self.evs
          : evs // ignore: cast_nullable_to_non_nullable
              as Evs,
      nature: null == nature
          ? _self.nature
          : nature // ignore: cast_nullable_to_non_nullable
              as Nature,
      abilityId: null == abilityId
          ? _self.abilityId
          : abilityId // ignore: cast_nullable_to_non_nullable
              as String,
      moveIds: null == moveIds
          ? _self._moveIds
          : moveIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      heldItemId: freezed == heldItemId
          ? _self.heldItemId
          : heldItemId // ignore: cast_nullable_to_non_nullable
              as String?,
      shiny: null == shiny
          ? _self.shiny
          : shiny // ignore: cast_nullable_to_non_nullable
              as bool,
      friendship: null == friendship
          ? _self.friendship
          : friendship // ignore: cast_nullable_to_non_nullable
              as int,
      favorite: null == favorite
          ? _self.favorite
          : favorite // ignore: cast_nullable_to_non_nullable
              as bool,
      capturedAt: null == capturedAt
          ? _self.capturedAt
          : capturedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      slotKind: null == slotKind
          ? _self.slotKind
          : slotKind // ignore: cast_nullable_to_non_nullable
              as String,
      slotIndex: freezed == slotIndex
          ? _self.slotIndex
          : slotIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      currentHp: freezed == currentHp
          ? _self.currentHp
          : currentHp // ignore: cast_nullable_to_non_nullable
              as int?,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as StatusCondition,
    ));
  }

  /// Create a copy of CreatureInstance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $IvsCopyWith<$Res> get ivs {
    return $IvsCopyWith<$Res>(_self.ivs, (value) {
      return _then(_self.copyWith(ivs: value));
    });
  }

  /// Create a copy of CreatureInstance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EvsCopyWith<$Res> get evs {
    return $EvsCopyWith<$Res>(_self.evs, (value) {
      return _then(_self.copyWith(evs: value));
    });
  }
}

// dart format on
