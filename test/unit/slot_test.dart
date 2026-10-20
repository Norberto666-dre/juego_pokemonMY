import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon_card_slot_battle/features/slot/domain/slot_engine.dart';
import 'package:pokemon_card_slot_battle/domain/value_objects/enums.dart';
import 'package:pokemon_card_slot_battle/core/random/rng.dart';

void main() {
  test('slot deterministic with seed', () {
    final cfg = SlotConfig(
      outcomeWeights: {
        SlotOutcome.match2: 0.7,
        SlotOutcome.match3: 0.08,
        SlotOutcome.miss: 0.22
      },
      symbols: [
        const SlotSymbol(id: 'a', rarity: Rarity.common, weight: 1),
        const SlotSymbol(id: 'b', rarity: Rarity.rare, weight: 1)
      ],
    );
    final e1 = SlotEngine(cfg, SeededRng(7));
    final e2 = SlotEngine(cfg, SeededRng(7));
    expect(e1.spin().outcome, e2.spin().outcome);
  });
}
