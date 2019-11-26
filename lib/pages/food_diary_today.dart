import 'package:flutter/material.dart';
import 'package:real_bodies/models/chart_data.dart';
import 'package:real_bodies/pages/exercise.dart';
import 'package:real_bodies/theme/my_flutter_app_icons.dart';
//import 'package:real_bodies/models/chart_data.dart';
import 'package:real_bodies/theme/palette.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart'
    as LiquidIndicator;
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:real_bodies/ui/widgets/category_item.dart';

import 'add_food_main.dart';

class FoodDiaryToday extends StatefulWidget {
  @override
  _FoodDiaryTodayState createState() => _FoodDiaryTodayState();
}

class _FoodDiaryTodayState extends State<FoodDiaryToday> {
  List<charts.Series<ChartData, String>> _seriesPieData;
  _generateData() {
    var pieData = [
      ChartData('Protein', 2.0, Colors.blue),
      ChartData('Carbs', 90.0, Colors.green),
  ChartData('Fats', 8.0, Colors.amber),
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
              height: height * 0.02,
            ),
            Container(
              // height: height * 0.15,
              //        width: width * 0.97,

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: height * 0.03,
                    width: width * 0.95,
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Today's targest",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ),
                  Container(
                    height: height * 0.05,
                    width: width * 0.95,
                    child: LiquidIndicator.LiquidLinearProgressIndicator(
                      value: 0.50, // Defaults to 0.5.
                      valueColor: AlwaysStoppedAnimation(Palette
                          .mainPurple), // Defaults to the current Theme's accentColor.
                      backgroundColor: Palette
                          .lightPurple, // Defaults to the current Theme's backgroundColor.
                      borderColor: Palette.darkPurple,
                      borderWidth: 2.0,
                      borderRadius: 12.0,
                      direction: Axis
                          .horizontal, // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.horizontal.
                      center: Text(
                        "1000/2000 calories",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: height * 0.025,
            ),

            Container(
              height: height * 0.03,
              width: width * 0.95,
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Nutrients Details",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Card(
                elevation: 4.0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: height * 0.32,
                    width: width * 0.97,
                    child: charts.PieChart(
                      _seriesPieData,
                      animate: true,
                      animationDuration: Duration(seconds: 1),
                      behaviors: [
                        charts.DatumLegend(
                          outsideJustification:
                              charts.OutsideJustification.endDrawArea,
                          horizontalFirst: false,
                          desiredMaxRows: 2,
                          cellPadding: EdgeInsets.only(right: 2.0, bottom: 2.0),
                          entryTextStyle: charts.TextStyleSpec(
                            color: charts.MaterialPalette.black.darker,
                            fontFamily: 'Georgia',
                            fontSize: 10,
                          ),
                        )
                      ],
                      defaultRenderer: new charts.ArcRendererConfig(
                        arcWidth: 100,
                        arcRendererDecorators: [
                          charts.ArcLabelDecorator(
                              labelPosition: charts.ArcLabelPosition.outside),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            Container(
              height: height * 0.03,
              width: width * 0.95,
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Log Food",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            ),
            Container(
              height: height * 0.33,
              width: width * 0.97,
              decoration: BoxDecoration(
                // color: Palette.greyBackground,
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: FittedBox(
                              fit: BoxFit.contain,
                              child: CategoryItem(
                                name: 'BreakFast',
                                icon: MyFlutterApp.free_breakfast,
                                color: Colors.black,
                                elevation: 3.0,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AddFoodMain()),
                                  );
                                },
                                bgColor: Palette.greyBackground,
                                click: Palette.greyBackground,
                              )),
                        ),
                        Expanded(
                          child: FittedBox(
                              fit: BoxFit.contain,
                              child: CategoryItem(
                                name: 'Lunch',
                                icon: MyFlutterApp.food,
                                color: Colors.black,
                                elevation: 3.0,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AddFoodMain()),
                                  );
                                },
                                bgColor: Palette.greyBackground,
                                click: Palette.greyBackground,
                              )),
                        ),
                        Expanded(
                          child: FittedBox(
                              fit: BoxFit.contain,
                              child: CategoryItem(
                                name: 'Dinner',
                                icon: MyFlutterApp.dinner,
                                color: Colors.black,
                                elevation: 3.0,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AddFoodMain()),
                                  );
                                },
                                bgColor: Palette.greyBackground,
                                click: Palette.greyBackground,
                              )),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: FittedBox(
                              fit: BoxFit.contain,
                              child: CategoryItem(
                                name: 'Morning\n Snacks',
                                icon: MyFlutterApp.fast_food,
                                color: Colors.black,
                                elevation: 3.0,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AddFoodMain()),
                                  );
                                },
                                bgColor: Palette.greyBackground,
                                click: Palette.greyBackground,
                              )),
                        ),
                        Expanded(
                          child: FittedBox(
                              fit: BoxFit.contain,
                              child: CategoryItem(
                                name: 'Afternoon\n  Snacks',
                                icon: MyFlutterApp.fast_food,
                                color: Colors.black,
                                elevation: 3.0,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AddFoodMain()),
                                  );
                                },
                                bgColor: Palette.greyBackground,
                                click: Palette.greyBackground,
                              )),
                        ),
                        Expanded(
                          child: FittedBox(
                              fit: BoxFit.contain,
                              child: CategoryItem(
                                name: 'Evening\nSnacks',
                                icon: MyFlutterApp.fast_food,
                                color: Colors.black,
                                elevation: 3.0,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AddFoodMain()),
                                  );
                                },
                                bgColor: Palette.greyBackground,
                                click: Palette.greyBackground,
                              )),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 9,
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
