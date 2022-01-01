import 'dart:io';

import 'package:cli/cli.dart';
import 'package:cli/command.dart';
import 'package:cli/file_manager.dart';

void main(List<String> arguments) async {
  FileCli.banner();
  FileCli.commands();
  FileManager fileManager = FileManager();

  while (true) {
    String? input = stdin.readLineSync();
    if (input == null) {
      print("Invalid command");
    } else {
      List<String> inputList = input.split(" ");
      String commandInput = inputList[0];

      if (CommandExtension.exist(commandInput)) {
        Command command = CommandExtension.getEnumValue(commandInput);
        if (command == Command.exit) {
          exit(0);
        }

        if (inputList[1].isEmpty) {
          print("Name cannot be null!");
        } else {
          switch (command) {
            case Command.classf:
              await fileManager.createClassFile(inputList[1]);
              break;
            case Command.mainf:
              await fileManager.createMainFile(inputList[1]);
              break;
            case Command.testf:
              await fileManager.createTestFile(inputList[1]);
              break;
            default:
              break;
          }
        }
      }
    }

    FileCli.commands();
  }
}
