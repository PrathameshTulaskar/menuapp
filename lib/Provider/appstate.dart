import 'package:flutter/material.dart';
import 'package:menuapp/models/foodCategory.dart';
import 'package:menuapp/models/foodDishes.dart';
import 'package:menuapp/service/firebaseService.dart';

class Appstate extends ChangeNotifier {
  String _restaurantName;
  String _selectedCategory;
  List<FoodCategory> _listFoodCategories = [];
  List<FoodDishes> _listFoodDishes = [];
  List<FoodCategory> get listFoodCategories => _listFoodCategories;
  List<FoodDishes> get listFoodDishes => _listFoodDishes;
  String get restaurantName => _restaurantName;
  String get selectedCategory => _selectedCategory;
  set restaurantNameSetter(value) {
    _restaurantName = value;
    notifyListeners();
  }

  set selectedCategorySetter(value) {
    _selectedCategory = value;
    notifyListeners();
  }

  FirebaseService firebase = FirebaseService();
  Appstate() {
    print("App State Initialized");
  }
  Future<void> getRestaurantCategory() async {
    _listFoodCategories = await firebase.getFoodCategory(_restaurantName);
    print("getRestaurantCategory() function fired with data: \n  " +
        _listFoodCategories.toString() +
        "\n Restaurant Name: " +
        _restaurantName);
    notifyListeners();
  }

  Future<void> dishesByCategory() async {
    try {
      if (_listFoodDishes.length > 0) {
        _listFoodDishes = await firebase.getCategoryDishes(
            _restaurantName, _selectedCategory);
        print("dishesByCategory() function fired with data: \n  " +
            _listFoodDishes.toString() +
            "\n Restaurant Name: " +
            _restaurantName +
            "\n Food Category: " +
            _selectedCategory);
        notifyListeners();
      }
    } catch (e) {
      print("error while fetching food dishes: $e");
      _listFoodDishes = [];
      notifyListeners();
    }
  }
}
