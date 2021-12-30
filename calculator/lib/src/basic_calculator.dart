import 'package:calculator/src/calculator.dart';
import 'package:calculator/src/multiple_value_operation.dart';
import 'package:calculator/src/single_value_operation.dart';

class BasicCalculator extends Calculator<dynamic>
    implements SingleValueOperation<int>, MultipleValueOperation<int> {
  @override
  void add(int value) {
    super.setResult(super.getResult() + value);
  }

  @override
  void divide(int value) {
    super.setResult(super.getResult() / value);
  }

  @override
  void multiply(int value) {
    super.setResult(super.getResult() * value);
  }

  @override
  void remove(int value) {
    super.setResult(super.getResult() - value);
  }

  @override
  void addMultiple(int firstValue, int secondValue) {
    super.setResult(firstValue + secondValue);
  }

  @override
  void divideMultiple(int firstValue, int secondValue) {
    super.setResult(firstValue / secondValue);
  }

  @override
  void multiplyMultiple(int firstValue, int secondValue) {
    super.setResult(firstValue * secondValue);
  }

  @override
  void removeMultiple(int firstValue, int secondValue) {
    super.setResult(firstValue - secondValue);
  }
}
