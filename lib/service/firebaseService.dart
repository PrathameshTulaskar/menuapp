import 'package:menuapp/models/foodCategory.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService
{

  FirebaseFirestore firebasee= FirebaseFirestore.instance;
  Future<FoodCategory> getFoodCategory()async{
    var response = await firebasee.collection("foodCategory/morjimPride/category").get();
   
    // var output=FoodCategory.fromJson(response);
    print(response.docs + "Database Data Here");
  }
}