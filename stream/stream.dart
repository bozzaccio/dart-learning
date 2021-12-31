import 'dart:async';

import 'dart:io';

void main(List<String> args) {
  StreamController<int> streamController = StreamController<int>();

  late StreamSubscription<int> subscription;

  subscription = secondsGenerator().listen((event) => {
        if (event % 10 == 0)
          {
            subscription.pause(),
            if (continueStreaming())
              {subscription.resume()}
            else
              {subscription.cancel(), print("Stream ending....")}
          },
        streamController.add(event)
      });

  streamController.stream.listen((event) {
    print("Number recieved $event");
  }).onDone(() {
    print("All data was sent, bye bye...");
  });
}

// Open a stream and return an integer every second
Stream<int> secondsGenerator() async* {
  for (int i = 1; i < 60; i++) {
    sleep(Duration(seconds: 1));

    yield i;
  }
}

bool continueStreaming() {
  print("You need more value? Y/N");
  String? input = stdin.readLineSync();

  return input != null && input.toUpperCase() == "Y";
}
