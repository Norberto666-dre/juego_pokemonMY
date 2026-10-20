import 'dart:math';

abstract interface class Rng {
  int nextInt(int max);
  double nextDouble();
  bool chance(double p) => nextDouble() < p;
  T pick<T>(List<T> items) => items[nextInt(items.length)];
  Rng fork(int salt);
}

class SecureRng implements Rng {
  final Random _r = Random.secure();
  @override int nextInt(int max) => _r.nextInt(max);
  @override double nextDouble() => _r.nextDouble();
  @override bool chance(double p) => nextDouble() < p;
  @override T pick<T>(List<T> items) => items[nextInt(items.length)];
  @override Rng fork(int salt) => SeededRng(_r.nextInt(1 << 31) ^ salt);
}

class SeededRng implements Rng {
  SeededRng(int seed) : _r = Random(seed);
  final Random _r;
  @override int nextInt(int max) => _r.nextInt(max);
  @override double nextDouble() => _r.nextDouble();
  @override bool chance(double p) => nextDouble() < p;
  @override T pick<T>(List<T> items) => items[nextInt(items.length)];
  @override Rng fork(int salt) => SeededRng(_r.nextInt(1 << 31) ^ salt);
}
