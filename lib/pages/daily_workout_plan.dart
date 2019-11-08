

import 'package:flutter/material.dart';
import 'package:real_bodies/theme/palette.dart';
import 'package:real_bodies/ui/widgets/middle_slivr_bar.dart';
import 'package:real_bodies/ui/widgets/silver_app_bar.dart';


class DailyWorkOutPlan extends StatefulWidget {
  @override
  _DailyWorkOutPlanState createState() => _DailyWorkOutPlanState();
}

class _DailyWorkOutPlanState extends State<DailyWorkOutPlan> {
  @override
  Widget build(BuildContext context) {

   double width = MediaQuery.of(context).size.width;
  //  double height = MediaQuery.of(context).size.height;
    return SafeArea(
   child: Theme(
     data: Theme.of(context).copyWith(
       canvasColor: Colors.transparent
     ),
     child: Material(


     //   child:    Container(
         // color: Colors.transparent,
         // color: Colors.blue,
          child: CustomScrollView(


            slivers:[

              SliverPersistentHeader(
                delegate: MySliverAppBar(expandedHeight: 200),
                pinned: true,
              ),




              SliverPersistentHeader(
                delegate: MiddleSliverAppBar(expandedHeight: 70, title:'30 minutes'),
                //delegate: ,
                floating: false,
               pinned: true,
              ),
              SliverPersistentHeader(
                delegate: MiddleSecondSliverAppBar(expandedHeight: 28),
                //delegate: ,
                pinned: true,
                floating: false,
              ),

          SliverList(
              delegate: SliverChildListDelegate(
                [
               Stack(
                 children: <Widget>[
                  Container(

//                 decoration: BoxDecoration(
//                   color: Palette.mainPurple,
//                   borderRadius: BorderRadius.only(topLeft: Radius.elliptical(70,40),topRight: Radius.elliptical(70,40)),
//
//                 ),

                  child:

                    Column(
                     children: <Widget>[
//                     SizedBox(
//                       height: height * 0.10,
//                     ),


                       Container(
                        // height: height - height *0.20,
                         color: Colors.white,
                         height: 20,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.only(topLeft: Radius.elliptical(70,40),topRight: Radius.elliptical(70,40)),
//
//                       ),
                       ),

                       Container(
                         width: width,

                         color: Colors.white,
                         child: Column(
                           children: <Widget>[
                           Card(
                           elevation: 8.0,
                           margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                           child: Container(
                             decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
                             child: makeListTile,
                           ),
                         ),
                           ],
                         ),
                       ),
                       Container(
                         width: width,

                         color: Colors.white,
                         child: Column(
                           children: <Widget>[
                             Card(
                               elevation: 8.0,
                               margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                               child: Container(
                                 decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
                                 child: makeListTile,
                               ),
                             ),
                           ],
                         ),
                       ),
                       Container(
                         width: width,

                         color: Colors.white,
                         child: Column(
                           children: <Widget>[
                             Card(
                               elevation: 8.0,
                               margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                               child: Container(
                                 decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
                                 child: makeListTile,
                               ),
                             ),
                           ],
                         ),
                       ),
                       Container(
                         width: width,

                         color: Colors.white,
                         child: Column(
                           children: <Widget>[
                             Card(
                               elevation: 8.0,
                               margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                               child: Container(
                                 decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
                                 child: makeListTile,
                               ),
                             ),
                           ],
                         ),
                       ),
                       Container(
                         width: width,

                         color: Colors.white,
                         child: Column(
                           children: <Widget>[
                             Card(
                               elevation: 8.0,
                               margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                               child: Container(
                                 decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
                                 child: makeListTile,
                               ),
                             ),
                           ],
                         ),
                       ),


                     ],
                   ),
                  ),
        ],
               ),
              ],
              ),
          ),

],


          ),
       // ),
     ),
   ),
    );
  }
}


final makeListTile = ListTile(
    contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
    leading: Container(
      padding: EdgeInsets.only(right: 12.0),
      decoration: new BoxDecoration(
          border: new Border(
              right: new BorderSide(width: 1.0, color: Colors.white24))),
      child: Icon(Icons.autorenew, color: Colors.white),
    ),
    title: Text(
      "Introduction to Driving",
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    ),
    // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

    subtitle: Row(
      children: <Widget>[
        Icon(Icons.linear_scale, color: Colors.yellowAccent),
        Text(" Intermediate", style: TextStyle(color: Colors.white))
      ],
    ),
    trailing:
    Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0));