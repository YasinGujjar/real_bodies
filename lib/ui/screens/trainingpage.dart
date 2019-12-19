import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:real_bodies/models/chart_data.dart';
import 'package:real_bodies/models/exercise.dart';
import 'package:real_bodies/models/url.dart';
import 'package:real_bodies/pages/add_food_main.dart';
import 'package:real_bodies/theme/my_flutter_app_icons.dart';
//import 'package:real_bodies/models/chart_data.dart';
import 'package:real_bodies/theme/palette.dart';

import 'package:real_bodies/ui/widgets/category_item.dart';
import 'package:real_bodies/ui/widgets/custom_flat_button.dart';
import 'package:http/http.dart' as http;

//import 'add_food_main.dart';


class TrainingPage extends StatefulWidget {
  final List<ExerciseModel> exerciseList;
  final String trainingDay;
  TrainingPage({this.exerciseList,this.trainingDay});
  @override
  _TrainingPageState createState() => _TrainingPageState();
}

class _TrainingPageState extends State<TrainingPage> {
  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    //List<charts.Series> seriesList;
    bool animate;

//     DonutPieChart(this.seriesList, {this.animate});
//
//     /// Creates a [PieChart] with sample data and no transition.
//     factory DonutPieChart.withSampleData() {
//       return new DonutPieChart(
//         _createSampleData(),
//         // Disable animations for image tests.
//         animate: false,
//       );
//     }

//    List<charts.Series<LinearSales, int>> _createSampleData() {
//      final data = [
//        new LinearSales(0, 100),
//        new LinearSales(1, 75),
//        new LinearSales(2, 25),
//        new LinearSales(3, 5),
//      ];
//
//      return [
//        new charts.Series<LinearSales, int>(
//          id: 'Sales',
//          domainFn: (LinearSales sales, _) => sales.year,
//          measureFn: (LinearSales sales, _) => sales.sales,
//          data: data,
//        )
//      ];
//    }

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double abovePadding = MediaQuery.of(context).padding.top;
//    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//        statusBarColor: Colors.green
//    ));
    return
    Container(
    width: width,
    height: height - kToolbarHeight,
    child:
          Column(
            children: <Widget>[
              Expanded(
                flex: 9,
                child: ListView(
                  children: <Widget>[
                    Column(
                      children: <Widget>[

                        Container(
                          // color: Colors.blue,
                          height: height * 0.12,
                          width: width * 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            //  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            children: <Widget>[
                              Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "${widget.trainingDay}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 27.0),
                                  )),
                              SizedBox(
                                height: height * 0.02,
                              ),
                              Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Week 1",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 21.0),
                                  )),
                            ],
                          ),
                        ),
                        Container(
                         // height: height * 0.61,
                          width: width * 1,
                          child: Column(
                            children: <Widget>[

                              ListView.builder(
                                shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: widget.exerciseList.length,
                                  itemBuilder: (BuildContext context, int index ){
                                    return
                                    ExerciseCard(id:widget.exerciseList[index].id,name:widget.exerciseList[index].name);

                                  }

                              ),


//                              Card(
//                                elevation: 5.0,
//                                child: ListTile(
//                                  title: Text(
//                                    'Exercise 1',
//                                    style: TextStyle(
//                                        fontSize: 19.0,
//                                        fontWeight: FontWeight.bold),
//                                  ),
//                                  subtitle: Column(
//                                    children: <Widget>[
//                                      Row(
//                                        children: <Widget>[
//                                          Text(''),
//                                        ],
//                                      ),
//                                      Row(
//                                        children: <Widget>[
//                                          Text('7 min'),
//                                        ],
//                                      ),
//                                      Row(
//                                        children: <Widget>[
//                                          Text(""),
//                                        ],
//                                      ),
//                                      Row(
//                                        children: <Widget>[
//                                          Container(
//                                            height: 40,
//                                            width: 70,
//                                            child: FittedBox(
//                                              fit: BoxFit.contain,
//                                              child: CustomFlatButton(
//
//                                                title: "View",
//                                                fontSize: 20,
//                                                fontWeight: FontWeight.w700,
//                                                textColor: Colors.white,
//                                                onPressed: () {
//                                                  /*  Navigator.pushReplacement(
//                                        context,
//                                        MaterialPageRoute(builder: (context) => WelcomeScreen(goal:widget.goal,gender:widget.gender,age:widget.age,weight:widget.weight,height:widget.height)),
//                                      ); */
//                                                },
//                                                splashColor: Colors.black12,
//                                                borderColor: Colors.white,
//                                                borderWidth: 2,
//                                                color: Palette.mainPurple,
//                                              ),
//                                            ),
//                                          ),
//                                          Container(
//                                            height: 40,
//                                            width: 70,
//                                            child: FittedBox(
//                                              fit: BoxFit.contain,
//                                              child: CustomFlatButton(
//
//                                                title: "Log",
//                                                fontSize: 20,
//                                                fontWeight: FontWeight.w700,
//                                                textColor: Colors.white,
//                                                onPressed: () {
//                                                  /*  Navigator.pushReplacement(
//                                        context,
//                                        MaterialPageRoute(builder: (context) => WelcomeScreen(goal:widget.goal,gender:widget.gender,age:widget.age,weight:widget.weight,height:widget.height)),
//                                      ); */
//                                                },
//                                                splashColor: Colors.black12,
//                                                borderColor: Colors.white,
//                                                borderWidth: 2,
//                                                color: Palette.mainPurple,
//                                              ),
//                                            ),
//                                          ),
//                                        ],
//                                      )
//                                    ],
//                                  ),
//                                  leading: Icon(
//                                    Icons.looks_one,
//                                   color: Palette.mainPurple,
//                                    size: 30.0,
//                                  ),
//                                  trailing: Icon(
//                                    Icons.report,
//                                    color: Colors.grey,
//                                    size: 30.0,
//                                  ),
//                                  /* SizedBox(
//                                    width: 50,
//                                    height: 50,
//                                    child: RaisedButton(
//                                      child: const Icon(Icons.report_problem, color: Colors.grey),
//                                      color: Colors.white,
//                                      shape: RoundedRectangleBorder(
//                                          borderRadius: BorderRadius.circular(30.0)),
//                                      onPressed: () {
//                                       // Navigator.push(context, MaterialPageRoute(builder: (context) => Schedule(id: widget.id)),);
//                                      },
//                                    ),
//                                  ) */
//                                ),
//                              ),
//                              Card(
//                                elevation: 5.0,
//                                child: ListTile(
//                                  title: Text(
//                                    'Exercise 2',
//                                    style: TextStyle(
//                                        fontSize: 19.0,
//                                        fontWeight: FontWeight.bold),
//                                  ),
//                                  subtitle: Column(
//                                    children: <Widget>[
//                                      Row(
//                                        children: <Widget>[
//                                          Text(''),
//                                        ],
//                                      ),
//                                      Row(
//                                        children: <Widget>[
//                                          Text('5 min'),
//                                        ],
//                                      ),
//                                      Row(
//                                        children: <Widget>[
//                                          Text(""),
//                                        ],
//                                      ),
//                                      Row(
//                                        children: <Widget>[
//                                          Container(
//                                            height: 40,
//                                            width: 70,
//                                            child: FittedBox(
//                                              fit: BoxFit.contain,
//                                              child: CustomFlatButton(
//
//                                                title: "View",
//                                                fontSize: 20,
//                                                fontWeight: FontWeight.w700,
//                                                textColor: Colors.white,
//                                                onPressed: () {
//                                                  /*  Navigator.pushReplacement(
//                                        context,
//                                        MaterialPageRoute(builder: (context) => WelcomeScreen(goal:widget.goal,gender:widget.gender,age:widget.age,weight:widget.weight,height:widget.height)),
//                                      ); */
//                                                },
//                                                splashColor: Colors.black12,
//                                                borderColor: Colors.white,
//                                                borderWidth: 2,
//                                                color: Palette.mainPurple,
//                                              ),
//                                            ),
//                                          ),
//                                          Container(
//                                            height: 40,
//                                            width: 70,
//                                            child: FittedBox(
//                                              fit: BoxFit.contain,
//                                              child: CustomFlatButton(
//
//                                                title: "Log",
//                                                fontSize: 20,
//                                                fontWeight: FontWeight.w700,
//                                                textColor: Colors.white,
//                                                onPressed: () {
//                                                  /*  Navigator.pushReplacement(
//                                        context,
//                                        MaterialPageRoute(builder: (context) => WelcomeScreen(goal:widget.goal,gender:widget.gender,age:widget.age,weight:widget.weight,height:widget.height)),
//                                      ); */
//                                                },
//                                                splashColor: Colors.black12,
//                                                borderColor: Colors.white,
//                                                borderWidth: 2,
//                                                color: Palette.mainPurple,
//                                              ),
//                                            ),
//                                          ),
//                                        ],
//                                      )
//                                    ],
//                                  ),
//                                  leading: Icon(
//                                    Icons.looks_two,
//                                    color: Palette.mainPurple,
//                                    size: 30.0,
//                                  ),
//                                  trailing: Icon(
//                                    Icons.report,
//                                    color: Colors.grey,
//                                    size: 30.0,
//                                  ),
//                                  /* SizedBox(
//                              width: 50,
//                              height: 50,
//                              child: RaisedButton(
//                                child: const Icon(Icons.report_problem, color: Colors.grey),
//                                color: Colors.white,
//                                shape: RoundedRectangleBorder(
//                                    borderRadius: BorderRadius.circular(30.0)),
//                                onPressed: () {
//                                 // Navigator.push(context, MaterialPageRoute(builder: (context) => Schedule(id: widget.id)),);
//                                },
//                              ),
//                            ) */
//                                ),
//                              ),
//                              Card(
//                                elevation: 5.0,
//                                child: ListTile(
//                                  title: Text(
//                                    'Finish',
//                                    style: TextStyle(
//                                        fontSize: 19.0,
//                                        fontWeight: FontWeight.bold),
//                                  ),
//                                  subtitle: Column(
//                                    children: <Widget>[
//                                      Row(
//                                        children: <Widget>[
//                                          Text(""),
//                                        ],
//                                      ),
//                                      Row(
//                                        children: <Widget>[
//                                          Text('15 min'),
//                                        ],
//                                      ),
//                                      Row(
//                                        children: <Widget>[
//                                          Text(''),
//                                        ],
//                                      ),
//                                      Row(
//                                        children: <Widget>[
//                                          Container(
//                                            height: 40,
//                                            width: 70,
//                                            child: FittedBox(
//                                              fit: BoxFit.contain,
//                                              child: CustomFlatButton(
//
//                                                title: "View",
//                                                fontSize: 20,
//                                                fontWeight: FontWeight.w700,
//                                                textColor: Colors.white,
//                                                onPressed: () {
//                                                  /*  Navigator.pushReplacement(
//                                        context,
//                                        MaterialPageRoute(builder: (context) => WelcomeScreen(goal:widget.goal,gender:widget.gender,age:widget.age,weight:widget.weight,height:widget.height)),
//                                      ); */
//                                                },
//                                                splashColor: Colors.black12,
//                                                borderColor: Colors.white,
//                                                borderWidth: 2,
//                                                color: Palette.mainPurple,
//                                              ),
//                                            ),
//                                          ),
//                                          Container(
//                                            height: 40,
//                                            width: 70,
//                                            child: FittedBox(
//                                              fit: BoxFit.contain,
//                                              child: CustomFlatButton(
//
//                                                title: "Log",
//                                                fontSize: 20,
//                                                fontWeight: FontWeight.w700,
//                                                textColor: Colors.white,
//                                                onPressed: () {
//                                                  /*  Navigator.pushReplacement(
//                                        context,
//                                        MaterialPageRoute(builder: (context) => WelcomeScreen(goal:widget.goal,gender:widget.gender,age:widget.age,weight:widget.weight,height:widget.height)),
//                                      ); */
//                                                },
//                                                splashColor: Colors.black12,
//                                                borderColor: Colors.white,
//                                                borderWidth: 2,
//                                                color: Palette.mainPurple,
//                                              ),
//                                            ),
//                                          ),
//                                        ],
//                                      )
//                                    ],
//                                  ),
//                                  leading: Icon(
//                                    Icons.stars,
//                                    color: Palette.mainPurple,
//                                    size: 30.0,
//                                  ),
//                                  trailing: Icon(
//                                    Icons.report,
//                                    color: Colors.grey,
//                                    size: 30.0,
//                                  ),
//                                  /* SizedBox(
//                              width: 50,
//                              height: 50,
//                              child: RaisedButton(
//                                child: const Icon(Icons.report_problem, color: Colors.grey),
//                                color: Colors.white,
//                                shape: RoundedRectangleBorder(
//                                    borderRadius: BorderRadius.circular(30.0)),
//                                onPressed: () {
//                                 // Navigator.push(context, MaterialPageRoute(builder: (context) => Schedule(id: widget.id)),);
//                                },
//                              ),
//                            ) */
//                                ),
//                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  width: width * 0.9,
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


class ExerciseCard extends StatelessWidget {
  final int id;
  final String name;
  ExerciseCard({this.id,this.name});
  @override
  Widget build(BuildContext context) {
    return
      Card(
        elevation: 5.0,
        child: ListTile(
          title: Text(
            '$name',
            style: TextStyle(
                fontSize: 19.0,
                fontWeight: FontWeight.bold),
          ),
          subtitle: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(''),
                ],
              ),
              Row(
                children: <Widget>[
                  Text('7 min'),
                ],
              ),
              Row(
                children: <Widget>[
                  Text(""),
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    height: 40,
                    width: 70,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: CustomFlatButton(

                        title: "View",
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        textColor: Colors.white,
                        onPressed: () {
                          /*  Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(builder: (context) => WelcomeScreen(goal:widget.goal,gender:widget.gender,age:widget.age,weight:widget.weight,height:widget.height)),
                                      ); */
                        },
                        splashColor: Colors.black12,
                        borderColor: Colors.white,
                        borderWidth: 2,
                        color: Palette.mainPurple,
                      ),
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 70,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: CustomFlatButton(

                        title: "Log",
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        textColor: Colors.white,
                        onPressed: () {
                         logExercise(2, this.id);
                        },
                        splashColor: Colors.black12,
                        borderColor: Colors.white,
                        borderWidth: 2,
                        color: Palette.mainPurple,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          leading: Icon(
            Icons.looks_one,
            color: Palette.mainPurple,
            size: 30.0,
          ),
          trailing: Icon(
            Icons.report,
            color: Colors.grey,
            size: 30.0,
          ),
          /* SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: RaisedButton(
                                      child: const Icon(Icons.report_problem, color: Colors.grey),
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(30.0)),
                                      onPressed: () {
                                       // Navigator.push(context, MaterialPageRoute(builder: (context) => Schedule(id: widget.id)),);
                                      },
                                    ),
                                  ) */
        ),
      );

  }
}

void logExercise(int id, int exerciseId) async {

  URL urldomain = URL();
  print(exerciseId);
  var url=urldomain.domain+"update_exercise";

  final response =await http.get(url+"&id="+id.toString()+"&exercise_id="+exerciseId.toString());

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    // r Post.fromJson(json.decode(response.body));
    print('Response body:${response.body}');

  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to save exercise: exesize_plan');
  }
}