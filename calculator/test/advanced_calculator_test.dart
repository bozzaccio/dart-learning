import 'package:calculator/calculator.dart';
import 'package:test/test.dart';

@TestOn('vm')
void main() {
  final AdvancedCalculator calculator = new AdvancedCalculator();

  // before each test
  setUp(() {
    calculator.reset();
  });

  test('.percent percentage calculation', () {
    calculator.percent(15, 1000);

    expect(calculator.getResult(), 150);
  });

  test('.pow2 calculates the power of 2 of the number', () {
    calculator.pow2(15);

    expect(calculator.getResult(), 225);
  });

  test('.sr calculates the square root the number', () {
    calculator.sr(225);

    expect(calculator.getResult(), 15);
  });
}
