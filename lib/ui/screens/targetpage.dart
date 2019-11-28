import 'package:flutter/material.dart';
import 'package:real_bodies/models/chart_data.dart';
import 'package:real_bodies/pages/add_food_main.dart';
import 'package:real_bodies/pages/exercise.dart';
import 'package:real_bodies/theme/my_flutter_app_icons.dart';
//import 'package:real_bodies/models/chart_data.dart';
import 'package:real_bodies/theme/palette.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart'
    as LiquidIndicator;
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:real_bodies/ui/widgets/category_item.dart';

//import 'add_food_main.dart';

class FoodTargetToday extends StatefulWidget {
  @override
  _FoodTargetTodayState createState() => _FoodTargetTodayState();
}

class _FoodTargetTodayState extends State<FoodTargetToday> {
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

    _seriesPieData = List<charts.Series<ChartData, String>>();
    _generateData();

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
//    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//        statusBarColor: Colors.green
//    ));
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Palette.mainPurple,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Center(
            child: Container(
              // height: height * 0.06,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  FittedBox(
                    fit: BoxFit.cover,
                    child: IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        color: Colors.white,
                        onPressed: () => {}),
                  ),
                  Text(
                    'Today',
                    style: TextStyle(color: Colors.white),
                  ),
                  FittedBox(
                    fit: BoxFit.cover,
                    child: IconButton(
                        icon: Icon(Icons.arrow_forward_ios),
                        color: Colors.white,
                        onPressed: () => {}),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: //87
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
              height: height * 0.06,
              width: width * 0.95,
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
                        "1600",
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
                        child: charts.PieChart(
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
                    Container(
                     color: Colors.blueGrey,
                      height: height * 0.22,
              width: width * 0.59,
               child:Column(
                 children: <Widget>[
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
                            "Macro Breakdown",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0
                            ),
                          )),
                           Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red
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
                            "1600",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red
                            ),
                          )),
                    ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(
                height: 2.0,
                color: Colors.orange,
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
                            "1600",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red
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
                            "1600",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red
                            ),
                          )),
                    ],
              ),
            ),
                 ],
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
        ));
  }
}
