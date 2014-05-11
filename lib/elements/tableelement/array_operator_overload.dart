library array_operator_overload;
import "dart:mirrors";

/**
 * All Users of table element must extend this class ( in future i will work on removing this constraint)
 * This will allow accessing Object fields in array style ( example person[firstname] ..)
 */
abstract class ArrayOperatorOverload {

  // current polymer dart expression doesnt support dynamic object iteration so kind of hackish
  operator [] (String field) => reflect(this).getField(new Symbol(field)).reflectee;

}