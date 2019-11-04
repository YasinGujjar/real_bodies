import 'package:flutter/material.dart';

class FoodDiaryToday extends StatefulWidget {
  @override
  _FoodDiaryTodayState createState() => _FoodDiaryTodayState();
}

class _FoodDiaryTodayState extends State<FoodDiaryToday> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: <Widget>[Text('Food Diary'), Text('< Thu,Feb 4 >')],
        ),

      ),
    );
  }
}
