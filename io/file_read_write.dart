import 'dart:async';
import 'dart:convert';
import 'dart:io';

void main(List<String> args) async {
  if (args.isEmpty || args[0].isEmpty) {
    throw FileNameNotFoundException("invalid file name input..");
  }

  final String filename = args[0];
  final File file = File(filename);

  if (await file.exists()) {
    List<String> fileLines = [];

    StreamSubscription subscription = file
        .openRead()
        .transform(utf8.decoder)
        .transform(LineSplitter())
        .listen((String line) => {print(line), fileLines.add(line)});

    subscription.onDone(() {
      print("total lines readed " + fileLines.length.toString());
      fileLines.forEach((line) =>
          file.writeAsStringSync("$line edited \n", mode: FileMode.append));
    });
  } else {
    throw FileNameNotFoundException("file not found...");
  }
}

class FileNameNotFoundException implements Exception {
  String cause;
  FileNameNotFoundException(this.cause);

  @override
  String toString() {
    return "$cause";
  }
}
