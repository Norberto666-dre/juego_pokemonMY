import 'package:freezed_annotation/freezed_annotation.dart';
import '../value_objects/enums.dart';
import '../value_objects/stats.dart';

part 'creature_species.freezed.dart';

@freezed
abstract class CreatureSpecies with _$CreatureSpecies {
  const factory CreatureSpecies({
    required int id,
    required String name,
    required List<PokeType> types,
    required Stats baseStats,
    required List<String> abilityIds,
    String? hiddenAbilityId,
    required int evolutionChainId,
    required Rarity rarity,
    required int captureRate,
    required int generation,
    required String region,
    required String spriteUrl,
    String? spriteAnimatedUrl,
    @Default(false) bool isLegendary,
    @Default(false) bool isMythical,
    @Default(70) int baseFriendship,
    @Default(GrowthRate.mediumFast) GrowthRate growthRate,
    @Default(60) int baseExp,
  }) = _CreatureSpecies;

}

enum GrowthRate { fast, mediumFast, mediumSlow, slow }
