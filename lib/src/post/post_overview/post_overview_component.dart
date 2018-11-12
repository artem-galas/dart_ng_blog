import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'package:angular_components/material_button/material_button.dart';
import 'package:angular_components/material_icon/material_icon.dart';
import 'package:angular_components/material_menu/material_menu.dart';
import 'package:angular_components/model/ui/icon.dart';
import 'package:angular_components/model/menu/menu.dart';

import 'package:ng_blog/src/route_paths.dart';
import 'package:ng_blog/src/shared/models/post_model.dart';
import 'package:ng_blog/src/shared/services/token_service.dart';
import 'package:ng_blog/src/shared/directives/have_access_directive.dart';

import '../post_service.dart';

@Component(
  selector: 'ng-dart-post-overview-component',
  styleUrls: [
    'package:angular_components/css/mdc_web/card/mdc-card.scss.css',
    'post_overview_component.css'
  ],
  templateUrl: 'post_overview_component.html',
  directives: [
    coreDirectives,
    MaterialButtonComponent,
    MaterialIconComponent,
    MaterialMenuComponent,
    HaveAccessDirective
  ],
  providers: [
    ClassProvider(PostService)
  ]
)
class PostOverviewComponent implements OnInit, OnActivate, CanActivate {
  PostModel post;
  MenuModel<MenuItem> postMenu;
  final PostService _postService;
  final TokenService _tokenService;
  final Router _router;

  PostOverviewComponent(this._postService, this._tokenService, this._router);

  @override
  void ngOnInit() {
    postMenu = MenuModel([
      MenuItemGroup([
        MenuItem('Edit', action: goToEdit),
      ]),
    ], icon: Icon('more_vert')
    );
  }

  @override
  void onActivate(_, RouterState current) {
    final id = getId(current.parameters);
    if (id != null) {
      _postService
        .getPost(id)
        .listen((post) => this.post = post);
    }
  }

  @override
  Future<bool> canActivate(RouterState current, RouterState next) {
    if (!_tokenService.isLoggedIn()) {
      _router.navigate(RoutePaths.auth_sign_in.toUrl());
    }

    return Future(() => _tokenService.isLoggedIn());
  }

  goToEdit() {
    _router.navigate(_postDetailUrl(post.id));
  }

  String _postDetailUrl(String postId) =>
    RoutePaths.posts_detail.toUrl(parameters: {idParam: post.id});
}
