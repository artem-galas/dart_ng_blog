import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'package:angular_components/angular_components.dart';
import 'package:angular_components/app_layout/material_persistent_drawer.dart';
import 'package:angular_components/content/deferred_content.dart';
import 'package:angular_components/material_button/material_button.dart';
import 'package:angular_components/material_icon/material_icon.dart';
import 'package:angular_components/material_list/material_list.dart';
import 'package:angular_components/material_list/material_list_item.dart';
import 'package:angular_components/material_toggle/material_toggle.dart';

import 'src/routes.dart';
import 'src/shared/services/token_service.dart';
import 'src/shared/models/user_model.dart';

@Component(
  selector: 'ng-blog-app',
  styleUrls: [
    'package:angular_components/app_layout/layout.scss.css',
    'app_component.css'
  ],
  templateUrl: 'app_component.html',
  directives: [
    routerDirectives,
    DeferredContentDirective,
    MaterialButtonComponent,
    MaterialIconComponent,
    MaterialPersistentDrawerDirective,
    MaterialToggleComponent,
    MaterialListComponent,
    MaterialListItemComponent,
  ],
  exports: [
    Routes,
    RoutePaths
  ],
  providers: [
    materialProviders,
    ClassProvider(TokenService)
  ]
)
class AppComponent implements OnInit {
  UserModel currentUser;
  final TokenService _tokenService;
  final Router _router;

  AppComponent(this._tokenService, this._router);

  @override
  void ngOnInit() {
    _tokenService
      .currentUser$
      .listen((user) => currentUser = user);
  }

  void signOut() {
    _tokenService.removeToken();
    _router.navigate(RoutePaths.auth_sign_in.toUrl());
  }
}
