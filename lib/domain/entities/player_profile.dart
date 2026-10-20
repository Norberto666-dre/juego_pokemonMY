import 'package:freezed_annotation/freezed_annotation.dart';

part 'player_profile.freezed.dart';

@freezed
abstract class PlayerProfile with _$PlayerProfile {
  const factory PlayerProfile({
    required String id,
    required String name,
    required String avatarId,
    required int level,
    required int exp,
    required int coins,
    required int gems,
    required int tokens,
    required int tickets,
    required int elo,
    required int maxDepth,
    required List<String> badges,
    required DateTime createdAt,
  }) = _PlayerProfile;
}
