import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/db/app_database.dart';
import '../../data/repositories/creature_repository_impl.dart';
import '../../domain/repositories/creature_repository.dart';

final appDatabaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(db.close);
  return db;
});

final creatureRepositoryProvider = Provider<CreatureRepository>((ref) {
  return CreatureRepositoryImpl(ref.watch(appDatabaseProvider));
});
