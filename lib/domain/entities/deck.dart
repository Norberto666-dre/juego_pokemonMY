import 'package:freezed_annotation/freezed_annotation.dart';

part 'deck.freezed.dart';

@freezed
abstract class Deck with _$Deck {
  const factory Deck({
    required String id,
    String? creatureUid,
    required String name,
    required List<String> cardIds,
    required DateTime updatedAt,
  }) = _Deck;
}
