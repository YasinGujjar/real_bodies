import 'package:charts_flutter/flutter.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:real_bodies/realbodyui/fitnesslevel3.dart';
import 'package:real_bodies/theme/palette.dart';
import 'package:real_bodies/ui/widgets/custom_text_field.dart';

class FitnessLevel extends StatefulWidget {
  @override
  _FitnessLevelState createState() => _FitnessLevelState();
}

class _FitnessLevelState extends State<FitnessLevel> {
  bool wedVal=false;
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
                     child: Center(child: Text('Step 2 of 3',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                   ),

                 ],
                ),
                Container(
                  height: height * 0.05,
                  child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Container(
                        child: Text('Select your fitness level',style: TextStyle(fontSize: 16.0,color: Colors.white, fontWeight: FontWeight.bold)),
                      )
                    ],
                  ),
                ),
                Container(
                  //height: height * 0.10,
                  width: width,
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Beginer',style: TextStyle(fontSize: 16.0,color: Colors.white, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                Container(
                  //height: height * 0.20,
                  width: width,
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            width: width * 0.60,
                              child: Padding(
                                padding: const EdgeInsets.only(left:20.0),
                                child: Text('You are new to fitness training',style: TextStyle(color: Colors.white),),
                              )
                          ),Container(
                              width: width * 0.30,
                              child: Padding(
                                  padding: const EdgeInsets.only(left:20.0),
                                child: Checkbox(
                              activeColor: Colors.white,
                                value: wedVal,
                                onChanged: (bool value) {
                                  setState(() {
                                    wedVal = value;
                                  });
                                })
                              ),
                          )
                        ],
                      ),Divider(
                        height: 2,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    //height: height * 0.10,
                    width: width,
                    child: Container(
                      child: Text('Intermediate',style: TextStyle(fontSize: 16.0,color: Colors.white, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                Container(
                  //height: height * 0.20,
                  width: width,
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                              width: width * 0.60,
                              child: Padding(
                                padding: const EdgeInsets.only(left:20.0),
                                child: Text('You have been training regularly',style: TextStyle(color: Colors.white),),
                              )
                          ),Container(
                            width: width * 0.30,
                            child: Padding(
                                padding: const EdgeInsets.only(left:20.0),
                                child: Checkbox(
                                    activeColor: Colors.white,
                                    value: wedVal,
                                    onChanged: (bool value) {
                                      setState(() {
                                        wedVal = value;
                                      });
                                    })
                            ),
                          )
                        ],
                      ),Divider(
                        height: 2,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    //height: height * 0.10,
                    width: width,
                    child: Container(
                      child: Text('Advanced',style: TextStyle(fontSize: 16.0,color: Colors.white, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                Container(
                  //height: height * 0.20,
                  width: width,
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                              width: width * 0.60,
                              child: Padding(
                                padding: const EdgeInsets.only(left:20.0),
                                child: Text("You're fit and ready for an intensive workout plan",style: TextStyle(color: Colors.white),),
                              )
                          ),Container(
                            width: width * 0.30,
                            child: Padding(
                                padding: const EdgeInsets.only(left:20.0),
                                child: Checkbox(
                                    activeColor: Colors.white,
                                    value: wedVal,
                                    onChanged: (bool value) {
                                      setState(() {
                                        wedVal = value;
                                      });
                                    })
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: height * 0.28,),
                Container(
                  //margin: EdgeInsets.only(top: 5.0),
                  height: 50,
                  width: width * 0.80,
                  child: FlatButton(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                    onPressed: () {
                        Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => FitnessLevelThree()));
                    },
                    color: Colors.white,
                    textColor: Palette.backGround,
                    child: Text("DIETS".toUpperCase(),
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
