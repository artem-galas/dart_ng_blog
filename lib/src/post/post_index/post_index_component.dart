import 'package:angular/angular.dart';

import 'package:angular_components/material_button/material_button.dart';
import 'package:angular_components/material_icon/material_icon.dart';

@Component(
  selector: 'ng-blog-post-index',
  styleUrls: [
    'package:angular_components/css/mdc_web/card/mdc-card.scss.css',
    'post_index_component.css'
  ],
  templateUrl: 'post_index_component.html',
  directives: [
    MaterialButtonComponent,
    MaterialIconComponent,
  ]
)
class PostIndexComponent {

}
