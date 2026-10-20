import '../value_objects/stats.dart';
import '../value_objects/nature.dart';
import '../entities/creature_species.dart';
import '../entities/creature_instance.dart';

class StatCalculator {
  static int hp(int base, int iv, int ev, int level) =>
      ((2 * base + iv + (ev ~/ 4)) * level ~/ 100) + level + 10;

  static int other(int base, int iv, int ev, int level, double natureMod) =>
      ((((2 * base + iv + (ev ~/ 4)) * level ~/ 100) + 5) * natureMod).floor();

  static double natureModifier(Nature n, String stat) {
    // Simplificado: neutras por defecto
    return 1.0;
  }

  static Stats compute(CreatureSpecies s, CreatureInstance c) {
    return Stats(
      hp: hp(s.baseStats.hp, c.ivs.hp, c.evs.hp, c.level),
      atk: other(s.baseStats.atk, c.ivs.atk, c.evs.atk, c.level, natureModifier(c.nature, 'atk')),
      def: other(s.baseStats.def, c.ivs.def, c.evs.def, c.level, natureModifier(c.nature, 'def')),
      spa: other(s.baseStats.spa, c.ivs.spa, c.evs.spa, c.level, natureModifier(c.nature, 'spa')),
      spd: other(s.baseStats.spd, c.ivs.spd, c.evs.spd, c.level, natureModifier(c.nature, 'spd')),
      spe: other(s.baseStats.spe, c.ivs.spe, c.evs.spe, c.level, natureModifier(c.nature, 'spe')),
    );
  }
}
