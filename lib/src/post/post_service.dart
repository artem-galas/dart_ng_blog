import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';
import 'package:dart_jsona/dart_jsona.dart';

import 'package:ng_blog/src/shared/models/post_model.dart';
import 'package:ng_blog/src/shared/models/constatns.dart';

class PostService {
  static final _postUrl = 'posts';
  final Client _http;

  PostService(this._http);

  Future<List<PostModel>> getPosts() async {
    try {
      final response = await _http.get('${apiUrl}/${_postUrl}');
      final posts = (_extractResponse(response) as List)
          .map((value) => PostModel.fromJson(value))
          .toList();

      return posts;
    } catch(e) {
      throw _handleError(e);
    }
  }

  _extractResponse(Response response) {
    Jsona jsona = new Jsona();

    return jsona.deserialize(json.decode(response.body));
  }

  Exception _handleError(e) {
    return Exception('Server error; cause: $e');
  }
}
