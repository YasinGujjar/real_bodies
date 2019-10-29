import 'package:flutter/material.dart';
import 'package:real_bodies/theme/palette.dart';

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
          Container(
            height: height * 0.05,
            child: FittedBox(
              fit: BoxFit.cover,
              child: Text('Planks Exercise'),

            ),
          ),

          Container(
            height: height * 0.10,
          ),
          Container(
            height: height * 0.40,
            width:  width * 0.95,
            color: Palette.accentColor,
            child: Text('Video'),
          ),
          Container(
            height: height * 0.33,
            width: width * 0.90,
            color: Colors.amber,
            child: Center(child: Text('Mango')),
          )
        ],
      ),
    );
  }
}
