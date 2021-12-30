import 'package:async/src/abstract_rest.dart';
import 'package:async/src/mock_creator_mixin.dart';
import 'package:async/src/model.dart';

class PersonRestService extends Rest<Person> with MockCreator {
  static final Duration DELAY = Duration(seconds: 1);
  static final PersonRestService _instance = PersonRestService._internal();

  factory PersonRestService() {
    return _instance;
  }

  // private constructor
  PersonRestService._internal();

  @override
  Future<Person> get(String id) =>
      Future.delayed(DELAY).then((id) => generatePerson(id));

  @override
  Future<List<Person>> getAll() =>
      Future.delayed(DELAY).then((_) => generatePersonList());

  @override
  Future<String> delete(String id) => Future.delayed(DELAY)
      .then((id) => "Person with id $id was successfully deleted");

  @override
  Future<Person> create(Person person) =>
      Future.delayed(DELAY).then((person) => createOrUpdatePerson(person));

  @override
  Future<Person> update(Person person) =>
      Future.delayed(DELAY).then((person) => createOrUpdatePerson(person));
}
