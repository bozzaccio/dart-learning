import 'dart:io';

void main(List<String> args) {
  stdout.writeln("Add your age: ");

  final String? ageString = stdin.readLineSync();
  int age;

  try {
    age = int.parse(ageString!);
  } on FormatException {
    age = 0;
  }

  if (age == 0)
    print("Age Error! not valid input");
  else
    print("Your age is $age");
}
