library polymer_angular_router;
import "package:angular/angular.dart";


/**
 *  All routes for this application will be defined here
 */
void polymerAngularRouteInitializer(Router router,RouteViewFactory views) {

  views.configure({

      'default' : ngRoute(
                   defaultRoute :true,
                   path : '/',
                   view : 'views/readme.html'
                   ),
      'readme' : ngRoute(
                path : '/readme',
                view : 'views/readme.html'),
     'table' : ngRoute(
               path : '/tabledemo',
               view : 'views/tableDemo.html'),
      'searchbox' : ngRoute(
                     path : "/searchdemo",
                     view : "views/searchDemo.html"
                           )
       

  });

}