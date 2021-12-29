import 'package:calculator/src/calculator.dart';
import 'package:calculator/src/multiple_value_operation.dart';
import 'package:calculator/src/not_null.dart';
import 'package:calculator/src/single_value_operation.dart';

import 'not_null_helper.dart';

class BasicCalculator extends Calculator<dynamic>
    with NotNullHelper
    implements SingleValueOperation<int>, MultipleValueOperation<int> {
  @NotNull()
  @override
  void add(int value) {
    this.result = this.result + value;
  }

  @override
  void divide(int value) {
    this.result = this.result / value;
  }

  @override
  void multiply(int value) {
    this.result = this.result * value;
  }

  @override
  void remove(int value) {
    this.result = this.result - value;
  }

  @override
  void addMultiple(int firstValue, int secondValue) {
    this.result = firstValue + secondValue;
  }

  @override
  void divideMultiple(int firstValue, int secondValue) {
    this.result = firstValue / secondValue;
  }

  @override
  void multiplyMultiple(int firstValue, int secondValue) {
    this.result = firstValue * secondValue;
  }

  @override
  void removeMultiple(int firstValue, int secondValue) {
    this.result = firstValue - secondValue;
  }
}
