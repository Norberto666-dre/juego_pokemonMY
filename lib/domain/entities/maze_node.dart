import 'package:freezed_annotation/freezed_annotation.dart';
import '../value_objects/enums.dart';

part 'maze_node.freezed.dart';

@freezed
abstract class MazeNode with _$MazeNode {
  const factory MazeNode({
    required String id,
    required int depth,
    required int lane,
    required NodeType type,
    required Biome biome,
    required List<String> nextIds,
    @Default(false) bool revealed,
    @Default(false) bool visited,
    String? secretTargetId,
  }) = _MazeNode;
}
