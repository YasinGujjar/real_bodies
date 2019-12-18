class WeeklyMealPlan{
  String foodName;
  String type;
  WeeklyMealPlan({this.foodName,this.type});

  factory WeeklyMealPlan.fromJson(Map<String,dynamic> json){
    return WeeklyMealPlan(
      foodName: json['foodName'],
      type: json['type'],
    );
  }
}