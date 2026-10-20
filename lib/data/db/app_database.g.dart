// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $PlayerProfileTableTable extends PlayerProfileTable
    with TableInfo<$PlayerProfileTableTable, PlayerProfileTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlayerProfileTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _coinsMeta = const VerificationMeta('coins');
  @override
  late final GeneratedColumn<int> coins = GeneratedColumn<int>(
      'coins', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  @override
  List<GeneratedColumn> get $columns => [id, name, coins];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'player_profile_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<PlayerProfileTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('coins')) {
      context.handle(
          _coinsMeta, coins.isAcceptableOrUnknown(data['coins']!, _coinsMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PlayerProfileTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PlayerProfileTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      coins: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}coins'])!,
    );
  }

  @override
  $PlayerProfileTableTable createAlias(String alias) {
    return $PlayerProfileTableTable(attachedDatabase, alias);
  }
}

class PlayerProfileTableData extends DataClass
    implements Insertable<PlayerProfileTableData> {
  final String id;
  final String name;
  final int coins;
  const PlayerProfileTableData(
      {required this.id, required this.name, required this.coins});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['coins'] = Variable<int>(coins);
    return map;
  }

  PlayerProfileTableCompanion toCompanion(bool nullToAbsent) {
    return PlayerProfileTableCompanion(
      id: Value(id),
      name: Value(name),
      coins: Value(coins),
    );
  }

  factory PlayerProfileTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PlayerProfileTableData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      coins: serializer.fromJson<int>(json['coins']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'coins': serializer.toJson<int>(coins),
    };
  }

  PlayerProfileTableData copyWith({String? id, String? name, int? coins}) =>
      PlayerProfileTableData(
        id: id ?? this.id,
        name: name ?? this.name,
        coins: coins ?? this.coins,
      );
  PlayerProfileTableData copyWithCompanion(PlayerProfileTableCompanion data) {
    return PlayerProfileTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      coins: data.coins.present ? data.coins.value : this.coins,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PlayerProfileTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('coins: $coins')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, coins);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PlayerProfileTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.coins == this.coins);
}

class PlayerProfileTableCompanion
    extends UpdateCompanion<PlayerProfileTableData> {
  final Value<String> id;
  final Value<String> name;
  final Value<int> coins;
  final Value<int> rowid;
  const PlayerProfileTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.coins = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PlayerProfileTableCompanion.insert({
    required String id,
    required String name,
    this.coins = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name);
  static Insertable<PlayerProfileTableData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<int>? coins,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (coins != null) 'coins': coins,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PlayerProfileTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<int>? coins,
      Value<int>? rowid}) {
    return PlayerProfileTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      coins: coins ?? this.coins,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (coins.present) {
      map['coins'] = Variable<int>(coins.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlayerProfileTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('coins: $coins, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SpeciesTableTable extends SpeciesTable
    with TableInfo<$SpeciesTableTable, SpeciesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SpeciesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'species_table';
  @override
  VerificationContext validateIntegrity(Insertable<SpeciesTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SpeciesTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SpeciesTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  $SpeciesTableTable createAlias(String alias) {
    return $SpeciesTableTable(attachedDatabase, alias);
  }
}

class SpeciesTableData extends DataClass
    implements Insertable<SpeciesTableData> {
  final int id;
  final String name;
  const SpeciesTableData({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  SpeciesTableCompanion toCompanion(bool nullToAbsent) {
    return SpeciesTableCompanion(
      id: Value(id),
      name: Value(name),
    );
  }

  factory SpeciesTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SpeciesTableData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  SpeciesTableData copyWith({int? id, String? name}) => SpeciesTableData(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  SpeciesTableData copyWithCompanion(SpeciesTableCompanion data) {
    return SpeciesTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SpeciesTableData(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SpeciesTableData &&
          other.id == this.id &&
          other.name == this.name);
}

class SpeciesTableCompanion extends UpdateCompanion<SpeciesTableData> {
  final Value<int> id;
  final Value<String> name;
  const SpeciesTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  SpeciesTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<SpeciesTableData> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  SpeciesTableCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return SpeciesTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SpeciesTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $CreatureOwnedTableTable extends CreatureOwnedTable
    with TableInfo<$CreatureOwnedTableTable, CreatureOwnedTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CreatureOwnedTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uidMeta = const VerificationMeta('uid');
  @override
  late final GeneratedColumn<String> uid = GeneratedColumn<String>(
      'uid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _speciesIdMeta =
      const VerificationMeta('speciesId');
  @override
  late final GeneratedColumn<int> speciesId = GeneratedColumn<int>(
      'species_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _levelMeta = const VerificationMeta('level');
  @override
  late final GeneratedColumn<int> level = GeneratedColumn<int>(
      'level', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  @override
  List<GeneratedColumn> get $columns => [uid, speciesId, level];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'creature_owned_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<CreatureOwnedTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uid')) {
      context.handle(
          _uidMeta, uid.isAcceptableOrUnknown(data['uid']!, _uidMeta));
    } else if (isInserting) {
      context.missing(_uidMeta);
    }
    if (data.containsKey('species_id')) {
      context.handle(_speciesIdMeta,
          speciesId.isAcceptableOrUnknown(data['species_id']!, _speciesIdMeta));
    } else if (isInserting) {
      context.missing(_speciesIdMeta);
    }
    if (data.containsKey('level')) {
      context.handle(
          _levelMeta, level.isAcceptableOrUnknown(data['level']!, _levelMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uid};
  @override
  CreatureOwnedTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CreatureOwnedTableData(
      uid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uid'])!,
      speciesId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}species_id'])!,
      level: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}level'])!,
    );
  }

  @override
  $CreatureOwnedTableTable createAlias(String alias) {
    return $CreatureOwnedTableTable(attachedDatabase, alias);
  }
}

class CreatureOwnedTableData extends DataClass
    implements Insertable<CreatureOwnedTableData> {
  final String uid;
  final int speciesId;
  final int level;
  const CreatureOwnedTableData(
      {required this.uid, required this.speciesId, required this.level});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uid'] = Variable<String>(uid);
    map['species_id'] = Variable<int>(speciesId);
    map['level'] = Variable<int>(level);
    return map;
  }

  CreatureOwnedTableCompanion toCompanion(bool nullToAbsent) {
    return CreatureOwnedTableCompanion(
      uid: Value(uid),
      speciesId: Value(speciesId),
      level: Value(level),
    );
  }

  factory CreatureOwnedTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CreatureOwnedTableData(
      uid: serializer.fromJson<String>(json['uid']),
      speciesId: serializer.fromJson<int>(json['speciesId']),
      level: serializer.fromJson<int>(json['level']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uid': serializer.toJson<String>(uid),
      'speciesId': serializer.toJson<int>(speciesId),
      'level': serializer.toJson<int>(level),
    };
  }

  CreatureOwnedTableData copyWith({String? uid, int? speciesId, int? level}) =>
      CreatureOwnedTableData(
        uid: uid ?? this.uid,
        speciesId: speciesId ?? this.speciesId,
        level: level ?? this.level,
      );
  CreatureOwnedTableData copyWithCompanion(CreatureOwnedTableCompanion data) {
    return CreatureOwnedTableData(
      uid: data.uid.present ? data.uid.value : this.uid,
      speciesId: data.speciesId.present ? data.speciesId.value : this.speciesId,
      level: data.level.present ? data.level.value : this.level,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CreatureOwnedTableData(')
          ..write('uid: $uid, ')
          ..write('speciesId: $speciesId, ')
          ..write('level: $level')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(uid, speciesId, level);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CreatureOwnedTableData &&
          other.uid == this.uid &&
          other.speciesId == this.speciesId &&
          other.level == this.level);
}

class CreatureOwnedTableCompanion
    extends UpdateCompanion<CreatureOwnedTableData> {
  final Value<String> uid;
  final Value<int> speciesId;
  final Value<int> level;
  final Value<int> rowid;
  const CreatureOwnedTableCompanion({
    this.uid = const Value.absent(),
    this.speciesId = const Value.absent(),
    this.level = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CreatureOwnedTableCompanion.insert({
    required String uid,
    required int speciesId,
    this.level = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : uid = Value(uid),
        speciesId = Value(speciesId);
  static Insertable<CreatureOwnedTableData> custom({
    Expression<String>? uid,
    Expression<int>? speciesId,
    Expression<int>? level,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (uid != null) 'uid': uid,
      if (speciesId != null) 'species_id': speciesId,
      if (level != null) 'level': level,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CreatureOwnedTableCompanion copyWith(
      {Value<String>? uid,
      Value<int>? speciesId,
      Value<int>? level,
      Value<int>? rowid}) {
    return CreatureOwnedTableCompanion(
      uid: uid ?? this.uid,
      speciesId: speciesId ?? this.speciesId,
      level: level ?? this.level,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uid.present) {
      map['uid'] = Variable<String>(uid.value);
    }
    if (speciesId.present) {
      map['species_id'] = Variable<int>(speciesId.value);
    }
    if (level.present) {
      map['level'] = Variable<int>(level.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CreatureOwnedTableCompanion(')
          ..write('uid: $uid, ')
          ..write('speciesId: $speciesId, ')
          ..write('level: $level, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $PlayerProfileTableTable playerProfileTable =
      $PlayerProfileTableTable(this);
  late final $SpeciesTableTable speciesTable = $SpeciesTableTable(this);
  late final $CreatureOwnedTableTable creatureOwnedTable =
      $CreatureOwnedTableTable(this);
  late final CreatureDao creatureDao = CreatureDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [playerProfileTable, speciesTable, creatureOwnedTable];
}

typedef $$PlayerProfileTableTableCreateCompanionBuilder
    = PlayerProfileTableCompanion Function({
  required String id,
  required String name,
  Value<int> coins,
  Value<int> rowid,
});
typedef $$PlayerProfileTableTableUpdateCompanionBuilder
    = PlayerProfileTableCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<int> coins,
  Value<int> rowid,
});

class $$PlayerProfileTableTableFilterComposer
    extends Composer<_$AppDatabase, $PlayerProfileTableTable> {
  $$PlayerProfileTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get coins => $composableBuilder(
      column: $table.coins, builder: (column) => ColumnFilters(column));
}

class $$PlayerProfileTableTableOrderingComposer
    extends Composer<_$AppDatabase, $PlayerProfileTableTable> {
  $$PlayerProfileTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get coins => $composableBuilder(
      column: $table.coins, builder: (column) => ColumnOrderings(column));
}

class $$PlayerProfileTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $PlayerProfileTableTable> {
  $$PlayerProfileTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get coins =>
      $composableBuilder(column: $table.coins, builder: (column) => column);
}

class $$PlayerProfileTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PlayerProfileTableTable,
    PlayerProfileTableData,
    $$PlayerProfileTableTableFilterComposer,
    $$PlayerProfileTableTableOrderingComposer,
    $$PlayerProfileTableTableAnnotationComposer,
    $$PlayerProfileTableTableCreateCompanionBuilder,
    $$PlayerProfileTableTableUpdateCompanionBuilder,
    (
      PlayerProfileTableData,
      BaseReferences<_$AppDatabase, $PlayerProfileTableTable,
          PlayerProfileTableData>
    ),
    PlayerProfileTableData,
    PrefetchHooks Function()> {
  $$PlayerProfileTableTableTableManager(
      _$AppDatabase db, $PlayerProfileTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PlayerProfileTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PlayerProfileTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PlayerProfileTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<int> coins = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PlayerProfileTableCompanion(
            id: id,
            name: name,
            coins: coins,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            Value<int> coins = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PlayerProfileTableCompanion.insert(
            id: id,
            name: name,
            coins: coins,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable<$PlayerProfileTableTable,
                        PlayerProfileTableData>(table),
                    BaseReferences<_$AppDatabase, $PlayerProfileTableTable,
                        PlayerProfileTableData>(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$PlayerProfileTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $PlayerProfileTableTable,
    PlayerProfileTableData,
    $$PlayerProfileTableTableFilterComposer,
    $$PlayerProfileTableTableOrderingComposer,
    $$PlayerProfileTableTableAnnotationComposer,
    $$PlayerProfileTableTableCreateCompanionBuilder,
    $$PlayerProfileTableTableUpdateCompanionBuilder,
    (
      PlayerProfileTableData,
      BaseReferences<_$AppDatabase, $PlayerProfileTableTable,
          PlayerProfileTableData>
    ),
    PlayerProfileTableData,
    PrefetchHooks Function()>;
typedef $$SpeciesTableTableCreateCompanionBuilder = SpeciesTableCompanion
    Function({
  Value<int> id,
  required String name,
});
typedef $$SpeciesTableTableUpdateCompanionBuilder = SpeciesTableCompanion
    Function({
  Value<int> id,
  Value<String> name,
});

class $$SpeciesTableTableFilterComposer
    extends Composer<_$AppDatabase, $SpeciesTableTable> {
  $$SpeciesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));
}

class $$SpeciesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $SpeciesTableTable> {
  $$SpeciesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));
}

class $$SpeciesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $SpeciesTableTable> {
  $$SpeciesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);
}

class $$SpeciesTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SpeciesTableTable,
    SpeciesTableData,
    $$SpeciesTableTableFilterComposer,
    $$SpeciesTableTableOrderingComposer,
    $$SpeciesTableTableAnnotationComposer,
    $$SpeciesTableTableCreateCompanionBuilder,
    $$SpeciesTableTableUpdateCompanionBuilder,
    (
      SpeciesTableData,
      BaseReferences<_$AppDatabase, $SpeciesTableTable, SpeciesTableData>
    ),
    SpeciesTableData,
    PrefetchHooks Function()> {
  $$SpeciesTableTableTableManager(_$AppDatabase db, $SpeciesTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SpeciesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SpeciesTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SpeciesTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
          }) =>
              SpeciesTableCompanion(
            id: id,
            name: name,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
          }) =>
              SpeciesTableCompanion.insert(
            id: id,
            name: name,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable<$SpeciesTableTable, SpeciesTableData>(table),
                    BaseReferences<_$AppDatabase, $SpeciesTableTable,
                        SpeciesTableData>(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SpeciesTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SpeciesTableTable,
    SpeciesTableData,
    $$SpeciesTableTableFilterComposer,
    $$SpeciesTableTableOrderingComposer,
    $$SpeciesTableTableAnnotationComposer,
    $$SpeciesTableTableCreateCompanionBuilder,
    $$SpeciesTableTableUpdateCompanionBuilder,
    (
      SpeciesTableData,
      BaseReferences<_$AppDatabase, $SpeciesTableTable, SpeciesTableData>
    ),
    SpeciesTableData,
    PrefetchHooks Function()>;
typedef $$CreatureOwnedTableTableCreateCompanionBuilder
    = CreatureOwnedTableCompanion Function({
  required String uid,
  required int speciesId,
  Value<int> level,
  Value<int> rowid,
});
typedef $$CreatureOwnedTableTableUpdateCompanionBuilder
    = CreatureOwnedTableCompanion Function({
  Value<String> uid,
  Value<int> speciesId,
  Value<int> level,
  Value<int> rowid,
});

class $$CreatureOwnedTableTableFilterComposer
    extends Composer<_$AppDatabase, $CreatureOwnedTableTable> {
  $$CreatureOwnedTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get uid => $composableBuilder(
      column: $table.uid, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get speciesId => $composableBuilder(
      column: $table.speciesId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get level => $composableBuilder(
      column: $table.level, builder: (column) => ColumnFilters(column));
}

class $$CreatureOwnedTableTableOrderingComposer
    extends Composer<_$AppDatabase, $CreatureOwnedTableTable> {
  $$CreatureOwnedTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get uid => $composableBuilder(
      column: $table.uid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get speciesId => $composableBuilder(
      column: $table.speciesId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get level => $composableBuilder(
      column: $table.level, builder: (column) => ColumnOrderings(column));
}

class $$CreatureOwnedTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $CreatureOwnedTableTable> {
  $$CreatureOwnedTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get uid =>
      $composableBuilder(column: $table.uid, builder: (column) => column);

  GeneratedColumn<int> get speciesId =>
      $composableBuilder(column: $table.speciesId, builder: (column) => column);

  GeneratedColumn<int> get level =>
      $composableBuilder(column: $table.level, builder: (column) => column);
}

class $$CreatureOwnedTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CreatureOwnedTableTable,
    CreatureOwnedTableData,
    $$CreatureOwnedTableTableFilterComposer,
    $$CreatureOwnedTableTableOrderingComposer,
    $$CreatureOwnedTableTableAnnotationComposer,
    $$CreatureOwnedTableTableCreateCompanionBuilder,
    $$CreatureOwnedTableTableUpdateCompanionBuilder,
    (
      CreatureOwnedTableData,
      BaseReferences<_$AppDatabase, $CreatureOwnedTableTable,
          CreatureOwnedTableData>
    ),
    CreatureOwnedTableData,
    PrefetchHooks Function()> {
  $$CreatureOwnedTableTableTableManager(
      _$AppDatabase db, $CreatureOwnedTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CreatureOwnedTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CreatureOwnedTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CreatureOwnedTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> uid = const Value.absent(),
            Value<int> speciesId = const Value.absent(),
            Value<int> level = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CreatureOwnedTableCompanion(
            uid: uid,
            speciesId: speciesId,
            level: level,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String uid,
            required int speciesId,
            Value<int> level = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CreatureOwnedTableCompanion.insert(
            uid: uid,
            speciesId: speciesId,
            level: level,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable<$CreatureOwnedTableTable,
                        CreatureOwnedTableData>(table),
                    BaseReferences<_$AppDatabase, $CreatureOwnedTableTable,
                        CreatureOwnedTableData>(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CreatureOwnedTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CreatureOwnedTableTable,
    CreatureOwnedTableData,
    $$CreatureOwnedTableTableFilterComposer,
    $$CreatureOwnedTableTableOrderingComposer,
    $$CreatureOwnedTableTableAnnotationComposer,
    $$CreatureOwnedTableTableCreateCompanionBuilder,
    $$CreatureOwnedTableTableUpdateCompanionBuilder,
    (
      CreatureOwnedTableData,
      BaseReferences<_$AppDatabase, $CreatureOwnedTableTable,
          CreatureOwnedTableData>
    ),
    CreatureOwnedTableData,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$PlayerProfileTableTableTableManager get playerProfileTable =>
      $$PlayerProfileTableTableTableManager(_db, _db.playerProfileTable);
  $$SpeciesTableTableTableManager get speciesTable =>
      $$SpeciesTableTableTableManager(_db, _db.speciesTable);
  $$CreatureOwnedTableTableTableManager get creatureOwnedTable =>
      $$CreatureOwnedTableTableTableManager(_db, _db.creatureOwnedTable);
}
