import 'dart:core';

enum Command { mainf, classf, testf, exit }

extension CommandExtension on Command {
  static bool exist(String command) {
    return Command.values.map((e) => e.name).contains(command);
  }

  static Command getEnumValue(String command) {
    return Command.values.firstWhere((element) => element.name == command);
  }

  CommandDetail? get detail {
    switch (this) {
      case Command.classf:
        return CommandDetail(
            this, "Create new dart class file", "classf your_class_name");
      case Command.mainf:
        return CommandDetail(
            this, "Create new dart main file", "mainf file_name");
      case Command.testf:
        return CommandDetail(
            this, "Create new dart unit test file", "testf file_name");
      case Command.exit:
        return CommandDetail(this, "Exit from cli", "");
      default:
        return null;
    }
  }
}

class CommandDetail {
  Command command;
  String description;
  String helper;

  CommandDetail(this.command, this.description, this.helper);

  void prettyPrint() {
    String toPrint = command.name.padRight(10, ' ');
    toPrint = toPrint + description.padRight(35, ' ');
    toPrint = toPrint + helper.padRight(25, ' ');
    print(toPrint);
  }

  @override
  String toString() {
    return "$command, $description, $helper";
  }
}
