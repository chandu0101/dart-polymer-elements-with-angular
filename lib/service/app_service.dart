library app_service;

import "package:angular/angular.dart";
import "dart:async";
import "../entities/person.dart";


/**
 *
 *  Service to get data from external source
 */
class AppService {

  String  _personUrl = 'data/person.json';

  Http _http;

  AppService(Http this._http);

  List<Person> _personsCache;


  Future _loadPeople() {
   return  _http.get(_personUrl).then((response) {
     _personsCache = [];
     for(Map map in response.data)  {
       _personsCache.add(new Person.fromJsonMap(map));
     }
   });
  }

  Future<List<Person>> getAllPeople() => _personsCache==null ? _loadPeople().then((_) => _personsCache) : new Future.value(_personsCache);

}