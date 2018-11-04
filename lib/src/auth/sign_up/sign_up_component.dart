import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';

import 'package:angular_components/material_button/material_button.dart';
import 'package:angular_components/material_icon/material_icon.dart';
import 'package:angular_components/material_input/material_input.dart';

import 'package:ng_blog/src/shared/models/user_model.dart';

import '../auth_service.dart';

@Component(
  selector: 'ng-blog-sign-up',
  styleUrls: [
    'package:angular_components/css/mdc_web/card/mdc-card.scss.css',
    'sign_up_component.css'
  ],
  templateUrl: 'sign_up_component.html',
  directives: [
    coreDirectives,
    formDirectives,
    MaterialButtonComponent,
    MaterialInputComponent,
    MaterialIconComponent
  ],
  providers: [
    ClassProvider(AuthService)
  ]
)
class SignUpComponent implements OnInit {
  ControlGroup signUpForm;
  final AuthService _authService;

  SignUpComponent(this._authService);

  @override
  void ngOnInit() {
    _buildForm();
  }

  void _buildForm() {
    signUpForm = FormBuilder.controlGroup({
      'email': ['', Validators.required],
      'name': ['', Validators.required],
      'password': ['', Validators.compose(
          [Validators.required, Validators.minLength(6)]
      )],
    });
  }

  void signUpUser() {
    if(signUpForm.valid) {
      _authService
        .signUp(SignUpRequestModel.fromJson(signUpForm.value))
        .listen(
          (UserTokenModel data) => print(data.toJson()),
          onError: (error) => print(error)
      );
    }
  }

}