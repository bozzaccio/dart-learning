import 'package:async/src/model.dart';
import 'package:async/src/person_rest_service.dart';

class Client {
  final PersonRestService personRestService = new PersonRestService();

  Future<HttpResponse<Person>> get(String id) async {
    Person person = await personRestService.get(id);

    HttpResponse<Person> httpResponse = HttpResponseBulder<Person>(person)
        .message("Person retrieved")
        .statusOk()
        .build() as HttpResponse<Person>;

    return Future.value(httpResponse);
  }

  Future<HttpResponse<Person>> post(Person request) async {
    Person person = await personRestService.create(request);

    HttpResponse<Person> httpResponse = HttpResponseBulder<Person>(person)
        .message("Person created")
        .statusOk()
        .build() as HttpResponse<Person>;

    return Future.value(httpResponse);
  }

  Future<HttpResponse<Person>> put(Person request) async {
    Person person = await personRestService.update(request);

    HttpResponse<Person> httpResponse = HttpResponseBulder<Person>(person)
        .message("Person update")
        .statusOk()
        .build() as HttpResponse<Person>;

    return Future.value(httpResponse);
  }

  Future<HttpResponse> delete(String id) async {
    String result = await personRestService.delete(id);

    HttpResponse httpResponse =
        HttpResponseBulder(null).message(result).statusOk().build();

    return Future.value(httpResponse);
  }

  Future<HttpResponse<List<Person>>> getAll() async {
    List<Person> personList = await personRestService.getAll();

    HttpResponse<List<Person>> httpResponse =
        HttpResponseBulder<List<Person>>(personList)
            .message("All person retrieved")
            .statusOk()
            .build() as HttpResponse<List<Person>>;

    return Future.value(httpResponse);
  }
}
