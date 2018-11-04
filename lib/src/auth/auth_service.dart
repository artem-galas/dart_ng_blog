import 'dart:convert';

import 'package:http/http.dart';
import 'package:rxdart/rxdart.dart';
import 'package:dart_jsona/dart_jsona.dart';

import 'package:ng_blog/src/shared/models/constants.dart';
import 'package:ng_blog/src/shared/models/user_model.dart';
import 'package:ng_blog/src/shared/framework/http/http_util.dart' as httpUtil;

class AuthService {
  final authUrl = 'auth';
  final Client _http;

  AuthService(this._http);

  Observable<UserTokenModel> signUp(SignUpRequestModel data) {
    final response = _http
      .post('$apiUrl/${authUrl}/sign_up', body: _decodeRequest(data),
        headers: {
        'Content-Type': 'application/json'
      });

    return Observable
      .fromFuture(response)
      .map((response) {
        httpUtil.throwIfNoSuccess(response);

        return UserTokenModel.fromJson(httpUtil.extractResponse(response));
      });
  }

  Observable<UserTokenModel> signIn(SignInRequestModel data) {
    final response = _http
        .post('$apiUrl/${authUrl}/sign_in', body: _decodeRequest(data),
        headers: {
          'Content-Type': 'application/json'
        });

    return Observable
      .fromFuture(response)
      .map((response) {
        httpUtil.throwIfNoSuccess(response);

        return UserTokenModel.fromJson(httpUtil.extractResponse(response));
      });
  }

  dynamic _decodeRequest(dynamic body) {
    Jsona jsona = new Jsona();
    body = body.toJson();
    body['type'] = 'auth';

    return json.encode(jsona.serialize(stuff: body));
  }
}
