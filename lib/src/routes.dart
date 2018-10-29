import 'package:angular_router/angular_router.dart';

import 'route_paths.dart';

import 'home/home_component.template.dart' as home_template;

import 'auth/sign_in/sign_in_component.template.dart' as auth_sign_in_template;
import 'auth/sign_up/sign_up_component.template.dart' as auth_sign_up_template;

import 'post/post_detail/post_detail_component.template.dart' as post_detail_template;
import 'post/post_index/post_index_component.template.dart' as post_index_template;
import 'post/post_overview/post_overview_component.template.dart' as post_overview_template;

import 'profile/profile_component.template.dart' as profile_overview_template;

import 'not_found/not_found_component.template.dart' as not_found_template;

export 'route_paths.dart';

class Routes {
  static final home = RouteDefinition(
      routePath: RoutePaths.home,
      component: home_template.HomeComponentNgFactory,
      useAsDefault: true
  );

  static final auth_sign_in = RouteDefinition(
      routePath: RoutePaths.auth_sign_in,
      component: auth_sign_in_template.SignInComponentNgFactory
  );

  static final auth_sign_up = RouteDefinition(
      routePath: RoutePaths.auth_sign_up,
      component: auth_sign_up_template.SignUpComponentNgFactory
  );

  static final posts_index = RouteDefinition(
      routePath: RoutePaths.posts_index,
      component: post_index_template.PostIndexComponentNgFactory
  );

  static final posts_overview = RouteDefinition(
      routePath: RoutePaths.posts_overview,
      component: post_overview_template.PostOverviewComponentNgFactory
  );

  static final posts_detail = RouteDefinition(
      routePath: RoutePaths.posts_detail,
      component: post_detail_template.PostDetailComponentNgFactory,
  );

  static final posts_create = RouteDefinition(
      routePath: RoutePaths.posts_create,
      component: post_detail_template.PostDetailComponentNgFactory,
  );

  static final profile = RouteDefinition(
      routePath: RoutePaths.profile,
      component: profile_overview_template.ProfileComponentNgFactory
  );

  static final all = <RouteDefinition> [
    home,
    auth_sign_in,
    auth_sign_up,
    posts_index,
    posts_overview,
    posts_detail,
    posts_create,
    profile,
    RouteDefinition(
      path: '.+',
      component: not_found_template.NotFoundComponentNgFactory,
    ),
  ];
}
