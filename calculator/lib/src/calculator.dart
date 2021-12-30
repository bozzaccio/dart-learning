import 'package:meta/meta.dart';

abstract class Calculator<T> {
  T _result;

  void reset() {
    this._result = null;
  }

  @protected
  void setResult(T value) {
    this._result = value;
  }

  @protected
  T getResult() {
    return this._result != null ? this._result : 0;
  }
}
