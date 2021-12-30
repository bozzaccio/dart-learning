import 'package:calculator/calculator.dart';
import 'package:test/test.dart';

@TestOn('vm')
void main() {
  final BasicCalculator calculator = new BasicCalculator();
  final int five = 5;
  final int ten = 10;
  final int fift = 15;

  group('Additions operations tests', () {
    test('.add should returns the equals to value', () {
      calculator.add(ten);

      // ignore: invalid_use_of_protected_member
      expect(calculator.getResult(), ten);
    });
    test('.add should returns the result plus new value', () {
      calculator.add(five);

      // ignore: invalid_use_of_protected_member
      expect(calculator.getResult(), fift);
    });
    test('.addMultiple should returns the sum of the input numbers', () {
      calculator.addMultiple(five, ten);

      // ignore: invalid_use_of_protected_member
      expect(calculator.getResult(), fift);
    });
    test('should reset the calculator and return 0', () {
      calculator.reset();

      // ignore: invalid_use_of_protected_member
      expect(calculator.getResult(), 0);
    });
  });

  group('Subtractions operations tests', () {
    test('.remove should returns the negative equals to value', () {
      calculator.remove(ten);

      // ignore: invalid_use_of_protected_member
      expect(calculator.getResult(), -ten);
    });
    test('.removeMultiple should returns the first value minus the second', () {
      calculator.removeMultiple(fift, ten);

      // ignore: invalid_use_of_protected_member
      expect(calculator.getResult(), five);
    });
    test('should reset the calculator and return 0', () {
      calculator.reset();

      // ignore: invalid_use_of_protected_member
      expect(calculator.getResult(), 0);
    });
  });

  group('Multiplications operations tests', () {
    test('.multiply value for clear calculator should returns 0', () {
      calculator.multiply(ten);

      // ignore: invalid_use_of_protected_member
      expect(calculator.getResult(), 0);
    });
    test('.multiply value euqals 1 for 10 should return 10', () {
      calculator.add(1);
      calculator.multiply(ten);

      // ignore: invalid_use_of_protected_member
      expect(calculator.getResult(), ten);
    });
    test(
        '.multiplyMultiple should returns the first value multiplied for second',
        () {
      calculator.multiplyMultiple(fift, ten);

      // ignore: invalid_use_of_protected_member
      expect(calculator.getResult(), 150);
    });
    test('should reset the calculator and return 0', () {
      calculator.reset();

      // ignore: invalid_use_of_protected_member
      expect(calculator.getResult(), 0);
    });
  });

  group('Divisions operations tests', () {
    test('.divide should returns the value after divide for 10', () {
      calculator.add(50);
      calculator.divide(ten);

      // ignore: invalid_use_of_protected_member
      expect(calculator.getResult(), 5);
    });
    test('.divideMultiple should returns the first value divided by the second',
        () {
      calculator.divideMultiple(fift, ten);

      // ignore: invalid_use_of_protected_member
      expect(calculator.getResult(), 1.5);
    });
    test('should reset the calculator and return 0', () {
      calculator.reset();

      // ignore: invalid_use_of_protected_member
      expect(calculator.getResult(), 0);
    });
  });
}
