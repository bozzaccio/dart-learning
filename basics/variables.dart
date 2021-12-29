// ignore_for_file: unnecessary_null_comparison

void main(List<String> args) {
  const String sameValue = "Values cannot change";
  _printer(sameValue);

  var valueCanCange = "My Variable Assignment";

  _printer(valueCanCange);

  valueCanCange = "Changed!!!";

  _printer(valueCanCange);

  dynamic dynamicValue = "Before im a String";

  _printer(dynamicValue);

  dynamicValue = 99;

  print(dynamicValue);

  if (dynamicValue is int) {
    print("Numeric Value!");
  }

  _printer(dynamicValue);
}

void _printer(value) {
  print(
      value.toString() + " - variable type : " + value.runtimeType.toString());
}
