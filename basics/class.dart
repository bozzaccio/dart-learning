import 'dart:io';
import 'package:intl/intl.dart';

class InvalidActivityException implements Exception {
  String cause;
  InvalidActivityException(this.cause);
}

class Activity {
  static final DateFormat formatter = DateFormat('yyyy-MM-dd');

  String name;
  String time;
  DateTime _creationTime;

  Activity(String name) {
    this.name = name;
    this._creationTime = DateTime.now();
    this.time = Activity.formatter.format(this._creationTime);
  }

  static bool isValid(Activity activity) {
    return activity.name != "";
  }

  @override
  String toString() {
    return "You do $name on $time";
  }
}

class Diary {
  static final printerKey = 0;

  final List<Activity> _activityList = [];

  List<Activity> get activities {
    return this._activityList;
  }

  void addActivity(Activity activity) {
    if (Activity.isValid(activity))
      this._activityList.add(activity);
    else
      throw new InvalidActivityException(
          "Activity named " + activity.name + " have some errors");
  }
}

void main(List<String> args) {
  stdout.writeln("==== DART DIARY ====");
  stdout.writeln("Write your activities");
  stdout.writeln("type " + Diary.printerKey.toString() + " to stop....");

  Diary diary = new Diary();

  while (true) {
    stdout.writeln("Add your activity to diary: ");

    final String activity = stdin.readLineSync();

    if (activity == Diary.printerKey.toString()) {
      break;
    }

    diary.activities.add(new Activity(activity));
  }

  if (diary.activities.length > 0) {
    diary.activities.forEach((element) => print(element.toString()));
  } else {
    print("No activities was saved..");
  }
}
