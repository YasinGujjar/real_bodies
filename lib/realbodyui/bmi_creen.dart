import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:real_bodies/realbodyui/dashboard.dart';
import 'package:real_bodies/realbodyui/program.dart';
import 'package:real_bodies/theme/palette.dart';
import 'package:real_bodies/ui/screens/expansion_panel.dart';

class Bmi extends StatefulWidget {
 final  int id;
  final String bmi;
  final String calorie;
  final  String name;
    final String email;
    final String password;

   Bmi({this.id,this.bmi,this.name,this.email,this.calorie,this.password});
  @override
  _BmiState createState() => _BmiState();
}

class _BmiState extends State<Bmi> {
  //ExpansionPanelsDemo epd=ExpansionPanelsDemo();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Palette.boldTextO,
        child: ListView(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(left:18.0),
                  child: Text('Congratulations',style: TextStyle(color: Colors.white,fontSize: 35,fontWeight: FontWeight.bold),),
                ),
                SizedBox(height: 5,),
                Padding(
                  padding: const EdgeInsets.only(left:88.0),
                  child: Text('You Have Made It',style: TextStyle(color: Colors.white,fontSize: 15),),
                ),
                SizedBox(height: 12,),

                Padding(
                  padding: const EdgeInsets.only(left:22.0),
                  child: Text('Based on your input your BMI or \nBody Mass Index is',style: TextStyle(color: Colors.white,fontSize: 15),),
                ),
                SizedBox(height: 30,),

                 Center(child: Text('BMI',style: TextStyle(color: Colors.white,fontSize: 38,fontWeight: FontWeight.bold),)),
                 Center(child: Container(
                   height: 230,
                   width:  230,
                   child: Center(
                     child: CircularPercentIndicator(
                       radius: 190.0,
                       lineWidth: 10.0,
                       percent: 0.7,
                       center:  Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: <Widget>[
                           Center(child: Text(widget.bmi,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 40),)),
                           SizedBox(height: 20,),
                           Center(child: Text("OverWeight",style: TextStyle(fontSize: 20,color: Colors.white),)),



                         ],
                       ),
                       progressColor: Colors.white,
                       footer: new Text(
                         "Healthy Range , 18.5-24.9",
                         style:
                         new TextStyle(color:Colors.white,fontWeight: FontWeight.bold, fontSize: 17.0),
                       ),
                     ),
                   ),
                 ),),

                SizedBox(height: 30,),

                Center(child: Text('Calories Target',style: TextStyle(color: Colors.white,fontSize: 38,fontWeight: FontWeight.bold),)),
                Center(child: Container(
                  height: 230,
                  width:  230,
                  child: Center(
                    child: CircularPercentIndicator(
                      radius: 190.0,
                      lineWidth: 10.0,
                      percent: 1.0,
                      center:  Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Center(child: Text(widget.calorie,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 40),)),
                          Center(child: Text("KCals",style: TextStyle(fontSize: 20,color: Colors.white),)),
                        ],
                      ),
                      progressColor: Colors.white,
                      footer: new Text(
                        "Per Day",
                        style:
                        new TextStyle(color:Colors.white,fontWeight: FontWeight.bold, fontSize: 17.0),
                      ),
                    ),
                  ),
                ),),
                SizedBox(height: 5,),
                Center(
                  child: Container(
                    height: 55,
                    width: 150,
                    child: Text(
                      "If you can maintain your calories Goal You will reach the target in",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      maxLines: 3,
                    ),
                  ),
                ),
                Center(child: Text('For 18 Weeks',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 33),)),
                SizedBox(height: 5,),
                Center(
                  child:  Container(
                    height: 50,
                    width: 300,
                    child: FlatButton(
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                      onPressed: () {
                          Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Program(id:widget.id,name:widget.name,email:widget.email,calorie:widget.calorie,password:widget.password)));
                      },
                      color: Colors.white,
                      textColor: Palette.boldTextO,
                      child: Text("LET'S GET STARTED".toUpperCase(),
                          style: TextStyle(fontSize: 14,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
                SizedBox(height: 10,)
              ],
            )
          ],
        ),
      ),
    );
  }
}
