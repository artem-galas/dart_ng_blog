import 'package:angular/angular.dart';

import 'package:angular_components/angular_components.dart';
import 'package:angular_components/material_button/material_button.dart';
import 'package:angular_components/material_icon/material_icon.dart';
import 'package:angular_components/material_input/material_input.dart';
import 'package:angular_components/material_input/material_input_multiline.dart';

@Component(
  selector: 'ng-blog-post-detail-component',
  styleUrls: [
    'package:angular_components/css/mdc_web/card/mdc-card.scss.css',
    'post_detail_component.css',
  ],
  templateUrl: 'post_detail_component.html',
  directives: [
    coreDirectives,
    materialInputDirectives,
    MaterialButtonComponent,
    MaterialIconComponent,
    MaterialInputComponent,
    MaterialMultilineInputComponent
  ]
)
class PostDetailComponent {

}
