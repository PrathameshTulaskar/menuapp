import 'package:menuapp/models/foodCategory.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService
{

  FirebaseFirestore firebasee= FirebaseFirestore.instance;
  Future<FoodCategory> getFoodCategory(String restaurantName)async{
    var response = await firebasee.collection("foodCategory/$restaurantName/Category").get();
    response.docs.forEach((element) {print(element.id);});
    // var output=FoodCategory.fromJson(response);
    print("Database Data Here");
  }
}