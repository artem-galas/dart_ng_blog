import 'package:angular/angular.dart';

import '../services/token_service.dart';

@Directive(selector: '[haveAccess]')
class HaveAccessDirective {
  TemplateRef _templateRef;
  ViewContainerRef _viewContainer;
  final TokenService _tokenService;

  HaveAccessDirective(this._templateRef, this._viewContainer, this._tokenService);

  @Input()
  set haveAccess(String userId) {
    this._tokenService
      .currentUser$
      .listen((currentUser){
        if (currentUser != null) {
          if (currentUser.id == userId) {
            _viewContainer.createEmbeddedView(_templateRef);
          } else {
            _viewContainer.clear();
          }
        }
      });
  }
}