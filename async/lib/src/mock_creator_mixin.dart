import 'package:faker/faker.dart';
import 'model.dart' as model;

mixin MockCreator {
  Faker faker = new Faker();

  model.Person generatePerson([String? id]) => new model.Person(
      id != null && id.isNotEmpty ? id : faker.guid.guid(),
      faker.person.firstName(),
      faker.person.lastName(),
      faker.phoneNumber.us(),
      faker.job.title(),
      faker.company.name());

  List<model.Person> generatePersonList() {
    List<model.Person> personList = List.empty(growable: true);

    for (int i = 0; i < faker.randomGenerator.integer(15, min: 1); i++) {
      personList.add(generatePerson());
    }

    return personList;
  }

  model.Person createOrUpdatePerson(model.Person person) => new model.Person(
      person.id.isNotEmpty ? person.id : faker.guid.guid(),
      person.name.isNotEmpty ? person.name : faker.person.firstName(),
      person.surname.isNotEmpty ? person.surname : faker.person.lastName(),
      person.phoneNumber.isNotEmpty
          ? person.phoneNumber
          : faker.phoneNumber.us(),
      person.job.isNotEmpty ? person.job : faker.job.title(),
      person.company.isNotEmpty ? person.company : faker.company.name());
}
