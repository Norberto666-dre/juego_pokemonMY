import '../../core/random/rng.dart';
import '../value_objects/enums.dart';
import 'type_chart.dart';

class DamageInput {
  DamageInput({
    required this.attackerLevel,
    required this.power,
    required this.attack,
    required this.defense,
    required this.moveType,
    required this.attackerTypes,
    required this.defenderTypes,
    this.critical = false,
    this.burnedPhysical = false,
    this.weather = 1.0,
    this.other = 1.0,
  });
  final int attackerLevel, power, attack, defense;
  final PokeType moveType;
  final List<PokeType> attackerTypes, defenderTypes;
  final bool critical, burnedPhysical;
  final double weather, other;
}

class DamageResult {
  const DamageResult(this.damage, this.multiplier, this.critical);
  final int damage;
  final double multiplier;
  final bool critical;
}

class DamageCalculator {
  DamageCalculator(this.chart, this.rng);
  final TypeChart chart;
  final Rng rng;

  DamageResult calculate(DamageInput i) {
    final base =
        ((((2 * i.attackerLevel) ~/ 5 + 2) * i.power * i.attack ~/ i.defense) ~/
                50) +
            2;
    final stab = i.attackerTypes.contains(i.moveType) ? 1.5 : 1.0;
    final eff = chart.against(i.moveType, i.defenderTypes);
    final crit = i.critical ? 1.5 : 1.0;
    final burn = i.burnedPhysical ? 0.5 : 1.0;
    final rand = 0.85 + rng.nextDouble() * 0.15;
    final total = base * i.weather * crit * rand * stab * eff * burn * i.other;
    return DamageResult(
        eff == 0 ? 0 : total.floor().clamp(1, 1 << 30), eff, i.critical);
  }
}
