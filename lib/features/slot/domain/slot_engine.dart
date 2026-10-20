import '../../../core/random/rng.dart';
import '../../../domain/value_objects/enums.dart';

class SlotSymbol {
  const SlotSymbol({required this.id, required this.rarity, required this.weight});
  final String id;
  final Rarity rarity;
  final double weight;
}

class SlotConfig {
  const SlotConfig({
    this.reelCount = 3,
    this.symbolsPerReel = 10,
    required this.outcomeWeights,
    required this.symbols,
  });
  final int reelCount, symbolsPerReel;
  final Map<SlotOutcome, double> outcomeWeights;
  final List<SlotSymbol> symbols;
}

class SlotSpin {
  const SlotSpin({required this.outcome, required this.centerLine});
  final SlotOutcome outcome;
  final List<SlotSymbol> centerLine;
}

class SlotEngine {
  SlotEngine(this.config, this.rng);
  final SlotConfig config;
  final Rng rng;

  SlotSpin spin() {
    final outcome = rng.weighted(config.outcomeWeights);
    final winner = rng.pick(config.symbols);
    final other = config.symbols.firstWhere((s) => s.id != winner.id, orElse: () => winner);
    final center = switch (outcome) {
      SlotOutcome.match3 => [winner, winner, winner],
      SlotOutcome.match2 => [winner, winner, other],
      SlotOutcome.miss => [config.symbols[0], config.symbols[1 % config.symbols.length], config.symbols[2 % config.symbols.length]],
    };
    return SlotSpin(outcome: outcome, centerLine: center);
  }
}

extension _Weighted on Rng {
  T weighted<T>(Map<T, double> weights) {
    final total = weights.values.fold<double>(0, (a, b) => a + b);
    var roll = nextDouble() * total;
    for (final e in weights.entries) {
      roll -= e.value;
      if (roll < 0) return e.key;
    }
    return weights.keys.last;
  }
}
