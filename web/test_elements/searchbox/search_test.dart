import "package:polymer/polymer.dart";


@CustomTag("search-test")
class SearchBoxTest extends PolymerElement {

  @observable List<String> data = toObservable(["Java" ,"C lang" , "Dart" , "Scala" , "Small Talk" ,"Erlang" ,"Groovy"]);

  SearchBoxTest.created():super.created();



}