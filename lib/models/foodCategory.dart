class FoodCategory {
  String categoryImg;
  String categoryTitle;

  FoodCategory({
    this.categoryImg,
    this.categoryTitle
  });
FoodCategory.fromJson(Map<String, String> json){
  var response=json['Drinks'] as Map<String, String>;
  this.categoryImg=response['categoryImg'];
  this.categoryTitle=response['categoryTitle'];
}
}