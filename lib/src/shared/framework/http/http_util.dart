import 'dart:convert';

import 'package:http/http.dart';
import 'package:dart_jsona/dart_jsona.dart';

class HttpException implements Exception {
  HttpException(this.response);

  Response response;
}

dynamic extractResponse(Response resp) {
  Jsona jsona = new Jsona();

  return jsona.deserialize(json.decode(resp.body));
}

void throwIfNoSuccess(Response response) {
  if(response.statusCode < 200 || response.statusCode > 299) {
    throw new HttpException(response);
  }
}
