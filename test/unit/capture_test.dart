import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon_card_slot_battle/domain/rules/capture_calculator.dart';
import 'package:pokemon_card_slot_battle/core/random/rng.dart';

void main() {
  test('capture probability higher at low HP', () {
    final rng = SeededRng(1);
    final calc = CaptureCalculator(rng);
    final high = calc.modifiedRate(CaptureInput(maxHp: 100, currentHp: 100, captureRate: 45, ballMultiplier: 1));
    final low = calc.modifiedRate(CaptureInput(maxHp: 100, currentHp: 5, captureRate: 45, ballMultiplier: 1));
    expect(low, greaterThan(high));
  });
  test('master ball always captures', () {
    final rng = SeededRng(2);
    final calc = CaptureCalculator(rng);
    final r = calc.attempt(CaptureInput(maxHp: 100, currentHp: 100, captureRate: 45, ballMultiplier: 1), masterBall: true);
    expect(r.caught, isTrue);
  });
}
