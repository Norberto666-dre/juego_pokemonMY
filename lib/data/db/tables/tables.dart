import 'package:drift/drift.dart';

class PlayerProfileTable extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  IntColumn get coins => integer().withDefault(const Constant(0))();
  @override Set<Column> get primaryKey => {id};
}

class SpeciesTable extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();
  @override Set<Column> get primaryKey => {id};
}

class CreatureOwnedTable extends Table {
  TextColumn get uid => text()();
  IntColumn get speciesId => integer()();
  IntColumn get level => integer().withDefault(const Constant(1))();
  @override Set<Column> get primaryKey => {uid};
}
