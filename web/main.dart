import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'package:http/http.dart';
import 'package:http/browser_client.dart';

import 'package:ng_blog/app_component.template.dart' as ng;

import 'main.template.dart' as self;

@GenerateInjector([
  ClassProvider(Client, useClass: BrowserClient),
  routerProvidersHash, // You can use routerProviders in production
])
final InjectorFactory injector = self.injector$Injector;

void main() {
  runApp(ng.AppComponentNgFactory, createInjector: injector);
}
