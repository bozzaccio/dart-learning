import 'package:async_learn/async.dart';
import 'package:test/test.dart';

@TestOn('vm')
void main() {
  final String personId = "1";

  Client httpClient = Client();

  test(
      'test client get method, should return and httpResponse with Person',
      () => httpClient.get(personId).then((HttpResponse response) => {
            expect(response.status, 200),
            expect(response.message, "Person retrieved"),
            expect(response.payload.runtimeType, Person),
            expect((response.payload as Person).id, personId)
          }));

  test(
      'test client getAll method, should return and httpResponse with a list of Person',
      () => httpClient.getAll().then((HttpResponse response) => {
            expect(response.status, 200),
            expect(response.message, "All person retrieved"),
            expect(response.payload.runtimeType, PersonList),
            expect((response.payload as PersonList).length > 0, true)
          }));

  test(
      'test client delete method, should return null payload',
      () => httpClient.delete(personId).then((HttpResponse response) => {
            expect(response.status, 200),
            expect(response.message,
                "Person with id $personId was successfully deleted"),
            expect(response.payload, null),
          }));

  test('test create person, should return the same data', () {
    Person person = new Person(
        personId, "name", "surname", "phoneNumber", "job", "company");

    httpClient.post(person).then((HttpResponse response) => {
          expect(response.status, 200),
          expect(response.message, "Person created"),
          expect(response.payload.runtimeType, Person),
          expect((response.payload as Person).id, personId),
          expect((response.payload as Person).name, "name"),
          expect((response.payload as Person).surname, "surname"),
          expect((response.payload as Person).company, "company"),
        });
  });

  test('test update person', () async {
    final HttpResponse<Person> httpResponse = await httpClient.get(personId);
    final Person person = httpResponse.payload as Person;
    person.name = "newName";
    // reset phone number for coverage
    person.phoneNumber = "";

    httpClient.put(person).then((HttpResponse response) => {
          expect(response.status, 200),
          expect(response.message, "Person update"),
          expect(response.payload.runtimeType, Person),
          expect((response.payload as Person).id, personId),
          expect((response.payload as Person).name, "newName"),
          expect((response.payload as Person).phoneNumber, isNot(equals(""))),
        });
  });
}
