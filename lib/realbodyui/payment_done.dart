import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:real_bodies/models/program.dart';
import 'package:real_bodies/theme/palette.dart';

import 'dashboard.dart';

class PaymentDone extends StatefulWidget {
  final ProgramPlan program;
  final String name;
  final String calorie;
  final int id;
  PaymentDone({this.program,this.name,this.calorie,this.id});
  @override
  _PaymentDoneState createState() => _PaymentDoneState();
}

class _PaymentDoneState extends State<PaymentDone> {
  bool tick = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        color: Palette.backGround,
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                SizedBox(height: height *0.02,),
                Container(
                    height: height * 0.04,
                    child: Center(child: FittedBox(fit:BoxFit.contain,child: Text('Done',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)))),
                SizedBox(height: height *0.01,),

                Container(
                  height: height * 0.25,
                  width: width * 0.95,
                  decoration: BoxDecoration(
                    color: Color(0xffF5AF19),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
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
                            Column(
                              children: <Widget>[
                                Text('Workout & Meal Plan',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 10),),
                                Text('${widget.program.title}',
                                     style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22),),
                              ],
                            ),
                            Text(
                                '${widget.program.description}',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              maxLines: 3,
                            ),
                            Container(),


                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: height * 0.05,),
                Center(
                  child: Container(
                    width: width * 0.90,
                    height: height * 0.15,
                    child: Center(
                      child: AutoSizeText('Charge Succssful',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 32),

                      ),
                    ),
                  ),


                ),
                Container(
                  width: width * 0.90,
                  height: height * 0.23,
                  child: AutoSizeText('Others dream while you have actually taken a practical step. Now our Experts will examine your Body Structure and probably will slso speak to you about your LifeStyle, and custom design a meal and workout plan that fits your Lifestyle. Please Expect a call from out team within nex 2 business days or Call us at our Number below',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                    maxLines: 7,
                  ),
                ),

                SizedBox(height: height *0.02,),
                Container(
                  height: height * 0.04,
                  width: width * 0.70,

                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex:1,
                        child: Checkbox(
                            activeColor: Colors.white,
                            value: tick,
                            onChanged: (bool value) {
                              setState(() {
                                tick = value;
                              });
                            }),
                      ),
                      Expanded(
                        flex:9,
                        child: AutoSizeText('Save this card for further purchases',style: TextStyle(color: Colors.white,),
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: height * 0.02,),
                Container(
                  height: height * 0.09,
                  width: width * 0.6,
                  // color: Colors.orange,
                  child:
                  FlatButton(
                    color: Palette.mainPurple,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          "Done",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.none,
                            fontSize: 26,
                            fontWeight: FontWeight.w800,
                            fontFamily: "OpenSans",
                          ),
                        ),
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    onPressed: () {

        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) => DashBoard(id:widget.id,name:widget.name,indexnumber: 0,calorie:widget.calorie)));
                    },
                  ),
                ),


              ],
            ),
          ],
        ),
      ),


    );




//    return Container(
//      child: FlatButton(onPressed: (){
//        Navigator.of(context)
//            .pushReplacement(MaterialPageRoute(builder: (context) => DashBoard(id:widget.id,name:widget.name,indexnumber: 0,calorie:widget.calorie)));
//      },),
//    );
  }
}
