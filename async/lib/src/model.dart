import 'dart:io';

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

  HttpResponse._builder(HttpResponseBulder<T> builder)
      : payload = builder.p,
        message = builder.m,
        status = builder.s;
}

class HttpResponseBulder<T> {
  T? p;
  late String m;
  late int s;

  HttpResponseBulder(this.p);

  HttpResponseBulder message(String message) {
    m = message;
    return this;
  }

  HttpResponseBulder status(int status) {
    s = status;
    return this;
  }

  HttpResponseBulder statusOk() {
    s = HttpStatus.ok;
    return this;
  }

  HttpResponseBulder badRequest() {
    s = HttpStatus.badRequest;
    return this;
  }

  HttpResponse<T> build() {
    return HttpResponse<T>._builder(this);
  }
}
