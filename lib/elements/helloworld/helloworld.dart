library helloworld;


import "package:polymer/polymer.dart";

@CustomTag("hello-world")
class HelloWorld extends PolymerElement {

  @published String message;
  @published List<String> list;

  HelloWorld.created():super.created() {
    print("message************$message");
  }
  void enteredView() {   
     super.enteredView();  
  }
  
  
}