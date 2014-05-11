
import "package:polymer/polymer.dart";
import "package:polymerangular/elements/searchbox/searchable.dart";
import "package:polymerangular/elements/tableelement/array_operator_overload.dart";

@CustomTag("table-test")
class Test extends PolymerElement {

  @observable List<People> data = toObservable([new People("chandra","<a href=\"http://google.com\"  target=\"_blank\"> kode</a>"), new People("ravi","kiran"),new People("justin","mat")]);
  @observable List<Map<String,String>> structure = [{ "columnName" : "First Name", "fieldName" : "fname"},
                                                     {"columnName" : "Last Name", "fieldName" : "lname","cellFactory" :"html"}];
  Test.created():super.created();

  enteredView(){
    super.enteredView();
  }

}

class People extends ArrayOperatorOverload implements Searchable {

  String fname;
  String lname;

  static const SPACE = " ";

  People(this.fname,this.lname);

  get map => {"fname" : fname,"lname": lname };


  String toString() => "first name $fname  last name $lname";

  String getValue() => fname.trim()+SPACE+lname.trim();
}






