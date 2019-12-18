import 'package:flutter/material.dart';
import 'package:real_bodies/models/chart_data.dart';
import 'package:real_bodies/pages/exercise_diary.dart';
import 'package:real_bodies/pages/food_diary.dart';
import 'package:real_bodies/pages/progress_tracker.dart';
import 'package:real_bodies/theme/palette.dart';
import 'package:charts_flutter/flutter.dart' as charts;


class FoodExerciseDiary extends StatefulWidget {
  final int id;
  final String calorie;
  FoodExerciseDiary({this.id,this.calorie});
  @override
  _FoodExerciseDiaryState createState() => _FoodExerciseDiaryState();
}

class _FoodExerciseDiaryState extends State<FoodExerciseDiary> {


void refresh(){
  setState(() {

  });
}



  List<charts.Series<ChartData, String>> _seriesPieData;
  _generateData() {
    var pieData = [
      ChartData('Protein', 20.0, Colors.blue),
      ChartData('Carbs', 40.0, Colors.green),
      ChartData('Fats', 40.0, Colors.amber),
    ];
    _seriesPieData.add(charts.Series(
      data: pieData,
      domainFn: (ChartData chartData, _) => chartData.nutrient,
      measureFn: (ChartData chartData, _) => chartData.value,
      colorFn: (ChartData chartData, _) =>
          charts.ColorUtil.fromDartColor(chartData.color),
      id: 'Nutrients graph',
      labelAccessorFn: (ChartData chartData, _) => '${chartData.value}',
    ));
  }
  @override
  Widget build(BuildContext context) {
    _seriesPieData = List<charts.Series<ChartData, String>>();
    _generateData();

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Palette.mainPurple,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Center(child: Text("Food/Exercise Diary"),)
          
      ),
      body:             ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
//        Container(
//          height: height * 0.06,
//          child: Row(
//            mainAxisAlignment: MainAxisAlignment.center,
//            children: <Widget>[
//
//                 FittedBox(
//                  fit: BoxFit.cover,
//                  child: IconButton(icon: Icon(Icons.arrow_back_ios),
//                      color: Colors.black,
//                      onPressed: ()=>{}),
//                ),
//              Text('Today', style: TextStyle(color: Colors.black),),
//              FittedBox(
//                fit: BoxFit.cover,
//                child: IconButton(icon: Icon(Icons.arrow_forward_ios),
//                    color: Colors.black,
//                    onPressed: ()=>{}),
//              ),
//            ],
//          ),
//        ),



              Container(
                // color: Colors.blue,
                height: 20,

                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: <Widget>[
                    Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Thursday, Nov 28",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17.0
                          ),
                        )),
                    Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Training Week 1",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17.0
                          ),
                        )),
                  ],
                ),
              ),
              Container(
                // color: Colors.blue,
                height: height * 0.04,
                width: width * 0.95,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: <Widget>[
                    Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Total Calories Aim Today",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                    Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "1400",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red
                          ),
                        )),
                  ],
                ),
              ),
              Container(
                //  color: Colors.blue,
                height: height * 0.04,
                width: width * 0.95,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: <Widget>[
                    Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Food Calories",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                    Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "1000",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ],
                ),
              ),
              Container(
                //  color: Colors.blue,
                height: height * 0.04,
                width: width * 0.95,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: <Widget>[
                    Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Exercise",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                    Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "-400",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ],
                ),
              ),
              Container(
                //  color: Colors.blue,
                height: height * 0.04,
                width: width * 0.95,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: <Widget>[
                    Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Remaining",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                    Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "600",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ],
                ),
              ),


              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Card(
                  color: Colors.grey[300],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    side: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                  ),
                  elevation: 4.0,
                  child: Row(
                    children: <Widget>[
                      Container(
                        // color: Colors.blue,
                        height: height * 0.22,
                        width: width * 0.35,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                          charts.PieChart(
                            _seriesPieData,
                            animate: true,
                            animationDuration: Duration(seconds: 1),
                            /*  behaviors: [
                                charts.DatumLegend(
                                 // outsideJustification:
                                   //   charts.OutsideJustification.endDrawArea,
                                  horizontalFirst: false,
                                  desiredMaxRows: 2,
                                  cellPadding: EdgeInsets.only(right: 2.0, bottom: 2.0),
                                  entryTextStyle: charts.TextStyleSpec(
                                    color: charts.MaterialPalette.black.darker,
                                    fontFamily: 'Georgia',
                                    fontSize: 8,
                                  ),
                                )
                              ], */
                            defaultRenderer: new charts.ArcRendererConfig(
                              arcWidth: 50,
                              arcRendererDecorators: [
                                charts.ArcLabelDecorator(
                                    labelPosition: charts.ArcLabelPosition.inside),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          // color: Colors.blueGrey,
                          height: height * 0.22,
                          width: width * 0.50,
                          child:Column(
                            children: <Widget>[
                              Container(
                                // color: Colors.blue,
                                height: height * 0.03,
                                width: width * 0.95,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                  children: <Widget>[
                                    Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          "Macro Breakdown",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18.0
                                          ),
                                        )),
                                    Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                              Container(
                                // color: Colors.blue,
                                height: height * 0.02,
                                width: width * 0.95,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                  children: <Widget>[
                                    Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          "              ",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )),
                                    Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Target",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey
                                          ),
                                        )),
                                    Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          "Actual",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Divider(
                                  height: 2.0,
                                  thickness: 4.0,
                                  color: Colors.grey,
                                ),
                              ),
                              Container(
                                // color: Colors.blue,
                                height: height * 0.03,
                                width: width * 0.95,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                  children: <Widget>[
                                    Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          "Proteins",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey
                                          ),
                                        )),
                                    Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "50%",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey
                                          ),
                                        )),
                                    Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          "25%",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                              Container(
                                // color: Colors.blue,
                                height: height * 0.03,
                                width: width * 0.95,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                  children: <Widget>[
                                    Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          "Carbs    ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey
                                          ),
                                        )),
                                    Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "30%",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey
                                          ),
                                        )),
                                    Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          "25%",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                              Container(
                                // color: Colors.blue,
                                height: height * 0.03,
                                width: width * 0.95,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                  children: <Widget>[
                                    Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          "Fats      ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey
                                          ),
                                        )),
                                    Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "20%",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey
                                          ),
                                        )),
                                    Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          "25%",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),


              Container(
                height: height * 0.1,
                width: width * 0.97,
                decoration: BoxDecoration(
                  // color: Palette.greyBackground,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),

              ),
            ],
          ),

                                       /////////// Progress Tracker (Training Week)/////////
        ProgressTracker(),

                                              ////////////// Food Diary////////////
          Container(height: 50,
            decoration: BoxDecoration(color: Palette.mainPurple,borderRadius: BorderRadius.circular(15.0)),
            child: FittedBox(
                fit: BoxFit.contain,
                child: Text('Food Diary',style: TextStyle(color: Colors.white,fontSize: 30),)),),
         FoodDiary(notifyParent: refresh,id: widget.id),

          Container(height: 50,
            decoration: BoxDecoration(color: Palette.mainPurple,borderRadius: BorderRadius.circular(15.0)),
            child: FittedBox(
                fit: BoxFit.contain,
                child: Text('Exercise Diary',style: TextStyle(color: Colors.white,fontSize: 30),)),),
       SizedBox(height: 3,),
          ExerciseDiary(),




        ],
      ));


  }
}








