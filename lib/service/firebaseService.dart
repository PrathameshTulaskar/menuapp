import 'package:menuapp/models/foodCategory.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:menuapp/models/foodDishes.dart';

class FirebaseService
{

  FirebaseFirestore firebasee= FirebaseFirestore.instance;
  Future<List<FoodCategory>> getFoodCategory(String restaurantName)async{
    var response = await firebasee.collection("foodCategory/$restaurantName/Category").get();
    return response.docs.map((e) => FoodCategory.fromJson(e.data())).toList();
  }
  Future<List<FoodDishes>>getCategoryDishes(String restaurantName, String foodCategory)async{
     var response = await firebasee.collection("foodDishes/$restaurantName/Dishes").where("categoryName", isEqualTo: foodCategory).get();
      return response.docs.map((e) => FoodDishes.fromJson(e.data())).toList();
  }
}
