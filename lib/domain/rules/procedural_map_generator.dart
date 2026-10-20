import '../../core/random/rng.dart';
import '../../domain/entities/maze_node.dart';
import '../../domain/value_objects/enums.dart';

class ProceduralMapGenerator {
  ProceduralMapGenerator({this.layersPerSegment = 10});
  final int layersPerSegment;

  List<MazeNode> generateSegment({required int runSeed, required int segment}) {
    final rng = SeededRng(Object.hash(runSeed, segment));
    final startDepth = segment * layersPerSegment;
    final nodes = <MazeNode>[];
    for (var layer = 0; layer < layersPerSegment; layer++) {
      final depth = startDepth + layer;
      final width = 1 + rng.nextInt(3);
      for (var lane = 0; lane < width; lane++) {
        nodes.add(MazeNode(
          id: 'n${depth}_$lane',
          depth: depth,
          lane: lane,
          type: NodeType.battle,
          biome: Biome.forest,
          nextIds: const [],
        ));
      }
    }
    return nodes;
  }
}
