import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'package:angular_components/material_button/material_button.dart';
import 'package:angular_components/material_icon/material_icon.dart';
import 'package:angular_components/material_input/material_input.dart';

import 'package:ng_blog/src/shared/models/user_model.dart';
import 'package:ng_blog/src/shared/models/post_model.dart';
import 'package:ng_blog/src/shared/services/token_service.dart';
import 'package:ng_blog/src/shared/components/post/post_component.dart';

import 'package:ng_blog/src/post/post_service.dart';
import 'package:ng_blog/src/route_paths.dart';

@Component(
  selector: 'ng-dart-profile-component',
  styleUrls: [
    'package:angular_components/css/mdc_web/card/mdc-card.scss.css',
    'profile_component.css'
  ],
  templateUrl: 'profile_component.html',
  directives: [
    coreDirectives,
    MaterialButtonComponent,
    MaterialIconComponent,
    MaterialInputComponent,
    PostComponent
  ],
  providers: [
    ClassProvider(PostService),
  ]
)
class ProfileComponent implements OnInit, CanActivate {
  UserModel user;
  List<PostModel> posts;
  final TokenService _tokenService;
  final PostService _postService;
  final Router _router;

  ProfileComponent(this._tokenService, this._postService, this._router);

  @override
  void ngOnInit() {
    _tokenService
        .currentUser$
        .listen((user) => this.user = user);
    getMyPosts();
  }

  void getMyPosts() {
    _postService
        .getMyPosts()
        .listen((posts) => this.posts = posts);
  }

  @override
  Future<bool> canActivate(RouterState current, RouterState next) {
    if (!_tokenService.isLoggedIn()) {
      _router.navigate(RoutePaths.auth_sign_in.toUrl());
    }

    return Future(() => _tokenService.isLoggedIn());
  }
}
