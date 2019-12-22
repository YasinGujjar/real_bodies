import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:real_bodies/models/exercise.dart';
import 'package:real_bodies/models/program.dart';
import 'package:real_bodies/models/url.dart';
import 'package:real_bodies/models/weekly_meal.dart';
import 'package:real_bodies/theme/palette.dart';
import 'package:real_bodies/ui/screens/trainingpage.dart';
import 'package:http/http.dart' as http;

class ExercisePlan extends StatefulWidget {
  final int id;
  ExercisePlan({this.id});
  @override
  _ExercisePlanState createState() => _ExercisePlanState();
}

class _ExercisePlanState extends State<ExercisePlan> {
  Future selectedProgram;
  Future<List<ExerciseModel>> exerciseModelList;
  Future<List> plan;
  CarouselSlider carouselSlider;
  int _current = 0;
  List weeklyPlan = [
    //TrainingPage(),
    //TrainingPage(),
    Container(),
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));

    }

    return result;
  }

  void refresh(){
    setState(() {
    });
  }
  Future<List> getExercisePlan(int id) async{
    try{
      print(id);
      URL urldomain = URL();
      var url=urldomain.domain+"get_exercise_plan";
      final response =await http.get(url+"&id=$id");
      print('Response body:${response.body}');

      Iterable list = json.decode(response.body);
//
      List<ExerciseModel> eml = list.map((model)=>ExerciseModel.fromJson(model)).toList();

      List views = [];
//      eml.forEach((f){
//        views.add(TrainingPage(exerciseList: eml,));
//      });
      views.add(TrainingPage(id: widget.id,exerciseList: eml, trainingDay: 'Training Day 1'));
      views.add(TrainingPage(id: widget.id,exerciseList: eml, trainingDay: 'Training Day 2'));


      return views;
      //  wmpl.forEach((f)=>print(f.type));

    }catch(e){
      print('Error ouccured $e');
    }

  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   selectedProgram = getProgramPlan(widget.id);
   plan = getExercisePlan(widget.id);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Palette.mainPurple,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Center(child: Text("Exercise Plan"),)

      ),
      body: Column(
             children: <Widget>[

               Expanded(
                 flex: 4,
                 child: Column(
                   children: <Widget>[
                     SizedBox(height: 12,),
                     Center(child: Text('Your Current Plan',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                     SizedBox(height: 12,),
                     FutureBuilder<ProgramPlan>(
                       future: selectedProgram,
                       builder: (context , snapshot) {
                         if(snapshot.hasData) {
                           return Padding(
                             padding: const EdgeInsets.only(
                                 left: 40.0, right: 40.0),
                             child: Container(
                               height: 150,
                               decoration: BoxDecoration(
                                 color: Color(0xffBFAAA5),
                                 borderRadius: BorderRadius.circular(8.0),
                               ),
                               child: Padding(
                                 padding: const EdgeInsets.only(right: 20.0),
                                 child: Row(
                                   mainAxisAlignment: MainAxisAlignment
                                       .spaceBetween,
                                   children: <Widget>[
                                     Padding(
                                       padding: const EdgeInsets.only(
                                           top: 20.0, bottom: 8.0, left: 8.0),
                                       child: Column(
                                         mainAxisAlignment: MainAxisAlignment
                                             .spaceBetween,
                                         crossAxisAlignment: CrossAxisAlignment
                                             .start,
                                         children: <Widget>[
                                           Text('${snapshot.data.title}', style: TextStyle(
                                               color: Colors.white,
                                               fontWeight: FontWeight.bold,
                                               fontSize: 22),),
                                           Text('${snapshot.data.description}', style: TextStyle(
                                               color: Colors.white,
                                               fontWeight: FontWeight.bold,
                                               fontSize: 15),
                                             overflow: TextOverflow.ellipsis,
                                             textAlign: TextAlign.center,
                                             maxLines: 3,
                                           ),

                                           Container(
                                             height: 30,
                                             width: 100,
                                             child: FlatButton(
                                               shape: new RoundedRectangleBorder(
                                                 borderRadius: new BorderRadius
                                                     .circular(30.0),
                                               ),
                                               onPressed: () {},
                                               color: Palette.buttonjColor,
                                               textColor: Colors.white,
                                               child: FittedBox(
                                                 fit: BoxFit.contain,
                                                 child: Text("View Your Plan",
                                                     style: TextStyle(
                                                         fontSize: 14,
                                                         fontWeight: FontWeight
                                                             .bold)),
                                               ),
                                             ),
                                           ),
                                         ],
                                       ),
                                     ),
                                   ],
                                 ),
                               ),
                             ),
                           );
                         }
                         return CircularProgressIndicator();
                       }
                     ),
                     SizedBox(height: 5,),
                   ],
                 ),
               ),
               Expanded(
                 flex: 6,
                 child: FutureBuilder<List>(
                   future: plan,
                 builder:(context, snapshot) {
                     if(snapshot.hasData) {

                       return carouselSlider = CarouselSlider(
                         height: 370.0,
                         initialPage: 0,
                         enlargeCenterPage: true,
                         autoPlay: false,
                         reverse: false,
                         enableInfiniteScroll: false,
                         autoPlayInterval: Duration(seconds: 2),
                         autoPlayAnimationDuration: Duration(milliseconds: 2000),
                         pauseAutoPlayOnTouch: Duration(seconds: 10),
                         scrollDirection: Axis.horizontal,
                         onPageChanged: (index) {
                           setState(() {
                             _current = index;
                           });
                         },
                         items: snapshot.data.map((weekPlan) {
                           return Builder(
                             builder: (BuildContext context) {
                               return Container(
                                 width: MediaQuery
                                     .of(context)
                                     .size
                                     .width,
                                 child: weekPlan,
                               );
                             },
                           );
                         }).toList(),
                       );
                     }
                     else{
                       Center(child: CircularProgressIndicator());
                     }
                     return Center(child: CircularProgressIndicator());
                 }
                 ),
               ),
             ],
      ),
    );
  }
}


Future<ProgramPlan> getProgramPlan(int id) async{
  try{
    print(id);
    URL urldomain = URL();
    var url=urldomain.domain+"get_program";
    final response =await http.get(url+"&id=$id");
    print('Response body:${response.body}');
    print('yes');
    var jsonResponse = json.decode(response.body);
    print('no');
    ProgramPlan p =ProgramPlan();
    if(jsonResponse.length >0) {
      for (int i = 0; i <= jsonResponse.length - 1; i++) {
              p.title =  jsonResponse[i]['title'];
                  p.description = jsonResponse[i]['description'];
//      if(!_words.contains(jsonResponse[i]['name'])) {
//        _words.add(jsonResponse[i]['name']);
//      }

      }
    }
    return p;
  }catch(e){
    print('Error ouccured this $e');
  }
}
