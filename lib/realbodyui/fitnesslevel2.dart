import 'package:charts_flutter/flutter.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:real_bodies/realbodyui/fitnesslevel.dart';
import 'package:real_bodies/theme/palette.dart';
import 'package:real_bodies/ui/widgets/custom_text_field.dart';

class FitnessLevelTwo extends StatefulWidget {
  int id;
  FitnessLevelTwo({this.id});
  @override
  _FitnessLevelTwoState createState() => _FitnessLevelTwoState();
}

class _FitnessLevelTwoState extends State<FitnessLevelTwo> {
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
                     width: width * 0.90,
                     child: Center(child: Text('Step 1 of 3',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                   ),

                 ],
                ),
                      Padding(
                        padding: const EdgeInsets.only(top: 60.0),
                        child: Center(
                    child: Container(
                    height: height*0.50,
                    //color: Colors.yellow,
                    child: Column(
                    children: <Widget>[
                    Image.asset('assets/images/stepOne.png',scale: 5.0,),
                    ],
                  ),
                ),
                ),
                      ),
                Center(
                  child: Container(
                 // margin: EdgeInsets.only(top: 5.0),
                  child: Text(
                      'Welcome to Realbodies'
                      ,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 32,color: Colors.white)),
                ),
              ),
                Center(
                  child: Container(
                    width: width * 0.65,
                    margin: EdgeInsets.only(top: 5.0),
                    child: Text(
                        'Personalized workouts will help you gain strength, get in better shape and embrace a healthy lifestyle'
                        ,style: TextStyle(color: Colors.white,),textAlign: TextAlign.center,),
                  ),
                ),
                Center(
                  child: Container(
                    //height: height * 0.08,
                    width: width * 0.65,
                    margin: EdgeInsets.only(top: 25.0,bottom: 10.0),
                    child: Text(
                      'Get Started'.toUpperCase()
                      ,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                  ),
                ),
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
                .push(MaterialPageRoute(builder: (context) => FitnessLevel()));
                    },
                    color: Palette.buttonjColor,
                    textColor: Colors.white,
                    child: Text("Next".toUpperCase(),
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
