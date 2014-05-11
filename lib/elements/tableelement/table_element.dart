
import "package:polymer/polymer.dart";


/**
 * Custom table element
 * It take two attributes
 * data = List<dynamic> table data row
 *
 * structre = Table structure map column name and corresponding field name and cell factory whether it is
 * html or markdown etc ( currently only supports HTML)
 *
 */

@CustomTag("table-element")
class Table extends PolymerElement {

 @published  List<Map<String,String>>  structure; // table struture column name and value factory
 @published List<dynamic> data; // table data

 @observable final List<String> cols = [];
 @observable final List<String> fields = [];
 @observable final Map<String,bool> cellFactories = {}; // currently supports html
 @observable String searchParam = "";

 static const  COLUMN_NAME = "columnName";
 static  const FIELD_NAME = "fieldName";
 static  const CELL_FACTORY = "cellFactory";

 get applyAuthorStyles => true; // to apply styles from semantic-ui

  Table.created():super.created();

  void enteredView() {
     super.enteredView();
      _setupTable();
  }

 void _setupTable() {
   print("data$data");
   print("structure$structure");
   if( structure != null) {
     structure.forEach((map)  {
     cols.add(map[COLUMN_NAME]);
     fields.add(map[FIELD_NAME]);
     if(map[CELL_FACTORY] != null) {
       cellFactories[map[FIELD_NAME]] = map[CELL_FACTORY];
     } }); // populate columns and fields and cell factories
   }
 }

}
