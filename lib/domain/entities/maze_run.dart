import 'package:freezed_annotation/freezed_annotation.dart';

part 'maze_run.freezed.dart';

@freezed
abstract class MazeRun with _$MazeRun {
  const factory MazeRun({
    required String id,
    required int seed,
    required int currentDepth,
    required String currentNodeId,
    required List<String> visitedNodeIds,
    required List<String> discoveredSecretIds,
    @Default('active') String status,
  }) = _MazeRun;

}
