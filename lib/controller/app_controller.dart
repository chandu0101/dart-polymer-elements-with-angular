library app_controller;
import "package:angular/angular.dart";
import "../service/app_service.dart";
import "../entities/person.dart";

@Controller(selector :"[app-ctrl]", publishAs : "ctrl")
class AppController {
  static const COLUMN_NAME = "columnName";
  static const FIELD_NAME = "fieldName";
  static const CELL_FACTORY = "cellFactory";
  String message = "polymer angular rocks";
  AppService _appService;
  List<Person> _persons = [];
  List<String> list = ["dsdf","dsf"];
  
  List<Map<String,String>> _tablesStructure = [ {
      COLUMN_NAME : "First Name", FIELD_NAME : "firstName"
  }, {
      COLUMN_NAME : "Last Name", FIELD_NAME : "lastName"
  } ] ;
  
  List<Map<String,String>> get tableStructure => _tablesStructure;
  List<Person> get persons => _persons;

  AppController(AppService this._appService) {
    _loadData();
  }

  _loadData() {
    _appService.getAllPeople().then((List<Person> data) => _persons.addAll(data)).catchError((e) => print("Error getting All People $e"));
    print("data in control$_persons");
    print("structure in control $_tablesStructure");
  }

}