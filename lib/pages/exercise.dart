import 'package:flutter/material.dart';

class Exercise extends StatefulWidget {



  @override
  _ExerciseState createState() => _ExerciseState();
}

class _ExerciseState extends State<Exercise> {




  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(

      body: Column(
        children: <Widget>[
          Container(
            height: height * 0.10,
          ),
          FittedBox(
            fit: BoxFit.contain,
            child: Text('Planks'),

          )
        ],
      ),
    );
  }
}
