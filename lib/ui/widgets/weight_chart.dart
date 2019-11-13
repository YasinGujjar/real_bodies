import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class WeightChart extends StatefulWidget {



  @override
  _WeightChartState createState() => _WeightChartState();
}

class _WeightChartState extends State<WeightChart> {
   List<charts.Series<LinearSales, int>> seriesList;
   bool animate;

    _createSampleData() {
     var data = [
       new LinearSales(0, 5),
       new LinearSales(1, 25),
       new LinearSales(2, 100),
       new LinearSales(3, 75),
     ];

       seriesList.add(charts.Series(
         data: data,
         id: 'Sales',
         colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
         domainFn: (LinearSales sales, _) => sales.year,
         measureFn: (LinearSales sales, _) => sales.sales,

       ));

   }

  @override
  Widget build(BuildContext context) {
      seriesList = List<charts.Series<LinearSales, int>>();
     _createSampleData();
    return new Container(
      width: 200,
      height: 200,
      color: Colors.white,
      child:
    charts.LineChart(seriesList,
        animate: animate,
        defaultRenderer: new charts.LineRendererConfig(includePoints: true)),
    );
  }



}





/// Sample linear data type.
class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}
