import "package:angular/angular.dart";
import 'package:angular/application_factory.dart';
import "package:polymer/polymer.dart";
import "package:polymerangular/routing/polymer_angular_router.dart";
import "package:polymerangular/controller/app_controller.dart";
import "package:polymerangular/service/app_service.dart";
import "package:logging/logging.dart";


class AppModule extends Module {
  AppModule() {
    bind(RouteInitializerFn,toValue: polymerAngularRouteInitializer);
    bind(NgRoutingUsePushState,toFactory: (_) => new NgRoutingUsePushState.value(false));
    bind(AppService);
    bind(AppController);

  }
  
}


void main() {
  Logger.root.level = Level.FINEST;
  Logger.root.onRecord.listen((LogRecord r) { print(r.message); });
  initPolymer().run(() {
    applicationFactory().addModule(new AppModule()).run();
  }); 
}