import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:real_bodies/models/url.dart';
import 'package:real_bodies/pages/exercise_diary.dart';
import 'package:real_bodies/pages/progress_tracker.dart';
import 'package:real_bodies/realbodyui/show_weight.dart';
import 'package:real_bodies/theme/palette.dart';
import 'package:real_bodies/models/chart_data.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:real_bodies/ui/widgets/custom_alert_dialog.dart';
import 'package:real_bodies/ui/widgets/custom_text_field.dart';
import 'package:real_bodies/ui/widgets/newcarousel.dart';
import 'package:real_bodies/ui/widgets/weight_chart.dart';

class ProgressTrackerWeight extends StatefulWidget {
  final int id;
  ProgressTrackerWeight({this.id});
  @override
  _ProgressTrackerWeightState createState() => _ProgressTrackerWeightState();
}

class _ProgressTrackerWeightState extends State<ProgressTrackerWeight> {

 static final String uploadEndPoint=URL.urlmain+"upload_image";
  final TextEditingController _newweight = new TextEditingController();
 CustomTextField _weightField;
  CustomTextField _imageField;
 Color add=Palette.mainPurple;
 Color my =Colors.grey;
  bool addWeight=false;
 Future<List> imgList;
 URL urldomain =URL();
 String status='';
 Future<File> file;
 String base64Image; 
 File tempFile;
 String errormsg="Error Uploading";


 chooseimg(){
   setState(() {
     
   });
file=ImagePicker.pickImage(source: ImageSource.gallery);
 }
 setStatus(String msg)
 {
   setState(() {
     status=msg;
   });
 }

 startupload(){
   setStatus("Uploading Image...");
if(null==tempFile)
{
  setStatus(errormsg);
return;
}
String filename=tempFile.path.split('/').last;
upload(filename);
 }

 upload(String filename){
   print("uuuuuuuuuuuuuuuuuuuuuuuuuuu"+filename+"kkkk"+_newweight.text);
http.post(uploadEndPoint,body: {
  "id":widget.id.toString(),
  "image": base64Image,
  "name": filename,
  "weight":_newweight.text,
  "date": DateTime.now().toString()
}).then((result){
  print(result.body);
  setStatus(result.statusCode==200 ? result.body: errormsg);
}).catchError((error){
  setStatus(error);
});
 }

 Widget showimage(){
   return FutureBuilder<File>(
     future: file,
     builder: (BuildContext context, AsyncSnapshot<File> snapshot)
     {
       if(snapshot.connectionState==ConnectionState.done && null!=snapshot.data)
       {
         tempFile=snapshot.data;
         base64Image=base64Encode(snapshot.data.readAsBytesSync());
         return Container(
           height: 200,
            width: MediaQuery.of(context).size.width*0.5,
           child: Image.file(snapshot.data,fit:BoxFit.fill,),
         );
       }
       else if(null!=snapshot.error)
       {
         return const Text("Error picking img");
       }
       else
       {
         return const Text("No Image Selected");
       }
     },
   );
 }

 Future<List> checkinfo() async
  {
    try
    {
      print("id weight"+widget.id.toString());
      print(DateTime.now().toString());
      var url=urldomain.domain+"get_weight_record";
      final response=await http.get(url+"&id="+widget.id.toString());
      print('Response body:${response.body}');
      var jsonResponse=json.decode(response.body);
      List image = [];
      for(int i=0; i<jsonResponse.length; i++){
        image.add([urldomain.imgdomain+jsonResponse[i]['image'],jsonResponse[i]['date'] ,jsonResponse[i]['weight']]);
// weightList.add(jsonResponse[i]['weight']);

      }
      return image;
      print(imgList);
//return imgList;
    }
    catch(e)
    {
      print("Exception on way $e");
    }
  }
  Widget _addweight()
  {return Container(
    //color: Colors.blue,
    width: 200,
    height: 200,
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 5.0,
          ),
          _weightField,
          SizedBox(
            height: 10,
          ),
          Row(
            children: <Widget>[
              showimage(),
              SizedBox(width: 30.0,),
              OutlineButton(
                onPressed: chooseimg,
                child: Text("Choose Image"),
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
           /*  SizedBox(
            height: 40.0,
          ), */
          Text(status,textAlign: TextAlign.center,style: TextStyle(color: Colors.green)),
          Container(
            width: 200,
            child: FlatButton(
                       //color: Palette.mainPurple,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          child: Text(
                            "Add Weight",
                            softWrap: true,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Palette.mainPurple,
                              decoration: TextDecoration.none,
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              fontFamily: "OpenSans",
                            ),
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          side: BorderSide(
                            color: Palette.mainPurple,
                            width: 2,
                          ),
                        ),
                        onPressed: () {
                          if(_newweight.text!="")
                          {
                            startupload();
                          }
                          else
                          {
                             showDialog(context: context,
builder: (BuildContext context) {
  return CustomAlertDialog(title: "Alert!",content: "Must Fill the Weight",);
});
                          }
                          
                        },
                      ),
          ),
        ],
      ),
    ),
  );

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
  void initState() {
    // TODO: implement initState
    super.initState();
     checkinfo();
     _weightField = new CustomTextField(
      baseColor: Colors.grey,
       borderColor: Colors.grey[400],
      errorColor: Colors.red,
      controller: _newweight,
      hint: "Add New Weight",
      inputType: TextInputType.number,
      //validator: Validator.validateName,
    );
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
          title: Center(child: Text("Progress Tracker"),)
          
      ),
      body:ListView(
        children: <Widget>[
          ProgressTracker(),
         
       SizedBox(height: 3,),
          ExerciseDiary(title: "Logged Exercises",),
          SizedBox(height: 8,),
           Container(height: 50,
            decoration: BoxDecoration(color: Palette.mainPurple,borderRadius: BorderRadius.circular(15.0)),
            child: Center(
              child: Container(
                child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text('Food Tracker',style: TextStyle(color: Colors.white,fontSize: 30),)),
              ),
            ),),
                  SizedBox(height: 8,),
                 Padding(
                   padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                   child: Container(
                    height: 20,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: <Widget>[
                      Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Average Daily Calories",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17.0
                            ),
                          )),
                      Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "1800",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17.0
                            ),
                          )),
                    ],
                ),
              ),
                 ),
              Padding(
                padding: const EdgeInsets.only(left:8.0,right: 8.0),
                child: Container(
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
                            "Total Logged Days",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                      Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "7 Days",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.red
                            ),
                          )),
                    ],
                  ),
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
 SizedBox(height: 8,),
           Container(height: 50,
            decoration: BoxDecoration(color: Palette.mainPurple,borderRadius: BorderRadius.circular(15.0)),
            child: Center(
              child: Container(
                //color: Colors.blue,
                child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text('Weight Progress',style: TextStyle(color: Colors.white,fontSize: 30),)),
              ),
            ),),
                  SizedBox(height: 8,),
                    Padding(
                   padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                   child: Container(
                    height: 20,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: <Widget>[
                      Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Start Weight",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17.0
                            ),
                          )),
                      Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "78 Kg",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17.0
                            ),
                          )),
                    ],
                ),
              ),
                 ),  Padding(
                   padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                   child: Container(
                    height: 20,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: <Widget>[
                      Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Current Weight",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17.0
                            ),
                          )),
                      Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "74 Kg",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17.0
                            ),
                          )),
                    ],
                ),
              ),
                 ),  Padding(
                   padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                   child: Container(
                    height: 20,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: <Widget>[
                      Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Total Weight Lost",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17.0
                            ),
                          )),
                      Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "5 Kg",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17.0
                            ),
                          )),
                    ],
                ),
              ),
                 ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: WeightChart(),
                  ),
                  SizedBox(height: 10.0,),
                   Container(
        width:width ,
        height:height* 0.15,
        //color: Colors.blue,
        child: Column(
          children: <Widget>[
           
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                //mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                 
                  
                  Container(
                    width: width*0.3,
                    child: FlatButton(
                     //color: Palette.mainPurple,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Text(
                          "Add Weight",
                          softWrap: true,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: add,
                            decoration: TextDecoration.none,
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                            fontFamily: "OpenSans",
                          ),
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        side: BorderSide(
                          color: add,
                          width: 2,
                        ),
                      ),
                      onPressed: () {
setState(() {
  addWeight=true;
  add=Colors.grey;
  my=Palette.mainPurple;
});
                      },
                    ),
                  ),
                   Padding(
                     padding: const EdgeInsets.only(left:12.0),
                     child: Container(
                       width: width*0.3,
                       child: FlatButton(
                       //color: Palette.mainPurple,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          child: Text(
                            "My Weight",
                            softWrap: true,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color:my,
                              decoration: TextDecoration.none,
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                              fontFamily: "OpenSans",
                            ),
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          side: BorderSide(
                            color: my,
                            width: 2,
                          ),
                        ),
                        onPressed: () {
                          setState(() {
  addWeight=false;
  add=Palette.mainPurple;
  my=Colors.grey;
 // checkinfo();
});
                        },
                  ),
                     ),
                   ),

                ],
              ),
            ),
            Text("Add more Photos to control your process",style: TextStyle(fontWeight: FontWeight.w600),)
          ],
        ),
      ),
      
            Container(
              height: height*0.60,
               
            //  color: Colors.yellow,
 child:
 addWeight ? _addweight() : Column(
   mainAxisSize: MainAxisSize.max ,
   children: <Widget>[
     FutureBuilder<List>(
       future: checkinfo(),
       
       builder: (context,snapshot){ 
         if (snapshot.hasData) {
              return    CarouselDemo(id:widget.id,img :snapshot.data,);

         }
         else{
           return CircularProgressIndicator();
         }
        // return CircularProgressIndicator();
       }
       ),
             
                              Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Your weight progress",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 21.0),
                                  )),   
   ],
 ),
             ),



        ],
      ) ,
    );
  }
}