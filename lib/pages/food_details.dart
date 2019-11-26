import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:real_bodies/models/chart_data.dart';
import 'package:real_bodies/ui/widgets/custom_dialogues.dart';
import 'package:charts_flutter/flutter.dart' as charts;


class FoodDetails extends StatefulWidget {



  @override
  _FoodDetailsState createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
  String lastSelectedValue;
  int _quantity = 0;

  int get servingQuantity => _quantity;


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




  void setQuantity(String text){
    print('yessssssssssssssssssssssssssssssssssssssssssssssssss');
    print(text);
    var myInt = int.parse(text);
    assert(myInt is int);
    setState(() {
      _quantity = myInt;
    });
  }


  void showDemoDialog({BuildContext context, Widget child}) {
    showCupertinoDialog<String>(
      context: context,
      builder: (BuildContext context) => child,
    ).then((String value) {
      if (value != null) {
        setState(() { lastSelectedValue = value; });
      }
    });
  }


  @override
  Widget build(BuildContext context) {
  //  var serving = FoodValues.of(context).servings;
   // double abovePadding = MediaQuery.of(context).padding.top;
    //double appBarHeight = kToolbarHeight;
   // double height = MediaQuery.of(context).size.height - kToolbarHeight;
    double width = MediaQuery.of(context).size.width;
    _seriesPieData = List<charts.Series<ChartData, String>>();
    _generateData();


    return Scaffold(
      appBar: AppBar(title: Text('Mango'),),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 5,),
          Container(
            height: 50,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Text('Food Name'),
            ),
          ),
          Divider(height:5,color: Colors.grey,),
          SizedBox(height: 5,),
          InkWell(
            onTap: (){
              showDialog(context: context,
            builder: (BuildContext context) => FoodValues
              (
                foodDetailsState: this,
                child: FoodDialogue()));
            },
            child: Container(
              height: 30,
              child: Padding(
                padding: EdgeInsets.only(left: 10,right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FittedBox(
                      fit: BoxFit.contain,
                      child: Text('Servings'),
                    ),

                    FittedBox(
                      fit: BoxFit.contain,
                      child: Text('Servings $servingQuantity'),
                    ),

                  ],
                ),
              ),
            ),
          ),
          Divider(height:5,color: Colors.grey,),
          SizedBox(height: 5,),
          Container(
            height: 30,
            child: Padding(
              padding: EdgeInsets.only(left: 10,right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FittedBox(
                    fit: BoxFit.contain,
                    child: Text('Serving Size'),
                  ),

                  FittedBox(
                      fit: BoxFit.contain,
                      child: Text('Servings'),
                    ),

                ],
              ),
            ),
          ),
          Divider(height:5,color: Colors.grey,),
          SizedBox(height: 5,),

          Center(child: Container(height: 30, child: Text('Nutrients details'),)),
          Center(child: Container(height: 150,width: 150, child: charts.PieChart(
            _seriesPieData,
            animate: false,
            animationDuration: Duration(seconds: 1),

            defaultRenderer: new charts.ArcRendererConfig(
              arcWidth: 30,


            ),
          ),)
            ,),
          SizedBox(height: 10,),
          Padding(padding: EdgeInsets.only(left: 35,right: 35),
            child: Center(child: Container(height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        height: 20,
                        width: 20,
                        color: Colors.green,),

                      FittedBox(
                        fit: BoxFit.contain,
                        child: Text('  Protein 95%'),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        height: 20,
                        width: 20,
                        color: Colors.amber,),
                      FittedBox(
                        fit: BoxFit.contain,
                        child: Text('  Carbs 5%'),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        height: 20,
                        width: 20,
                        color: Colors.blue,),
                      FittedBox(
                        fit: BoxFit.contain,
                        child: Text('  Fats 2%'),
                      ),
                    ],
                  ),

                ],
              ),
            ),),),


          Divider(height:5,color: Colors.grey,),




          CupertinoButton.filled(
            child: const Text('Alert'),
            onPressed: () => _onAlertPress(context),
          ),
        ],

      ),
    );
  }

  void _onAlertPress(BuildContext context) {
    showDemoDialog(
      context: context,
      child: CupertinoAlertDialog(
        title: const Text('Discard draft?'),
        actions: <Widget>[
          CupertinoDialogAction(
            child: const Text('Discard'),
            isDestructiveAction: true,
            onPressed: () => Navigator.pop(context, 'Discard'),
          ),
          CupertinoDialogAction(
            child: const Text('Cancel'),
            isDefaultAction: true,
            onPressed: () => Navigator.pop(context, 'Cancel'),
          ),
        ],
      ),
    );
  }
}

class FoodValues extends  InheritedWidget{
  //final int servings;
  final _FoodDetailsState foodDetailsState;

  FoodValues({
    Key key,
    @required Widget child,
    @required this.foodDetailsState,

  }): super(key: key, child: child);


  static FoodValues of(BuildContext context){
    return context.inheritFromWidgetOfExactType(FoodValues);
  }


  @override
  bool updateShouldNotify(FoodValues oldFValues){
    return this.foodDetailsState.servingQuantity != oldFValues.foodDetailsState.servingQuantity;
  }


}