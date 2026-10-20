// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Item {
  String get id;
  String get name;
  ItemCategory get category;
  String get description;
  int get price;
  int? get gemPrice;
  ItemEffect get effect;
  int get maxStack;

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ItemCopyWith<Item> get copyWith =>
      _$ItemCopyWithImpl<Item>(this as Item, _$identity);

  @override
  bool operator ==(Object other) {
    final _this = this as Item;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Item &&
            (identical(other.id, _this.id) || other.id == _this.id) &&
            (identical(other.name, _this.name) || other.name == _this.name) &&
            (identical(other.category, _this.category) ||
                other.category == _this.category) &&
            (identical(other.description, _this.description) ||
                other.description == _this.description) &&
            (identical(other.price, _this.price) ||
                other.price == _this.price) &&
            (identical(other.gemPrice, _this.gemPrice) ||
                other.gemPrice == _this.gemPrice) &&
            (identical(other.effect, _this.effect) ||
                other.effect == _this.effect) &&
            (identical(other.maxStack, _this.maxStack) ||
                other.maxStack == _this.maxStack));
  }

  @override
  int get hashCode {
    final _this = this as Item;
    return Object.hash(
        runtimeType,
        _this.id,
        _this.name,
        _this.category,
        _this.description,
        _this.price,
        _this.gemPrice,
        _this.effect,
        _this.maxStack);
  }

  @override
  String toString() {
    final _this = this as Item;
    return 'Item(id: ${_this.id}, name: ${_this.name}, category: ${_this.category}, description: ${_this.description}, price: ${_this.price}, gemPrice: ${_this.gemPrice}, effect: ${_this.effect}, maxStack: ${_this.maxStack})';
  }
}

/// @nodoc
abstract mixin class $ItemCopyWith<$Res> {
  factory $ItemCopyWith(Item value, $Res Function(Item) _then) =
      _$ItemCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String name,
      ItemCategory category,
      String description,
      int price,
      int? gemPrice,
      ItemEffect effect,
      int maxStack});

  $ItemEffectCopyWith<$Res> get effect;
}

/// @nodoc
class _$ItemCopyWithImpl<$Res> implements $ItemCopyWith<$Res> {
  _$ItemCopyWithImpl(this._self, this._then);

  final Item _self;
  final $Res Function(Item) _then;

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? category = null,
    Object? description = null,
    Object? price = null,
    Object? gemPrice = freezed,
    Object? effect = null,
    Object? maxStack = null,
  }) {
    return _then(Item(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as ItemCategory,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      gemPrice: freezed == gemPrice
          ? _self.gemPrice
          : gemPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      effect: null == effect
          ? _self.effect
          : effect // ignore: cast_nullable_to_non_nullable
              as ItemEffect,
      maxStack: null == maxStack
          ? _self.maxStack
          : maxStack // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ItemEffectCopyWith<$Res> get effect {
    return $ItemEffectCopyWith<$Res>(_self.effect, (value) {
      return _then(_self.copyWith(effect: value));
    });
  }
}

/// Adds pattern-matching-related methods to [Item].
extension ItemPatterns on Item {
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
    TResult Function(_Item value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Item() when $default != null:
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
    TResult Function(_Item value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Item():
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
    TResult? Function(_Item value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Item() when $default != null:
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
            ItemCategory category,
            String description,
            int price,
            int? gemPrice,
            ItemEffect effect,
            int maxStack)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Item() when $default != null:
        return $default(_that.id, _that.name, _that.category, _that.description,
            _that.price, _that.gemPrice, _that.effect, _that.maxStack);
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
            ItemCategory category,
            String description,
            int price,
            int? gemPrice,
            ItemEffect effect,
            int maxStack)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Item():
        return $default(_that.id, _that.name, _that.category, _that.description,
            _that.price, _that.gemPrice, _that.effect, _that.maxStack);
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
            ItemCategory category,
            String description,
            int price,
            int? gemPrice,
            ItemEffect effect,
            int maxStack)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Item() when $default != null:
        return $default(_that.id, _that.name, _that.category, _that.description,
            _that.price, _that.gemPrice, _that.effect, _that.maxStack);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Item implements Item {
  const _Item(
      {required this.id,
      required this.name,
      required this.category,
      required this.description,
      required this.price,
      this.gemPrice,
      required this.effect,
      this.maxStack = 99});

  @override
  final String id;
  @override
  final String name;
  @override
  final ItemCategory category;
  @override
  final String description;
  @override
  final int price;
  @override
  final int? gemPrice;
  @override
  final ItemEffect effect;
  @override
  @JsonKey()
  final int maxStack;

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ItemCopyWith<_Item> get copyWith =>
      __$ItemCopyWithImpl<_Item>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Item &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.gemPrice, gemPrice) ||
                other.gemPrice == gemPrice) &&
            (identical(other.effect, effect) || other.effect == effect) &&
            (identical(other.maxStack, maxStack) ||
                other.maxStack == maxStack));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, name, category, description, price,
        gemPrice, effect, maxStack);
  }

  @override
  String toString() {
    return 'Item(id: $id, name: $name, category: $category, description: $description, price: $price, gemPrice: $gemPrice, effect: $effect, maxStack: $maxStack)';
  }
}

/// @nodoc
abstract mixin class _$ItemCopyWith<$Res> implements $ItemCopyWith<$Res> {
  factory _$ItemCopyWith(_Item value, $Res Function(_Item) _then) =
      __$ItemCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      ItemCategory category,
      String description,
      int price,
      int? gemPrice,
      ItemEffect effect,
      int maxStack});

  @override
  $ItemEffectCopyWith<$Res> get effect;
}

/// @nodoc
class __$ItemCopyWithImpl<$Res> implements _$ItemCopyWith<$Res> {
  __$ItemCopyWithImpl(this._self, this._then);

  final _Item _self;
  final $Res Function(_Item) _then;

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? category = null,
    Object? description = null,
    Object? price = null,
    Object? gemPrice = freezed,
    Object? effect = null,
    Object? maxStack = null,
  }) {
    return _then(_Item(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as ItemCategory,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _self.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      gemPrice: freezed == gemPrice
          ? _self.gemPrice
          : gemPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      effect: null == effect
          ? _self.effect
          : effect // ignore: cast_nullable_to_non_nullable
              as ItemEffect,
      maxStack: null == maxStack
          ? _self.maxStack
          : maxStack // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  /// Create a copy of Item
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ItemEffectCopyWith<$Res> get effect {
    return $ItemEffectCopyWith<$Res>(_self.effect, (value) {
      return _then(_self.copyWith(effect: value));
    });
  }
}

/// @nodoc
mixin _$ItemEffect {
  int get healHp;
  double get ballMultiplier;
  int get evGain;
  String get stat;
  int get xStatStages;
  String? get evolutionItemId;

  /// Create a copy of ItemEffect
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ItemEffectCopyWith<ItemEffect> get copyWith =>
      _$ItemEffectCopyWithImpl<ItemEffect>(this as ItemEffect, _$identity);

  @override
  bool operator ==(Object other) {
    final _this = this as ItemEffect;
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ItemEffect &&
            (identical(other.healHp, _this.healHp) ||
                other.healHp == _this.healHp) &&
            (identical(other.ballMultiplier, _this.ballMultiplier) ||
                other.ballMultiplier == _this.ballMultiplier) &&
            (identical(other.evGain, _this.evGain) ||
                other.evGain == _this.evGain) &&
            (identical(other.stat, _this.stat) || other.stat == _this.stat) &&
            (identical(other.xStatStages, _this.xStatStages) ||
                other.xStatStages == _this.xStatStages) &&
            (identical(other.evolutionItemId, _this.evolutionItemId) ||
                other.evolutionItemId == _this.evolutionItemId));
  }

  @override
  int get hashCode {
    final _this = this as ItemEffect;
    return Object.hash(runtimeType, _this.healHp, _this.ballMultiplier,
        _this.evGain, _this.stat, _this.xStatStages, _this.evolutionItemId);
  }

  @override
  String toString() {
    final _this = this as ItemEffect;
    return 'ItemEffect(healHp: ${_this.healHp}, ballMultiplier: ${_this.ballMultiplier}, evGain: ${_this.evGain}, stat: ${_this.stat}, xStatStages: ${_this.xStatStages}, evolutionItemId: ${_this.evolutionItemId})';
  }
}

/// @nodoc
abstract mixin class $ItemEffectCopyWith<$Res> {
  factory $ItemEffectCopyWith(
          ItemEffect value, $Res Function(ItemEffect) _then) =
      _$ItemEffectCopyWithImpl;
  @useResult
  $Res call(
      {int healHp,
      double ballMultiplier,
      int evGain,
      String stat,
      int xStatStages,
      String? evolutionItemId});
}

/// @nodoc
class _$ItemEffectCopyWithImpl<$Res> implements $ItemEffectCopyWith<$Res> {
  _$ItemEffectCopyWithImpl(this._self, this._then);

  final ItemEffect _self;
  final $Res Function(ItemEffect) _then;

  /// Create a copy of ItemEffect
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? healHp = null,
    Object? ballMultiplier = null,
    Object? evGain = null,
    Object? stat = null,
    Object? xStatStages = null,
    Object? evolutionItemId = freezed,
  }) {
    return _then(ItemEffect(
      healHp: null == healHp
          ? _self.healHp
          : healHp // ignore: cast_nullable_to_non_nullable
              as int,
      ballMultiplier: null == ballMultiplier
          ? _self.ballMultiplier
          : ballMultiplier // ignore: cast_nullable_to_non_nullable
              as double,
      evGain: null == evGain
          ? _self.evGain
          : evGain // ignore: cast_nullable_to_non_nullable
              as int,
      stat: null == stat
          ? _self.stat
          : stat // ignore: cast_nullable_to_non_nullable
              as String,
      xStatStages: null == xStatStages
          ? _self.xStatStages
          : xStatStages // ignore: cast_nullable_to_non_nullable
              as int,
      evolutionItemId: freezed == evolutionItemId
          ? _self.evolutionItemId
          : evolutionItemId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [ItemEffect].
extension ItemEffectPatterns on ItemEffect {
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
    TResult Function(_ItemEffect value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ItemEffect() when $default != null:
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
    TResult Function(_ItemEffect value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ItemEffect():
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
    TResult? Function(_ItemEffect value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ItemEffect() when $default != null:
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
    TResult Function(int healHp, double ballMultiplier, int evGain, String stat,
            int xStatStages, String? evolutionItemId)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ItemEffect() when $default != null:
        return $default(_that.healHp, _that.ballMultiplier, _that.evGain,
            _that.stat, _that.xStatStages, _that.evolutionItemId);
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
    TResult Function(int healHp, double ballMultiplier, int evGain, String stat,
            int xStatStages, String? evolutionItemId)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ItemEffect():
        return $default(_that.healHp, _that.ballMultiplier, _that.evGain,
            _that.stat, _that.xStatStages, _that.evolutionItemId);
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
    TResult? Function(int healHp, double ballMultiplier, int evGain,
            String stat, int xStatStages, String? evolutionItemId)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ItemEffect() when $default != null:
        return $default(_that.healHp, _that.ballMultiplier, _that.evGain,
            _that.stat, _that.xStatStages, _that.evolutionItemId);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ItemEffect implements ItemEffect {
  const _ItemEffect(
      {this.healHp = 0,
      this.ballMultiplier = 0,
      this.evGain = 0,
      this.stat = '',
      this.xStatStages = 0,
      this.evolutionItemId});

  @override
  @JsonKey()
  final int healHp;
  @override
  @JsonKey()
  final double ballMultiplier;
  @override
  @JsonKey()
  final int evGain;
  @override
  @JsonKey()
  final String stat;
  @override
  @JsonKey()
  final int xStatStages;
  @override
  final String? evolutionItemId;

  /// Create a copy of ItemEffect
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ItemEffectCopyWith<_ItemEffect> get copyWith =>
      __$ItemEffectCopyWithImpl<_ItemEffect>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ItemEffect &&
            (identical(other.healHp, healHp) || other.healHp == healHp) &&
            (identical(other.ballMultiplier, ballMultiplier) ||
                other.ballMultiplier == ballMultiplier) &&
            (identical(other.evGain, evGain) || other.evGain == evGain) &&
            (identical(other.stat, stat) || other.stat == stat) &&
            (identical(other.xStatStages, xStatStages) ||
                other.xStatStages == xStatStages) &&
            (identical(other.evolutionItemId, evolutionItemId) ||
                other.evolutionItemId == evolutionItemId));
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, healHp, ballMultiplier, evGain, stat,
        xStatStages, evolutionItemId);
  }

  @override
  String toString() {
    return 'ItemEffect(healHp: $healHp, ballMultiplier: $ballMultiplier, evGain: $evGain, stat: $stat, xStatStages: $xStatStages, evolutionItemId: $evolutionItemId)';
  }
}

/// @nodoc
abstract mixin class _$ItemEffectCopyWith<$Res>
    implements $ItemEffectCopyWith<$Res> {
  factory _$ItemEffectCopyWith(
          _ItemEffect value, $Res Function(_ItemEffect) _then) =
      __$ItemEffectCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int healHp,
      double ballMultiplier,
      int evGain,
      String stat,
      int xStatStages,
      String? evolutionItemId});
}

/// @nodoc
class __$ItemEffectCopyWithImpl<$Res> implements _$ItemEffectCopyWith<$Res> {
  __$ItemEffectCopyWithImpl(this._self, this._then);

  final _ItemEffect _self;
  final $Res Function(_ItemEffect) _then;

  /// Create a copy of ItemEffect
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? healHp = null,
    Object? ballMultiplier = null,
    Object? evGain = null,
    Object? stat = null,
    Object? xStatStages = null,
    Object? evolutionItemId = freezed,
  }) {
    return _then(_ItemEffect(
      healHp: null == healHp
          ? _self.healHp
          : healHp // ignore: cast_nullable_to_non_nullable
              as int,
      ballMultiplier: null == ballMultiplier
          ? _self.ballMultiplier
          : ballMultiplier // ignore: cast_nullable_to_non_nullable
              as double,
      evGain: null == evGain
          ? _self.evGain
          : evGain // ignore: cast_nullable_to_non_nullable
              as int,
      stat: null == stat
          ? _self.stat
          : stat // ignore: cast_nullable_to_non_nullable
              as String,
      xStatStages: null == xStatStages
          ? _self.xStatStages
          : xStatStages // ignore: cast_nullable_to_non_nullable
              as int,
      evolutionItemId: freezed == evolutionItemId
          ? _self.evolutionItemId
          : evolutionItemId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
