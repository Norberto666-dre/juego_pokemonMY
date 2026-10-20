import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/tables.dart';

part 'creature_dao.g.dart';

@DriftAccessor(tables: [CreatureOwnedTable])
class CreatureDao extends DatabaseAccessor<AppDatabase> with _$CreatureDaoMixin {
  CreatureDao(super.db);

  Stream<List<CreatureOwnedTableData>> watchAll() =>
      select(creatureOwnedTable).watch();

  Future<int> insertOne(CreatureOwnedTableCompanion row) =>
      into(creatureOwnedTable).insert(row);

  Future<int> remove(String uid) =>
      (delete(creatureOwnedTable)..where((t) => t.uid.equals(uid))).go();
}
