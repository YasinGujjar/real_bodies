import 'package:flutter/material.dart';
import 'package:real_bodies/theme/palette.dart';

class ExerciseDiary extends StatefulWidget {
  @override
  _ExerciseDiaryState createState() => _ExerciseDiaryState();
}

class _ExerciseDiaryState extends State<ExerciseDiary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar:
     AppBar(
       backgroundColor: Palette.mainPurple,
       title: Center(child: Text('Exercise Diary')),
     ),
      body: ListView(
        children: <Widget>[

        ],
      ),
    );
  }
}
