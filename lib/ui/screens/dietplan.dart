import 'package:flutter/material.dart';
import 'package:real_bodies/theme/palette.dart';
import 'package:real_bodies/ui/widgets/custom_flat_button.dart';

class DietPlan extends StatefulWidget {
  @override
  _DietPlanState createState() => _DietPlanState();
}

class _DietPlanState extends State<DietPlan> {
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
                            Column(
                              children: <Widget>[
                                Text('Weight Loss',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),),
                                CustomFlatButton(

                                ),
                              ],
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
                      ),
                      SizedBox(height: height * 0.01,),
                      Container(
                        width: width * 0.90,
                        height: height * 0.17,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(8.0),
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
