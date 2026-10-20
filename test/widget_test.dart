import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:pokemon_card_slot_battle/app.dart';
import 'package:pokemon_card_slot_battle/core/di/providers.dart';
import 'package:pokemon_card_slot_battle/domain/repositories/creature_repository.dart';

class _FakeRepo implements CreatureRepository {
  @override
  Stream<List<Map<String, dynamic>>> watchAll() => Stream.value(const []);

  @override
  Future<void> add(Map<String, dynamic> row) async {}

  @override
  Future<void> remove(String uid) async {}
}

void main() {
  testWidgets('app builds', (WidgetTester tester) async {
    await tester.pumpWidget(ProviderScope(
      overrides: [creatureRepositoryProvider.overrideWithValue(_FakeRepo())],
      child: const App(),
    ));
    await tester.pump();
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
