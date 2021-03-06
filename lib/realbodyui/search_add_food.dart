import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:real_bodies/models/chart_data.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:real_bodies/models/food.dart';
import 'package:real_bodies/models/url.dart';
import 'package:real_bodies/realbodyui/dashboard.dart';
import 'package:real_bodies/realbodyui/food_exercise_diary.dart';
import 'package:real_bodies/theme/palette.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:http/http.dart' as http;
import 'package:real_bodies/ui/widgets/custom_alert_dialog.dart';



class SearchAddFood extends StatefulWidget {
  final Food food;
  final int id;
  final String category;
  final String calorie;
  final String incalorie;
  

  SearchAddFood({this.food,this.id,this.category,this.calorie,this.incalorie});

  @override
  _SearchAddFoodState createState() => _SearchAddFoodState();
}

class _SearchAddFoodState extends State<SearchAddFood> {

  int _quantity = 1;

  Map<String, double> dataMap = Map();
  List<Color> colorList = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.teal,
    Colors.purple,
    Colors.yellowAccent,
    Colors.deepOrange,
   // Colors.yellow,
  ];

  List<charts.Series<ChartData, String>> _seriesPieData;
  _generateData() {
    var pieData = [
      ChartData('Protein', widget.food.proteins, Colors.blue),
      ChartData('Carbs', widget.food.carbohydrates, Colors.green),
      ChartData('Fats', widget.food.fat, Colors.amber),
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


    dataMap.putIfAbsent("Flutter", () => (widget.food.proteins / (widget.food.proteins+widget.food.carbohydrates+widget.food.fat) * 10));
    dataMap.putIfAbsent("React", () => widget.food.carbohydrates / (widget.food.proteins+widget.food.carbohydrates+widget.food.fat) * 10);
    dataMap.putIfAbsent("Xa", () => widget.food.fat / (widget.food.proteins+widget.food.carbohydrates+widget.food.fat) * 10);
    //dataMap.putIfAbsent("marin", () => widget.food.sodium * 0.01);
    //dataMap.putIfAbsent("Xamrin", () => widget.food.fatPoly * 0.01);
   // dataMap.putIfAbsent("Xrin", () => widget.food.fatMono * 0.01);
  //  dataMap.putIfAbsent("Xn", () => widget.food.fatSaturate * 0.01);
 //   dataMap.putIfAbsent("Ionic", () => 2);


    _seriesPieData = List<charts.Series<ChartData, String>>();
    _generateData();


    void addFood() async{
      URL urlDomain = URL();
      try {
        var url = urlDomain.domainfood + 'get_food';
        final response=await http.get(url+"&name="+widget.food.name);
        print('Response body:${response.body}');
        if(response.body == 'sucess'){
          print('yes');
        }

      } catch(e){

      }
    }

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
        Container(
          height: height - kToolbarHeight -  MediaQuery.of(context).padding.top,
          width: width,
          child: Column(
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
                        ),),
                    Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                         
                          widget.calorie,
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
                         widget.incalorie==null ? "0" : widget.incalorie,
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
                height: height * 0.22,
                width: width * 0.95,
                child: Row(

                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "${widget.food.name}",
                            style: TextStyle(
                             // fontWeight: FontWeight.bold,
                              fontSize: 22
                            ),

                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                          Text('Weight'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text('Calorires'),
                              Text('300')
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: PieChart(
                        dataMap: dataMap,
                        animationDuration: Duration(milliseconds: 800),
                        chartLegendSpacing: 32.0,
                        chartRadius: MediaQuery.of(context).size.width / 2.7,
                        showChartValuesInPercentage: true,
                        showChartValues: true,
                        showChartValuesOutside: true,
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
                      ),
//                    child: Container(height: 250,
//                      width: 250,
//                      child:  charts.PieChart(
//                        _seriesPieData,
//                        animate: true,
//                        animationDuration: Duration(seconds: 1),
//                          behaviors: [
//                                charts.DatumLegend(
////                                  outsideJustification:
////                                      charts.OutsideJustification.middle,
//                                  horizontalFirst: true,
//                                  desiredMaxRows: 1,
//                                  cellPadding: EdgeInsets.only(right: 2.0,),
//                                  entryTextStyle: charts.TextStyleSpec(
//                                    color: charts.MaterialPalette.black.darker,
//                                    fontFamily: 'Georgia',
//                                    fontSize: 8,
//                                  ),
//                                )
//                              ],
//                        defaultRenderer: new charts.ArcRendererConfig(
//                          arcWidth: 100,
//                          arcRendererDecorators: [
//                            charts.ArcLabelDecorator(
//                                labelPosition: charts.ArcLabelPosition.auto),
//                          ],
//                        ),
//                      ),
//                    ),
                    ),

                  ],
                ),
              ),







            Divider(height: height * 0.01),
              SizedBox(height: height * 0.01,),
              Container(
                height: height * 0.05,
                  width: width * 0.60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                     Text('Protein'),
                      Text('${widget.food.proteins}g'),
                    ],
                  ),
              ),

              Container(
                height: height * 0.05,
                width: width * 0.60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Carbohydrates'),
                    Text('${widget.food.carbohydrates}g'),
                  ],
                ),),
              Container(
                height: height * 0.05,
                width: width * 0.60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Fat'),
                    Text('${widget.food.fat}g'),
                  ],
                ),),
              Container(
                height: height * 0.05,
                width: width * 0.60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Sodium'),
                    Text('${widget.food.sodium}g'),
                  ],
                ),),
              Container(
                height: height * 0.05,
                width: width * 0.60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Fats (Saturate)'),
                    Text('${widget.food.fatSaturate}g'),
                  ],
                ),),
              Container(
                height: height * 0.05,
                width: width * 0.60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Fats (Poly)'),
                    Text('${widget.food.fatPoly}'),
                  ],
                ),),
              Container(
                height: height * 0.05,
                width: width * 0.60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Fats (Mono)'),
                    Text('${widget.food.fatMono}g'),
                  ],
                ),),


              Container(
                height: height * 0.12,
                width: width * 0.8,
                child: Center(
                  child:  Container(
                  //  height: height * 0.13,
                    //width: width * 0.8,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: height * 0.08,
                          width:  width * 0.8,
                          child: FlatButton(
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0),
                            ),
                            onPressed: () async{
                              saveFoodOnServer(widget.id, widget.category,widget.food.id);

                              /*  showDialog(context: context,
builder: (BuildContext context) {
  return CustomAlertDialog(title: "Success!",content: "Food Added",);
});
print("calllll"+widget.calorie); */
//print("calllll"+widget.name);
                              Navigator.of(context)
                .pushReplacement(MaterialPageRoute(builder: (context) => DashBoard(id: widget.id,calorie: widget.calorie,indexnumber: 2))); 
                               
                            },
                            color: Palette.mainPurple,
                            textColor: Colors.white,
                            child: Text("add food".toUpperCase(),
                                style: TextStyle(fontSize: 14,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}




void saveFoodOnServer(int id, String category, int foodId) async
{
  print(id.toString());
  print(category);
  DateTime nowTime = DateTime.now();
  URL urldomain = URL();
  var url=urldomain.domainfood+"add_food";

  final response =await http.get(url+"&id="+id.toString()+"&food_id="+foodId.toString()+"&category="+category+"&date="+nowTime.toString());

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    // r Post.fromJson(json.decode(response.body));
    print('Response body:${response.body}');
    

  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}