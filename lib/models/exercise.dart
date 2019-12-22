class ExerciseModel{
  int id;
  String name;
  String log;
  int reps;
  int sets;
  ExerciseModel({this.sets,this.reps,this.id,this.name,this.log});

  factory ExerciseModel.fromJson(Map<String,dynamic> json){
    return ExerciseModel(
      id: int.parse(json['id']),
      name: json['exercise_title'],
      log: json['log'],
      reps: int.parse(json['reps']),
      sets: int.parse(json['sets']),
    );
  }
}