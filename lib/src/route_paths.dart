import 'package:angular_router/angular_router.dart';

const idParam = 'id';

class RoutePaths {
  static final home = RoutePath(path: 'home');

  static final auth_sign_in = RoutePath(path: 'auth/sign_in');
  static final auth_sign_up = RoutePath(path: 'auth/sign_up');

  static final posts_index = RoutePath(path: 'posts/index');
  static final posts_overview = RoutePath(path: 'posts/overview/:$idParam');
  static final posts_detail = RoutePath(path: 'posts/detail/:$idParam');
  static final posts_create = RoutePath(path: 'posts/create');

  static final profile = RoutePath(path: 'profile');
}
