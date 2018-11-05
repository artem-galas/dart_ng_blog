import 'dart:html';

import 'package:rxdart/rxdart.dart';

import 'package:ng_blog/src/shared/models/user_model.dart';
import 'package:ng_blog/src/shared/models/constants.dart';
import 'package:ng_blog/src/shared/framework/http/http_client.dart';
import 'package:ng_blog/src/shared/framework/http/http_util.dart' as httpUtil;

class TokenService {
  HttpClient _http;
  BehaviorSubject<UserModel> currentUser$ = BehaviorSubject(seedValue: null);

  TokenService(this._http) {
    if (getToken() != null) {
      loadUser()
        .listen(null);
    }
  }

  static void setToken(UserTokenModel token) {
    window.localStorage[ngTokenKey] = token.authToken;
  }

  static String getToken() {
    return window.localStorage[ngTokenKey];
  }

  void removeToken() {
    currentUser$.add(null);
    window.localStorage.remove(ngTokenKey);
  }

  Observable<UserModel> loadUser() {
    final response = _http.get('$apiUrl/auth/load_user');

    return Observable
      .fromFuture(response)
      .map((response){
        httpUtil.throwIfNoSuccess(response);

        return UserModel.fromJson(httpUtil.extractResponse(response));
      })
      .map((user) {
        currentUser$.add(user);

        return user;
      });
  }

  bool isLoggedIn() {
    bool isLoggedIn = currentUser$.value != null ? true : false;

    return isLoggedIn;
  }
}
