import 'dart:mirrors';
import 'lib/calculator.dart';

void main(List<String> args) {
  final ClassMirror basic = reflectClass(BasicCalculator);

  basic.declarations.values.forEach((element) {
    MethodMirror method = element;
    method.metadata.forEach((InstanceMirror annotation) {
      if (annotation.type.simpleName == new Symbol("NotNull")) {
        method.parameters.forEach((parameter) {
          print(parameter);
        });
      }
    });
  });
}
