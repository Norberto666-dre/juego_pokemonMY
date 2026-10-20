sealed class Failure {
  const Failure(this.message);
  final String message;
}

class Result<T> {
  const Result._(this._value, this._failure);
  final T? _value;
  final Failure? _failure;
  bool get isSuccess => _failure == null;
  T get value => _value as T;
  Failure get failure => _failure!;
  static Result<T> success<T>(T v) => Result._(v, null);
  static Result<T> fail<T>(Failure f) => Result._(null, f);
}
