class FoodCategory {
  String categoryImg;
  String categoryTitle;

  FoodCategory({
    this.categoryImg,
    this.categoryTitle
  });
FoodCategory.fromJson(Map<String, String> json){
  this.categoryImg=json['categoryImg'];
  this.categoryTitle=json['categoryTitle'];
}
}