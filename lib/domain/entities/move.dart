import 'package:freezed_annotation/freezed_annotation.dart';
import '../value_objects/enums.dart';

part 'move.freezed.dart';

@freezed
abstract class Move with _$Move {
  const factory Move({
    required String id,
    required String name,
    required PokeType type,
    required MoveCategory category,
    int? power,
    int? accuracy,
    required int pp,
    @Default(0) int priority,
    required MoveEffect effect,
    String? description,
  }) = _Move;

}

@freezed
abstract class MoveEffect with _$MoveEffect {
  const factory MoveEffect({
    StatusCondition? inflictStatus,
    @Default(0) int statusChance,
    @Default(<String, int>{}) Map<String, int> statStages,
    @Default(false) bool targetsSelf,
    @Default(0) int healPercent,
    @Default(0) int recoilPercent,
    @Default(1.0) double critRatioBonus,
  }) = _MoveEffect;

}
