import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokemon_card_slot_battle/core/random/rng.dart';
import 'package:pokemon_card_slot_battle/domain/value_objects/enums.dart';
import 'package:pokemon_card_slot_battle/features/slot/domain/slot_engine.dart';

class SlotScreen extends ConsumerStatefulWidget {
  const SlotScreen({super.key});
  @override
  ConsumerState<SlotScreen> createState() => _SlotScreenState();
}

class _SlotScreenState extends ConsumerState<SlotScreen> {
  SlotSpin? _last;
  bool _spinning = false;

  SlotConfig get _config => SlotConfig(
        outcomeWeights: const {
          SlotOutcome.match2: 0.70,
          SlotOutcome.match3: 0.08,
          SlotOutcome.miss: 0.22,
        },
        symbols: const [
          SlotSymbol(id: 'Pikachu', rarity: Rarity.common, weight: 60),
          SlotSymbol(id: 'Charmander', rarity: Rarity.uncommon, weight: 28),
          SlotSymbol(id: 'Bulbasaur', rarity: Rarity.rare, weight: 10),
        ],
      );

  Future<void> _spin() async {
    setState(() => _spinning = true);
    await Future.delayed(const Duration(milliseconds: 800));
    final engine =
        SlotEngine(_config, SeededRng(DateTime.now().millisecondsSinceEpoch));
    final result = engine.spin();
    setState(() {
      _last = result;
      _spinning = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tragaperras')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_spinning
                ? 'Girando...'
                : (_last == null ? 'Pulsa girar' : _last!.outcome.name)),
            const SizedBox(height: 16),
            if (_last != null)
              Text(_last!.centerLine.map((s) => s.id).join(' | ')),
            const SizedBox(height: 24),
            FilledButton(
                onPressed: _spinning ? null : _spin,
                child: const Text('Girar')),
          ],
        ),
      ),
    );
  }
}
