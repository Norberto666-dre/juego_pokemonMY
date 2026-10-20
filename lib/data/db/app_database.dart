import 'package:drift/drift.dart';

import 'db_opener_native.dart'
    if (dart.library.js_interop) 'db_opener_web.dart';

import 'tables/tables.dart';
import 'daos/creature_dao.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [PlayerProfileTable, SpeciesTable, CreatureOwnedTable], daos: [CreatureDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(openConnection());
  @override
  int get schemaVersion => 1;
}
