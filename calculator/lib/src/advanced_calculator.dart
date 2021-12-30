import 'package:calculator/src/basic_calculator.dart';

import 'dart:math';

class AdvancedCalculator extends BasicCalculator {
  sr(double value) {
    setResult(sqrt(value));
  }

  pow2(double value) {
    setResult(pow(value, 2));
  }

  percent(double value, double of) {
    setResult((value / 100) * of);
  }
}
