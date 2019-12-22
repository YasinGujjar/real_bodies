import 'package:flutter/material.dart';
import 'package:real_bodies/theme/palette.dart';

class ExerciseInfo extends StatefulWidget {
  final int reps;
  final int sets;
  final String name;
  final int index;
  ExerciseInfo({this.index,this.reps,this.sets,this.name});
  @override
  _ExerciseInfoState createState() => _ExerciseInfoState();
}

class _ExerciseInfoState extends State<ExerciseInfo> {
  bool m = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Palette.mainPurple,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Center(child: Text("Exercise Plan Week 1"),)

      ),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(left:8.0, right:8.0),
            child: Text('Exercise No.${widget.index}. ${widget.name} ',style: TextStyle(fontSize: 30),
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              maxLines: 3,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left:60.0, right:90.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
              Text('${widget.sets} Sets',
                  style: TextStyle(fontSize: 20)
              ),
              Text('${widget.reps} Reps',
                  style: TextStyle(fontSize: 20)
              ),

            ],
            ),

          ),
      Padding(
        padding: const EdgeInsets.only(left:10.0, right:10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
             Container(
              width: 150,
              height: 50,
              // color: Colors.orange,
              child:

              m? Icon(Icons.done) : FlatButton(
                color: Palette.mainPurple,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      "Mark Complete",
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.none,
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        fontFamily: "OpenSans",
                      ),
                    ),
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  side: BorderSide(
                    color: Colors.white,
                    width: 2,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    m = true;
                  });
                },
              ),
            ),

            Container(
              width: 150,
              height: 50,
              // color: Colors.orange,
              child: FlatButton(
                color: Palette.mainPurple,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      "View Instructions",
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.none,
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        fontFamily: "OpenSans",
                      ),
                    ),
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  side: BorderSide(
                    color: Colors.white,
                    width: 2,
                  ),
                ),
                onPressed: () {},
              ),
            ),

          ],),),
             SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left:100.0,right: 100.0),
            child: Container(
              height: 50,
              // color: Colors.orange,
              child: FlatButton(
                color: Color(0xffe0e0e0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Row(

                      children: <Widget>[
                        Icon(Icons.access_time),
                        Text(
                          " 10 Mins",
                          softWrap: true,
                          textAlign: TextAlign.center,
                          style: TextStyle(

                            decoration: TextDecoration.none,
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            fontFamily: "OpenSans",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  side: BorderSide(
                    color: Colors.white,
                    width: 2,
                  ),
                ),
                onPressed: () {},
              ),
            ),
          ),

          SizedBox(height: 20,),
          Center(child: Text('Exercise Squats ',style: TextStyle(fontSize: 30),)),
          Center(child: Text('2 Sets',style: TextStyle(fontSize: 25),)),
          Center(child: Text('5 Reps',style: TextStyle(fontSize: 25),)),
          SizedBox(height: 140,),

          Center(
            child: Container(
              width: 150,
              height: 50,
              // color: Colors.orange,
              child: FlatButton(
                color: Palette.mainPurple,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      "Start",
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.none,
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        fontFamily: "OpenSans",
                      ),
                    ),
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  side: BorderSide(
                    color: Colors.white,
                    width: 2,
                  ),
                ),
                onPressed: () {},
              ),
            ),
          ),

        ],
      ),
    );
  }
}
