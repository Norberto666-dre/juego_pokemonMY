import 'package:freezed_annotation/freezed_annotation.dart';
import '../value_objects/enums.dart';

part 'item.freezed.dart';

@freezed
abstract class Item with _$Item {
  const factory Item({
    required String id,
    required String name,
    required ItemCategory category,
    required String description,
    required int price,
    int? gemPrice,
    required ItemEffect effect,
    @Default(99) int maxStack,
  }) = _Item;

}

@freezed
abstract class ItemEffect with _$ItemEffect {
  const factory ItemEffect({
    @Default(0) int healHp,
    @Default(0) double ballMultiplier,
    @Default(0) int evGain,
    @Default('') String stat,
    @Default(0) int xStatStages,
    String? evolutionItemId,
  }) = _ItemEffect;

}
