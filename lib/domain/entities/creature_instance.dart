import 'package:freezed_annotation/freezed_annotation.dart';
import '../value_objects/enums.dart';
import '../value_objects/ivs.dart';
import '../value_objects/evs.dart';
import '../value_objects/nature.dart';

part 'creature_instance.freezed.dart';

@freezed
abstract class CreatureInstance with _$CreatureInstance {
  const factory CreatureInstance({
    required String uid,
    required int speciesId,
    @Default('') String nickname,
    required int level,
    required int exp,
    required Ivs ivs,
    required Evs evs,
    required Nature nature,
    required String abilityId,
    required List<String> moveIds,
    String? heldItemId,
    @Default(false) bool shiny,
    @Default(70) int friendship,
    @Default(false) bool favorite,
    required DateTime capturedAt,
    @Default('pc') String slotKind,
    int? slotIndex,
    int? currentHp,
    @Default(StatusCondition.none) StatusCondition status,
  }) = _CreatureInstance;

}
