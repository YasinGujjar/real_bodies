import 'package:charts_flutter/flutter.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:real_bodies/pages/fitness_goal.dart';
import 'package:real_bodies/realbodyui/fitnesslevel.dart';
import 'package:real_bodies/realbodyui/fitnesslevel2.dart';
import 'package:real_bodies/realbodyui/fitnesslevel3.dart';
import 'package:real_bodies/theme/palette.dart';
import 'package:real_bodies/ui/widgets/custom_text_field.dart';

class StepThree extends StatefulWidget {
   final int id;
    final  String name;
    final String email;
  StepThree({this.id,this.name,this.email});
  @override
  _StepThreeState createState() => _StepThreeState();
}

class _StepThreeState extends State<StepThree> {

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
                              Image.asset('assets/images/step3.png',),
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
                       'Bad body shape, poor sleep, lack of strength, weight gain, weak bones, easily traumatizedbody,depressed, stressed, poor metabolism,poor resistance, all of these issues can be faced during your programs. We make our experts are at hand to guide you through'
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
                            print("step3 "+widget.id.toString());
                            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => FitnessGoal(id:widget.id)));
                        },
                        color: Colors.white,
                        textColor: Palette.backGround,
                        child: Text("Experts".toUpperCase(),
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
