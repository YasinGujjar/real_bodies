class ProgramPlan{
  String title;
  String description;
  String image;

  ProgramPlan({
    this.title,
    this.description,
    this.image,
  });

  factory ProgramPlan.fromJson(Map<String,dynamic> json){
    return ProgramPlan(
      title: json['title'],
      description: json['description'],
      image: json['image'],
    );
  }
}