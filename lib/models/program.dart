import 'package:real_bodies/models/url.dart';

class ProgramPlan{
  String title;
  String description;
  String image;
  int programId;

  ProgramPlan({
    this.title,
    this.description,
    this.image,
    this.programId
  });

  factory ProgramPlan.fromJson(Map<String,dynamic> json){
    return ProgramPlan(
      title: json['title'],
      description: json['description'],
      image: URL.imageUrl+json['image'],
      programId: int.parse(json['id']),
    );
  }
}