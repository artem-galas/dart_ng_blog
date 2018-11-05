import 'dart:convert';

import 'package:rxdart/rxdart.dart';
import 'package:dart_jsona/dart_jsona.dart';

import 'package:ng_blog/src/shared/models/post_model.dart';
import 'package:ng_blog/src/shared/models/constants.dart';
import 'package:ng_blog/src/shared/framework/http/http_client.dart';
import 'package:ng_blog/src/shared/framework/http/http_util.dart' as httpUtil;

class PostService {
  static final _postUrl = 'posts';
  final HttpClient _http;

  PostService(this._http);

  Observable<List<PostModel>> getPosts() {
    final response = _http.get('${apiUrl}/${_postUrl}');

    return Observable
      .fromFuture(response)
      .map((response) {
        httpUtil.throwIfNoSuccess(response);

        return (httpUtil.extractResponse(response) as List)
            .map((value) => PostModel.fromJson(value))
            .toList();
      });
  }

  Observable<PostModel> createPost(PostModel data) {
    final response = _http.post('${apiUrl}/posts', body: _decodeRequest(data));

    return Observable
      .fromFuture(response)
      .map((response) {
        httpUtil.throwIfNoSuccess(response);

        return PostModel.fromJson(httpUtil.extractResponse(response));
    });
  }

  dynamic _decodeRequest(dynamic body) {
    Jsona jsona = new Jsona();
    body = body.toJson();
    body['type'] = 'post';

    return json.encode(jsona.serialize(stuff: body));
  }
}
