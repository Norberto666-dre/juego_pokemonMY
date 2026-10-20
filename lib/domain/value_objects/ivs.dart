import 'package:freezed_annotation/freezed_annotation.dart';

part 'ivs.freezed.dart';

@freezed
abstract class Ivs with _$Ivs {
  const factory Ivs({
    @Default(0) int hp,
    @Default(0) int atk,
    @Default(0) int def,
    @Default(0) int spa,
    @Default(0) int spd,
    @Default(0) int spe,
  }) = _Ivs;
}
