import 'dart:async';

import 'package:http/http.dart' as http;

import 'package:ng_blog/src/shared/services/token_service.dart';

class HttpClient extends http.BaseClient {
  final http.Client _inner;

  HttpClient(this._inner);

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers['Content-Type'] = 'application/json';
    if (TokenService.getToken() != null) {
      request.headers['Authorization'] = 'Bearer ${TokenService.getToken()}';
    }

    return _inner.send(request);
  }
}
