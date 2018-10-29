import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'src/routes.dart';

@Component(
  selector: 'ng-blog-app',
  styleUrls: ['app_component.css'],
  templateUrl: 'app_component.html',
  directives: [
    routerDirectives
  ],
  exports: [
    Routes,
    RoutePaths
  ]
)
class AppComponent {

}
