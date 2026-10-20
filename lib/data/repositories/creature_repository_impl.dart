import 'package:drift/drift.dart';
import '../../domain/repositories/creature_repository.dart';
import '../db/app_database.dart';

class CreatureRepositoryImpl implements CreatureRepository {
  CreatureRepositoryImpl(this.db);
  final AppDatabase db;

  @override
  Stream<List<Map<String, dynamic>>> watchAll() =>
      db.creatureDao.watchAll().map((rows) => rows.map((r) => <String, dynamic>{
            'uid': r.uid,
            'speciesId': r.speciesId,
            'level': r.level,
          }).toList());

  @override
  Future<void> add(Map<String, dynamic> row) async {
    await db.creatureDao.insertOne(CreatureOwnedTableCompanion.insert(
      uid: row['uid'] as String,
      speciesId: row['speciesId'] as int,
      level: Value(row['level'] as int? ?? 1),
    ));
  }

  @override
  Future<void> remove(String uid) => db.creatureDao.remove(uid);
}
