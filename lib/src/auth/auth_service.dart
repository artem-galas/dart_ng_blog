import 'dart:convert';

import 'package:rxdart/rxdart.dart';
import 'package:dart_jsona/dart_jsona.dart';

import 'package:ng_blog/src/shared/models/constants.dart';
import 'package:ng_blog/src/shared/models/user_model.dart';
import 'package:ng_blog/src/shared/framework/http/http_client.dart';
import 'package:ng_blog/src/shared/framework/http/http_util.dart' as httpUtil;

import 'package:ng_blog/src/shared/services/token_service.dart';

class AuthService {
  final authUrl = 'auth';
  final HttpClient _http;
  final TokenService _tokenService;

  AuthService(this._http, this._tokenService);

  Observable<UserModel> signUp(SignUpRequestModel data) {
    final response = _http
      .post('$apiUrl/${authUrl}/sign_up', body: _decodeRequest(data));

    return Observable
      .fromFuture(response)
      .map((response) {
        httpUtil.throwIfNoSuccess(response);

        return response;
      })
      .map((response) {
        UserTokenModel userTokenModel = UserTokenModel.fromJson(httpUtil.extractResponse(response));
        TokenService.setToken(userTokenModel);

        return userTokenModel;
      })
      .switchMap((token) => this._tokenService.loadUser());
  }

  Observable<UserModel> signIn(SignInRequestModel data) {
    final response = _http
      .post('$apiUrl/${authUrl}/sign_in', body: _decodeRequest(data));

    return Observable
      .fromFuture(response)
      .map((response) {
        httpUtil.throwIfNoSuccess(response);

        return response;
      })
      .map((response) {
        UserTokenModel userTokenModel = UserTokenModel.fromJson(httpUtil.extractResponse(response));
        TokenService.setToken(userTokenModel);

        return userTokenModel;
      })
      .switchMap((token) => this._tokenService.loadUser());
  }

  dynamic _decodeRequest(dynamic body) {
    Jsona jsona = new Jsona();
    body = body.toJson();
    body['type'] = 'auth';

    return json.encode(jsona.serialize(stuff: body));
  }
}
