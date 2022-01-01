import 'command.dart';

class FileCli {
  static void banner() {
    print("""
██████╗  █████╗ ██████╗ ████████╗     ██████╗██╗     ██╗
██╔══██╗██╔══██╗██╔══██╗╚══██╔══╝    ██╔════╝██║     ██║
██║  ██║███████║██████╔╝   ██║       ██║     ██║     ██║
██║  ██║██╔══██║██╔══██╗   ██║       ██║     ██║     ██║
██████╔╝██║  ██║██║  ██║   ██║       ╚██████╗███████╗██║
╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝        ╚═════╝╚══════╝╚═╝
  """);
  }

  static void commands() {
    for (Command command in Command.values) {
      CommandDetail? commandDetail = command.detail;

      if (commandDetail != null) commandDetail.prettyPrint();
    }
  }
}
