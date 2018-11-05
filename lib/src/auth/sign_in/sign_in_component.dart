import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:angular_forms/angular_forms.dart';

import 'package:angular_components/material_button/material_button.dart';
import 'package:angular_components/material_icon/material_icon.dart';
import 'package:angular_components/material_input/material_input.dart';

import 'package:ng_blog/src/shared/models/user_model.dart';
import 'package:ng_blog/src/routes.dart';

import 'package:ng_blog/src/auth/auth_service.dart';

@Component(
  selector: 'ng-blog-sign-in',
  styleUrls: [
    'package:angular_components/css/mdc_web/card/mdc-card.scss.css',
    'sign_in_component.css'
  ],
  templateUrl: 'sign_in_component.html',
  directives: [
    coreDirectives,
    formDirectives,
    MaterialButtonComponent,
    MaterialIconComponent,
    MaterialInputComponent
  ],
  providers: [
    ClassProvider(AuthService)
  ],
)
class SignInComponent implements OnInit {
  ControlGroup signInForm;
  final AuthService _authService;
  final Router _router;

  SignInComponent(this._authService, this._router) {}

  @override
  void ngOnInit() {
    _buildForm();
  }

  void signIn() {
    if (signInForm.valid) {
      _authService
        .signIn(SignInRequestModel.fromJson(signInForm.value))
        .listen(
          (UserModel data) => _router.navigate(RoutePaths.posts_index.toUrl()),
          onError: (error) => print(error)
      );
    }
  }

  void _buildForm() {
    signInForm = FormBuilder.controlGroup({
      'email': ['', Validators.required],
      'password': ['', Validators.compose(
          [Validators.required, Validators.minLength(6)]
      )]
    });
  }
}