import 'package:flutter/material.dart';
import 'package:real_bodies/models/chart_data.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:real_bodies/theme/palette.dart';
import 'package:pie_chart/pie_chart.dart';


class SearchAddFood extends StatefulWidget {
  @override
  _SearchAddFoodState createState() => _SearchAddFoodState();
}

class _SearchAddFoodState extends State<SearchAddFood> {

  Map<String, double> dataMap = Map();
  List<Color> colorList = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
  ];

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


    dataMap.putIfAbsent("Flutter", () => 5);
    dataMap.putIfAbsent("React", () => 3);
    dataMap.putIfAbsent("Xamarin", () => 2);
    dataMap.putIfAbsent("Ionic", () => 2);


    _seriesPieData = List<charts.Series<ChartData, String>>();
    _generateData();

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Palette.mainPurple,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Center(child: Text('Search Add Food'),)
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
                      ),
                  ),
                ],
              ),
            ),

            Container(
              height: height * 0.20,
              width: width * 0.95,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        "Egg Whites",
                        style: TextStyle(
                         // fontWeight: FontWeight.bold,
                          fontSize: 36
                        ),
                      ),
                    ),
                  ),


                  Expanded(
                    child: Container(
                      height: 200,
                      width: 200,
                      child: Center(
                        child: PieChart(
                          dataMap: dataMap,
                          animationDuration: Duration(milliseconds: 800),
                          chartLegendSpacing: 32.0,
                          chartRadius: MediaQuery.of(context).size.width / 2.7,
                          showChartValuesInPercentage: true,
                          showChartValues: true,
                          showChartValuesOutside: false,
                          chartValueBackgroundColor: Colors.grey[200],
                          colorList: colorList,
                          showLegends: false,
                          legendPosition: LegendPosition.right,
                          decimalPlaces: 1,
                          showChartValueLabel: true,
                          initialAngle: 0,
                          chartValueStyle: defaultChartValueStyle.copyWith(
                            color: Colors.blueGrey[900].withOpacity(0.9),
                          ),
                          chartType: ChartType.disc,
                        )
                      ),
                    ),
                  ),

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
        ));
  }
}
