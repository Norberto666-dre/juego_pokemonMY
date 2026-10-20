import 'package:freezed_annotation/freezed_annotation.dart';
import '../value_objects/enums.dart';

part 'card_action.freezed.dart';

enum CardKind { attack, status, item, defense }

@freezed
abstract class CardAction with _$CardAction {
  const factory CardAction({
    required String id,
    required String name,
    required CardKind kind,
    required int energyCost,
    required Rarity rarity,
    String? moveId,
    String? itemId,
    @Default(0) int priority,
    @Default(1) int usesPerBattle,
    String? artUrl,
    String? tcgCardId,
    @Default(1) int level,
  }) = _CardAction;

}
