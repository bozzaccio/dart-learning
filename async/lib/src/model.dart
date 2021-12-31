import 'dart:io';

typedef PersonList = List<Person>;

class Person {
  String id;
  String name;
  String surname;
  String phoneNumber;
  String job;
  String company;

  Person(this.id, this.name, this.surname, this.phoneNumber, this.job,
      this.company);
}

class HttpResponse<T> {
  T? payload;
  String message;
  int status;

  HttpResponse(this.payload, this.message, this.status);

  HttpResponse._builder(HttpResponseBuilder<T> builder)
      : payload = builder.p,
        message = builder.m,
        status = builder.s;
}

class HttpResponseBuilder<T> {
  T? p;
  late String m;
  late int s;

  HttpResponseBuilder(this.p);

  HttpResponseBuilder message(String message) {
    m = message;
    return this;
  }

  HttpResponseBuilder status(int status) {
    s = status;
    return this;
  }

  HttpResponseBuilder statusOk() {
    s = HttpStatus.ok;
    return this;
  }

  HttpResponseBuilder badRequest() {
    s = HttpStatus.badRequest;
    return this;
  }

  HttpResponse<T> build() {
    return HttpResponse<T>._builder(this);
  }
}
