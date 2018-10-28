import 'package:angular/angular.dart';

import 'package:angular_components/material_button/material_button.dart';
import 'package:angular_components/material_icon/material_icon.dart';
import 'package:angular_components/material_input/material_input.dart';

@Component(
  selector: 'ng-blog-sign-in',
  styleUrls: [
    'package:angular_components/css/mdc_web/card/mdc-card.scss.css',
    'sign_in_component.css'
  ],
  templateUrl: 'sign_in_component.html',
  directives: [
    MaterialButtonComponent,
    MaterialIconComponent,
    MaterialInputComponent
  ]
)
class SignInComponent {}