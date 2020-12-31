class FoodDishes{
  String dishTitle;
  String dishPrice;
  String dishImg;
  String dishDescription;
  String categoryName;
  String dishType;

  FoodDishes({
    this.dishDescription,
    this.categoryName,
    this.dishPrice,
    this.dishImg,
    this.dishTitle,
    this.dishType
  });
FoodDishes.fromJson(Map<String, String> json){
  this.dishDescription = json['dishDescription'];
  this.categoryName = json['categoryName'];
  this.dishPrice = json['dishPrice'];
  this.dishImg = json['dishImg'];
  this.dishTitle = json['dishTitle'];
  this.dishType = json['dishType'];
}
}