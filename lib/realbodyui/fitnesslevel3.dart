import 'package:charts_flutter/flutter.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:real_bodies/theme/palette.dart';
import 'package:real_bodies/ui/widgets/custom_text_field.dart';

class FitnessLevelThree extends StatefulWidget {
  @override
  _FitnessLevelThreeState createState() => _FitnessLevelThreeState();
}

class _FitnessLevelThreeState extends State<FitnessLevelThree> {
  bool wedVal = false;
  DateTime _dateTime;
  double height;
  String gender;
  @override
  void initState() {
    super.initState();


  }
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height ;
    double paddingLeft = MediaQuery.of(context).size.width - MediaQuery.of(context).padding.left;
    double heightWithoutAppBar = MediaQuery.of(context).size.height - kToolbarHeight - MediaQuery.of(context).padding.top;

    return Scaffold(

      backgroundColor: Color(0xffDE4922),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            //color: Colors.yellow,
            //height: height * 0.60,
            child: Column(
              children: <Widget>[
                Row(
                 children: <Widget>[
                 Container(
                   height: height * 0.10,
                   child: Icon(Icons.arrow_back,color: Colors.white,),
                 ), Container(
                     width: width * 0.80,
                     child: Center(child: Text('Step 3 of 3',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                   ),

                 ],
                ),
                Container(
                  height: height * 0.11,
                  child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        child: Text('Personal Details',style: TextStyle(fontSize: 26.0,color: Colors.white, fontWeight: FontWeight.bold)),

                      ),
                      SizedBox(height: height*0.01,),
                      Container(
                        child: Text('Let us know about you to speed up the result, ',style: TextStyle(fontSize: 16.0,color: Colors.white, fontWeight: FontWeight.bold)),

                      ),
                      Container(
                        child: Text('Get fit your personal workout plan!',style: TextStyle(fontSize: 16.0,color: Colors.white, fontWeight: FontWeight.bold)),

                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height*0.11,
                ),
               Divider(
                        height: 2,
                        thickness: 2.0,
                        color: Colors.white,
                      ),
                      SizedBox(height: height*0.02),
                Container(
                  //height: height * 0.20,
                  width: width,
                  child: Column(
                    children: <Widget>[
                      GestureDetector(
                        onTap:(){
                         showDatePicker(context: context, initialDate: _dateTime==null? DateTime.now(): _dateTime, firstDate: DateTime(1995), lastDate: DateTime(2022)).then((date){
                           setState(() {
                             _dateTime = date;
                           });
                         });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('Birthday',style: TextStyle(color: Colors.white,fontSize: 22.0,fontWeight: FontWeight.w800),),
                            FittedBox(
                              fit: BoxFit.contain,
                              child: Text(
                                _dateTime == null? 'Nothing': _dateTime.toString(),style: TextStyle(color: Colors.grey,fontSize: 22.0,fontWeight: FontWeight.w800),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: height*0.02),
                      Divider(
                        height: 2,
                        thickness: 2.0,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
               SizedBox(height: height*0.02),
                Container(
                  //height: height * 0.20,
                  width: width,
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Height',style: TextStyle(color: Colors.white,fontSize: 22.0,fontWeight: FontWeight.w800),),
                          Text('175cm',style: TextStyle(color: Colors.grey,fontSize: 22.0,fontWeight: FontWeight.w800),),

                        ],
                      ),
                      SizedBox(height: height*0.02),
                      Divider(
                        height: 2,
                        thickness: 2.0,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height*0.02),
                 Container(
                  //height: height * 0.20,
                  width: width,
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Weight',style: TextStyle(color: Colors.white,fontSize: 22.0,fontWeight: FontWeight.w800),),
                                                    Text('57Kg',style: TextStyle(color: Colors.grey,fontSize: 22.0,fontWeight: FontWeight.w800),),

                        ],
                      ),
                      SizedBox(height: height*0.02),
                      Divider(
                        height: 2,
                        thickness: 2.0,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height*0.02),
                Container(
                  //height: height * 0.20,
                  width: width,
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Gender",style: TextStyle(color: Colors.white,fontSize: 22.0,fontWeight: FontWeight.w800),),
                                                    Text('Male',style: TextStyle(color: Colors.grey,fontSize: 22.0,fontWeight: FontWeight.w800),),

                        ],
                      )
                    ],
                  ),
                ),
                
                SizedBox(height: height * 0.18,),
                Container(
                  //margin: EdgeInsets.only(top: 5.0),
                  height: 50,
                  width: width * 0.80,
                  child: FlatButton(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                    onPressed: () {},
                    color: Colors.white,
                    textColor: Palette.backGround,
                    child: Text("Almost there !".toUpperCase(),
                        style: TextStyle(fontSize: 14,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
        ),
                  
      ),
    );
  }
}
