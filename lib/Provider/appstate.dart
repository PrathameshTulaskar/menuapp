import 'package:flutter/material.dart';
import 'package:menuapp/service/firebaseService.dart';

class Appstate extends ChangeNotifier{

FirebaseService firebase=FirebaseService();

  Appstate(){
    print("App State Initialized");
    firebase.getFoodCategory();
  }
}