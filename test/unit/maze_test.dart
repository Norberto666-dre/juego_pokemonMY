import 'package:flutter_test/flutter_test.dart';
import 'package:pokemon_card_slot_battle/domain/rules/procedural_map_generator.dart';

void main() {
  test('segment generates nodes', () {
    final gen = ProceduralMapGenerator();
    final nodes = gen.generateSegment(runSeed: 1, segment: 0);
    expect(nodes, isNotEmpty);
  });
}
