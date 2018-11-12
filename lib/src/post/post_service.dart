import 'dart:html';
import 'dart:convert';

import 'package:rxdart/rxdart.dart';
import 'package:dart_jsona/dart_jsona.dart';
import 'package:http/http.dart';

import 'package:ng_blog/src/shared/models/post_model.dart';
import 'package:ng_blog/src/shared/models/constants.dart';
import 'package:ng_blog/src/shared/framework/http/http_client.dart';
import 'package:ng_blog/src/shared/framework/http/http_util.dart' as httpUtil;

import 'package:ng_blog/src/shared/services/token_service.dart';

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

  Observable<PostModel> updatePost(PostModel data, String postId) {
    final response = _http.put('${apiUrl}/posts/${postId}', body: _decodeRequest(data));

    return Observable
      .fromFuture(response)
      .map((response) {
        httpUtil.throwIfNoSuccess(response);

        return PostModel.fromJson(httpUtil.extractResponse(response));
    });
  }

  Observable<PostModel> getPost(int postId) {
    final response = _http.get('$apiUrl/$_postUrl/$postId');

    return new Observable
      .fromFuture(response)
      .map((response) {
        httpUtil.throwIfNoSuccess(response);

        return PostModel.fromJson(httpUtil.extractResponse(response));
      });
  }

  Observable<PostModel> addImageToPost(int postId, File image) {
    FormData formData = FormData();
    formData.appendBlob('image', image);

    final request = HttpRequest
      .request(
        '${apiUrl}/posts/${postId}/image',
        method: 'PUT',
        sendData: formData,
        requestHeaders: {
          'Authorization': 'Bearer ${TokenService.getToken()}'
        }
      );

    return Observable
      .fromFuture(request)
      .map((request) {
        var resp = new Response(request.response, request.status);

        httpUtil.throwIfNoSuccess(resp);

        return PostModel.fromJson(httpUtil.extractResponse(resp));
      });
  }

  Observable<List<PostModel>> getMyPosts() {
    final response = _http.get('${apiUrl}/my_${_postUrl}');

    return Observable
      .fromFuture(response)
      .map((response) {
        httpUtil.throwIfNoSuccess(response);

        return (httpUtil.extractResponse(response) as List)
          .map((value) => PostModel.fromJson(value))
          .toList();
      });
  }

  dynamic _decodeRequest(dynamic body) {
    Jsona jsona = new Jsona();
    body = body.toJson();
    body['type'] = 'post';

    return json.encode(jsona.serialize(stuff: body));
  }
}
