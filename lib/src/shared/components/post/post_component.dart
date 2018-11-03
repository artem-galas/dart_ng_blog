import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'package:angular_components/material_button/material_button.dart';
import 'package:angular_components/material_icon/material_icon.dart';
import 'package:angular_components/material_menu/material_menu.dart';
import 'package:angular_components/model/ui/icon.dart';
import 'package:angular_components/model/menu/menu.dart';

import 'package:ng_blog/src/route_paths.dart';

import '../../models/post_model.dart';

@Component(
  selector: 'ng-blog-post',
  templateUrl: 'post_component.html',
  styleUrls: [
    'package:angular_components/css/mdc_web/card/mdc-card.scss.css',
    'post_component.css'
  ],
  directives: [
    MaterialButtonComponent,
    MaterialIconComponent,
    MaterialMenuComponent,
  ],
)
class PostComponent {
  @Input()
  PostModel post;
  MenuModel<MenuItem> postMenu;
  final Router _router;

  PostComponent(this._router,) {
    postMenu = MenuModel([
      MenuItemGroup([
        MenuItem('Edit', action: goToEdit),
      ]),
    ], icon: Icon('more_vert')
    );
  }

  goToPost() {
    _router.navigate(_postUrl(post.id));
  }

  goToEdit() {
    _router.navigate(_postDetailUrl(post.id));
  }

  String _postUrl(String postId) =>
    RoutePaths.posts_overview.toUrl(parameters: {idParam: post.id});

  String _postDetailUrl(String postId) =>
    RoutePaths.posts_detail.toUrl(parameters: {idParam: post.id});
}
