import 'package:angular/angular.dart';

import 'package:angular_components/material_button/material_button.dart';
import 'package:angular_components/material_icon/material_icon.dart';
import 'package:angular_components/material_input/material_input.dart';

@Component(
  selector: 'ng-dart-profile-component',
  styleUrls: [
    'package:angular_components/css/mdc_web/card/mdc-card.scss.css',
    'profile_component.css'
  ],
  templateUrl: 'profile_component.html',
  directives: [
    MaterialButtonComponent,
    MaterialIconComponent,
    MaterialInputComponent,
  ]
)
class ProfileComponent {
}
