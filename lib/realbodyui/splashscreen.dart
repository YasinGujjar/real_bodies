import 'package:charts_flutter/flutter.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:real_bodies/realbodyui/splashscreen2.dart';
import 'package:real_bodies/theme/palette.dart';

class splashscreen extends StatefulWidget {
  @override
  _splashscreenState createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;


    return Scaffold(
      backgroundColor: Color(0xffDE4922),
      body: Container(

        child: Padding(
          padding: EdgeInsets.all(5.0),
          child: Container(

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: height*0.20,
                  //color: Colors.red,
                  child: Column(

                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
SizedBox(height: 30.0,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('BUILD YOURSELF',textScaleFactor: 2,style: TextStyle(color: Colors.white),),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5.0),
                            child:
                            Text('INTO A HEALTHIER',style: TextStyle(color: Colors.white),),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child:
                          Text('PRETTIER YOU',style: TextStyle(color: Colors.white),),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 15.0),
                          child:
                          Text('-CUSTOM TRAINING',style: TextStyle(color: Colors.white),),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 15.0),
                          child:
                          Text('-CUSTOM MEALS',style: TextStyle(color: Colors.white),),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 15.0),
                          child:
                          Text('-EXPERT GUIDANCE',style: TextStyle(color: Colors.white),),
                        ),

                      ],
                  ),


                ),Center(
                  child: Container(
                    height: height*0.50,
                    //color: Colors.yellow,
                    child: Column(
                      children: <Widget>[
                        Image.asset('assets/images/splash1.png',scale: 5.0,),
                      ],
                    ),
                  ),
                ),Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 5.0),
                    height: 50,
                    //width: width * 0.80,
                    //: Colors.white,
                    child: Text(
                      'REALBODIES'
                    ,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 32,color: Colors.white)),
                  ),
                ),Center(
                  child: Container(

                      height: 50,
                      width: width * 0.80,
                      child: FlatButton(
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                        onPressed: () {
                           Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => splashscreen2()));
                        },
                        color: Colors.white,
                        textColor: Palette.buttonjColor,
                        child: Text("Start".toUpperCase(),
                            style: TextStyle(fontSize: 14,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                ),Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 5.0),
                    height: 50,
                    width: width * 0.80,

                    child: FlatButton(

                      shape: new RoundedRectangleBorder(

                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                      onPressed: () {},
                      color: Colors.white,
                      textColor: Palette.buttonjColor,
                      child: Text("Login".toUpperCase(),
                          style: TextStyle(fontSize: 14,
                              fontWeight: FontWeight.bold)),
                    ),
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
