import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/db/app_database.dart';
import '../../data/repositories/creature_repository_impl.dart';
import '../../data/repositories/in_memory_creature_repository.dart';
import '../../domain/repositories/creature_repository.dart';

final appDatabaseProvider = Provider<AppDatabase?>((ref) {
  if (kIsWeb) return null;
  final db = AppDatabase();
  ref.onDispose(db.close);
  return db;
});

final creatureRepositoryProvider = Provider<CreatureRepository>((ref) {
  if (kIsWeb) return InMemoryCreatureRepository();
  final db = ref.watch(appDatabaseProvider);
  return CreatureRepositoryImpl(db!);
});
