import 'package:charts_flutter/flutter.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:real_bodies/realbodyui/step3.dart';
import 'package:real_bodies/theme/palette.dart';
import 'package:real_bodies/ui/widgets/custom_text_field.dart';

class StepTwo extends StatefulWidget {
   final int id;
   final  String name;
    final String email;
    final String password;
  StepTwo({this.id,this.name,this.email,this.password});
  @override
  _StepTwoState createState() => _StepTwoState();
}

class _StepTwoState extends State<StepTwo> {

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
                              Image.asset('assets/images/step2.png'),
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
                       'Everybody knows how to skip ropes or do jogs. But The right exercise guidance can avoid pitfalls that newbies always make, while designing exercises that are right for your body, your current weight, and your goals.'
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
                            print("step2 "+widget.id.toString());
                           Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => StepThree(id:widget.id,name:widget.name,email:widget.email,password:widget.password)));
                        },
                        color: Colors.white,
                        textColor: Palette.backGround,
                        child: Text("EXCERCISE".toUpperCase(),
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
