// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'creature_dao.dart';

// ignore_for_file: type=lint
mixin _$CreatureDaoMixin on DatabaseAccessor<AppDatabase> {
  $CreatureOwnedTableTable get creatureOwnedTable =>
      attachedDatabase.creatureOwnedTable;
  CreatureDaoManager get managers => CreatureDaoManager(this);
}

class CreatureDaoManager {
  final _$CreatureDaoMixin _db;
  CreatureDaoManager(this._db);
  $$CreatureOwnedTableTableTableManager get creatureOwnedTable =>
      $$CreatureOwnedTableTableTableManager(
          _db.attachedDatabase, _db.creatureOwnedTable);
}
