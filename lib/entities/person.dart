library person;
import "../elements/tableelement/array_operator_overload.dart";

class Person extends ArrayOperatorOverload {

  String firstName;
  String lastName;
  Person(this.firstName,this.lastName);

  factory Person.fromJsonMap(Map map) {
    return new Person(map['firstName'],map['lastName']);
  }

}