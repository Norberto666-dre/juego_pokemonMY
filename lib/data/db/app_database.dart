import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';
import 'tables/tables.dart';
import 'daos/creature_dao.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [PlayerProfileTable, SpeciesTable, CreatureOwnedTable], daos: [CreatureDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_open());
  @override
  int get schemaVersion => 1;
}

LazyDatabase _open() => LazyDatabase(() async {
      final dir = await getApplicationDocumentsDirectory();
      final file = File(p.join(dir.path, 'game.sqlite'));
      return NativeDatabase.createInBackground(file);
    });
