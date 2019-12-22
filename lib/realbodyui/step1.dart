import 'package:charts_flutter/flutter.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:real_bodies/realbodyui/step2.dart';
import 'package:real_bodies/theme/palette.dart';
import 'package:real_bodies/ui/widgets/custom_text_field.dart';

class StepOne extends StatefulWidget {
    final int id;
   final  String name;
    final String email;
  StepOne({this.id,this.name,this.email});
  @override
  _StepOneState createState() => _StepOneState();
}

class _StepOneState extends State<StepOne> {

  @override
  void initState() {
    super.initState();

  }
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;


    return Scaffold(

      backgroundColor: Color(0xffDE4922),
      body: Container(

        child: Padding(
          padding: EdgeInsets.all(0.0),
          child: Container(

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                        child: Container(
                        width: width,
                          height: height * 0.60,
                          //color: Colors.yellow,
                          child: Column(
                            children: <Widget>[
                              Image.asset('assets/images/step1.png'),
                            ],
                          ),
                        ),
                      ),Center(
                  child: Container(
                    width: width * 50.0,
                    height: height * 0.20,
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                       'While Diet & Nutrition being main focus of our programs, eating right, in right proportions and at right intervals is as important as the diet itself. Our Certified Diet Nutritionist will guide you through the process'
                      ,style: TextStyle(color: Colors.white),textAlign: TextAlign.center,),
                    ),
                  ),
                ),Center(
                  child: Container(
                    //margin: EdgeInsets.only(top: 5.0),
                      height: 50,
                      width: width * 0.80,
                      child: FlatButton(
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                        onPressed: () {
                          print("step1 "+widget.id.toString());
                           Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => StepTwo(id:widget.id,name:widget.name,email:widget.email)));
                        },
                        color: Colors.white,
                        textColor: Palette.backGround,
                        child: Text("DIETS".toUpperCase(),
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
