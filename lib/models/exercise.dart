class ExerciseModel{
  int id;
  String name;

  ExerciseModel({this.id,this.name});

  factory ExerciseModel.fromJson(Map<String,dynamic> json){
    return ExerciseModel(
      id: int.parse(json['id']),
      name: json['exercise_title'],
    );
  }
}