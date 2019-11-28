import 'package:flutter/material.dart';
import 'package:real_bodies/theme/palette.dart';
import 'package:real_bodies/ui/widgets/custom_flat_button.dart';

class FitnessGoal extends StatefulWidget {
  @override
  _FitnessGoalState createState() => _FitnessGoalState();
}

class _FitnessGoalState extends State<FitnessGoal> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body:
      Container(
        height: height,
        width: width,
        color: Palette.boldTextO,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 9,
                child: Container(
                  width: width,
              color: Palette.boldTextO,
                  child: Column(

                    children: <Widget>[
                      SizedBox(height: height * 0.05,),
                      Text("So let's get started by choosing your Gooal",style: TextStyle(
                        color: Colors.white,
                      ),),
                      SizedBox(height: height * 0.01,),
                      Container(
                        width: width * 0.90,
                        height: height * 0.17,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top:15.0,bottom: 8.0,left: 8.0),
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
                                       color: Palette.mainPurple,
                                       textColor: Colors.white,
                                       child: Text("Select",
                                           style: TextStyle(fontSize: 14,
                                               fontWeight: FontWeight.bold)),
                                     ),
                                   ),
                                ],
                              ),
                            ),
                            Image.asset('assets/images/bodgoal3.png'),
                          ],
                        ),
                      ),
                      SizedBox(height: height * 0.01,),
                      Container(
                        width: width * 0.90,
                        height: height * 0.17,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top:15.0,bottom: 8.0,left: 8.0),
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
                                      color: Palette.mainPurple,
                                      textColor: Colors.white,
                                      child: Text("Select",
                                          style: TextStyle(fontSize: 14,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Image.asset('assets/images/bodgoal3.png'),
                          ],
                        ),

                      ),
                      SizedBox(height: height * 0.01,),
                      Container(
                        width: width * 0.90,
                        height: height * 0.17,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top:15.0,bottom: 8.0,left: 8.0),
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
                                      color: Palette.mainPurple,
                                      textColor: Colors.white,
                                      child: Text("Select",
                                          style: TextStyle(fontSize: 14,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Image.asset('assets/images/bodgoal3.png'),
                          ],
                        ),

                      ),
                      SizedBox(height: height * 0.01,),
                      Container(
                        width: width * 0.90,
                        height: height * 0.17,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top:15.0,bottom: 8.0,left: 8.0),
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
                                      color: Palette.mainPurple,
                                      textColor: Colors.white,
                                      child: Text("Select",
                                          style: TextStyle(fontSize: 14,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Image.asset('assets/images/bodgoal3.png'),
                          ],
                        ),

                      ),
                    ],
                  ),
            ),
            ),
            Expanded(
              flex: 2,
                child: Container(
              color: Palette.boldTextO,
            ),),
          ],
        ),
      ),
    );
  }
}
