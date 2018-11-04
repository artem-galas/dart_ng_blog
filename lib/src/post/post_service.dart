import 'package:http/http.dart';
import 'package:rxdart/rxdart.dart';

import 'package:ng_blog/src/shared/models/post_model.dart';
import 'package:ng_blog/src/shared/models/constants.dart';
import 'package:ng_blog/src/shared/framework/http/http_util.dart' as httpUtil;

class PostService {
  static final _postUrl = 'posts';
  final Client _http;

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
}
