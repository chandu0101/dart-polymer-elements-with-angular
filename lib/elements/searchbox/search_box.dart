import "package:polymer/polymer.dart";
import "searchable.dart";

/**
 *  Custom search box component
 *  if data object implements Searchable it gets value of object by calling getValue otherwise it uses toString
 */
@CustomTag("search-box")
class SearchBox extends PolymerElement {

  @published List<dynamic> data;
  @observable String searchParam = "";
  final List<dynamic> original = []; // back up data
  static const SPACE = " ";

  get applyAuthorStyles => true; // to apply css from semantic-UI

  SearchBox.created() :super.created();

  enteredView() {
    super.enteredView();
    original.addAll(data);
    onPropertyChange(this,#searchParam,search); // listen to search box changes
  }

  void search() {
    data.clear();
    data.addAll(original.where((Object object) {
      if(object is Searchable) {
        Searchable s = object;
        return s.getValue().toLowerCase().contains(searchParam.toLowerCase());
      }else {
        return object.toString().toLowerCase().contains(searchParam.toLowerCase());
      }
    }));
  }

}