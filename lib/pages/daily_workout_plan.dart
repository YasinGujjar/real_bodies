

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

  //  double width = MediaQuery.of(context).size.width;
  //  double height = MediaQuery.of(context).size.height;
    return SafeArea(
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
              delegate: MiddleSliverAppBar(expandedHeight: 70),
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
                       height: 200,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.only(topLeft: Radius.elliptical(70,40),topRight: Radius.elliptical(70,40)),
//
//                       ),
                     ),

                     Container(

                       color: Colors.black,
                       child: Column(
                         children: <Widget>[
                           Container(
                             height: 200,
                             color: Colors.white,
                           ),
                           Container(
                             height: 200,
                             color: Colors.white,
                           ),
                           Container(
                             height: 200,
                             color: Colors.white,
                           ),
                           Container(
                             height: 200,
                             color: Colors.white,
                           ),
                           Container(
                             height: 200,
                             color: Colors.white,
                           ),
                           Container(
                             height: 200,
                             color: Colors.white,
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
    );
  }
}
