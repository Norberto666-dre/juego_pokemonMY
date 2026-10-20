import 'package:freezed_annotation/freezed_annotation.dart';

part 'stats.freezed.dart';

@freezed
abstract class Stats with _$Stats {
  const factory Stats({
    required int hp,
    required int atk,
    required int def,
    required int spa,
    required int spd,
    required int spe,
  }) = _Stats;
}
