import 'dart:math';
import '../../core/random/rng.dart';
import '../value_objects/enums.dart';

class CaptureInput {
  CaptureInput({
    required this.maxHp,
    required this.currentHp,
    required this.captureRate,
    required this.ballMultiplier,
    this.status = StatusCondition.none,
    this.timingBonus = 0.0,
    this.isLegendary = false,
  });
  final int maxHp, currentHp, captureRate;
  final double ballMultiplier, timingBonus;
  final StatusCondition status;
  final bool isLegendary;
}

class CaptureResult {
  const CaptureResult({required this.probability, required this.shakes, required this.caught});
  final double probability;
  final int shakes;
  final bool caught;
}

class CaptureCalculator {
  CaptureCalculator(this.rng);
  final Rng rng;

  double statusBonus(StatusCondition s) => switch (s) {
        StatusCondition.sleep || StatusCondition.freeze => 2.0,
        StatusCondition.paralysis || StatusCondition.poison || StatusCondition.burn => 1.5,
        _ => 1.0,
      };

  double modifiedRate(CaptureInput i) {
    final a = ((3 * i.maxHp - 2 * i.currentHp) * i.captureRate * i.ballMultiplier) /
        (3 * i.maxHp) * statusBonus(i.status);
    return a.clamp(1.0, 255.0);
  }

  CaptureResult attempt(CaptureInput i, {bool masterBall = false}) {
    if (masterBall) return const CaptureResult(probability: 1, shakes: 3, caught: true);
    final a = modifiedRate(i);
    final b = 1048560 / sqrt(sqrt(16711680 / a));
    var p = (b / 65536).clamp(0.0, 1.0);
    p = (p + i.timingBonus).clamp(0.0, 1.0);
    var shakes = 0;
    for (var k = 0; k < 4; k++) {
      if (rng.chance(p)) {
        shakes++;
      } else {
        break;
      }
    }
    return CaptureResult(probability: pow(p, 4).toDouble(), shakes: shakes.clamp(0, 3), caught: shakes >= 4);
  }
}
