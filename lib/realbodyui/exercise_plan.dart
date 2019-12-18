import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:real_bodies/theme/palette.dart';
import 'package:real_bodies/ui/screens/trainingpage.dart';

class ExercisePlan extends StatefulWidget {
  @override
  _ExercisePlanState createState() => _ExercisePlanState();
}

class _ExercisePlanState extends State<ExercisePlan> {
  CarouselSlider carouselSlider;
  int _current = 0;
  List weeklyPlan = [
    TrainingPage(),
    TrainingPage(),
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));

    }

    return result;
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
      body: ListView(
             children: <Widget>[
               SizedBox(height: 20,),
               Text('Your Current Plan',style: TextStyle(fontSize: 18),),
               Padding(
                 padding: const EdgeInsets.only(left:20.0, right: 20.0),
                 child: Container(
                   height:  130,
                   decoration: BoxDecoration(
                     color: Color(0xffBFAAA5),
                     borderRadius: BorderRadius.circular(8.0),
                   ),
                   child: Padding(
                     padding: const EdgeInsets.only(right:20.0),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: <Widget>[
                         Padding(
                           padding: const EdgeInsets.only(top:20.0,bottom: 8.0,left: 8.0),
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: <Widget>[
                               Text('Weight Loss',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),),
                               Container(
                                 height: 30,
                                 width: 80,
                                 child: FlatButton(
                                   shape: new RoundedRectangleBorder(
                                     borderRadius: new BorderRadius.circular(30.0),
                                   ),
                                   onPressed: () {},
                                   color: Palette.buttonjColor,
                                   textColor: Colors.white,
                                   child: Text("Select",
                                       style: TextStyle(fontSize: 14,
                                           fontWeight: FontWeight.bold)),
                                 ),
                               ),
                             ],
                           ),
                         ),
                         Image.asset('assets/images/bodgoal1.png'),
                       ],
                     ),
                   ),
                 ),
               ),
               SizedBox(height: 5,),

               carouselSlider = CarouselSlider(
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
                 items: weeklyPlan.map((weekPlan) {
                   return Builder(
                     builder: (BuildContext context) {
                       return Container(
                         width: MediaQuery.of(context).size.width,

                        child: weekPlan,
                       );
                     },
                   );
                 }).toList(),
               ),


             ],
      ),
    );
  }
}


class WeeklyPlanCoursel extends StatefulWidget {
  @override
  _WeeklyPlanCourselState createState() => _WeeklyPlanCourselState();
}

class _WeeklyPlanCourselState extends State<WeeklyPlanCoursel> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}




