import 'package:flutter/material.dart';
import 'package:real_bodies/models/url.dart';
import 'package:real_bodies/realbodyui/fitnesslevel2.dart';
import 'package:real_bodies/theme/palette.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:real_bodies/realbodyui/dietplan.dart';
import 'package:real_bodies/ui/widgets/custom_alert_dialog.dart';


class FitnessGoal extends StatefulWidget {
  final int id;
  final  String name;
    final String email;
    final String password;
  FitnessGoal({this.id,this.name,this.email,this.password});
  @override
  _FitnessGoalState createState() => _FitnessGoalState();
}

class _FitnessGoalState extends State<FitnessGoal> {
  URL urldomain =URL();
String goal="";


 /*  void setGoal(String goal)async {

    try{
             print(widget.id);
      var url=urldomain.domain+"add_goal";
     final response =await http.get(url+"&id="+widget.id.toString()+"&goal="+goal);
      var jsonResponse = json.decode(response.body);
      var requestresponse=jsonResponse['response'];

      if (requestresponse=="success"){
        print('Added the Goal');
      }
      else if(requestresponse=="error")
      {

        print("error adding goal");
      }
      // print('Response body:${response.body}');
    }catch(e){
      print(e);
    }
  }
 */
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('this is program fitneess ${widget.email}');
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body:
      Container(
        height: height,
        width: width,
        color: Palette.backGround,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 9,
                child: Container(
                  width: width,
              color: Palette.backGround,
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
                          color: Color(0xffBFAAA5),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(right:20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(top:20.0,bottom: 8.0,left: 8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text('Weight Loss',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),),
                                     Container(
                                       height: 30,
                                       width: 80,
                                       child: FlatButton(
                                         shape: new RoundedRectangleBorder(
                                           borderRadius: new BorderRadius.circular(30.0),
                                         ),
                                         onPressed: () {
                                          // setGoal('Weight Loss');
                                           setState(() {
                                             goal="Weight Loss";
                                           });
                                         },
                                         color: goal == 'Weight Loss'?Colors.green:Palette.buttonjColor,
                                         textColor: Colors.white,
                                         child: Text("Select",
                                             style: TextStyle(fontSize: 14,
                                                 fontWeight: FontWeight.bold)),
                                       ),
                                     ),
                                  ],
                                ),
                              ),
                              Image.asset('assets/images/bodgoal1.png'),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.01,),
                      Container(
                        width: width * 0.90,
                        height: height * 0.17,
                        decoration: BoxDecoration(
                          color: Color(0xffCB850C),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(right:20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(top:20.0,bottom: 8.0,left: 8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text('Toning',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),),
                                    Container(
                                      height: 30,
                                      width: 80,
                                      child: FlatButton(
                                        shape: new RoundedRectangleBorder(
                                          borderRadius: new BorderRadius.circular(30.0),
                                        ),
                                        onPressed: () {
                                          //setGoal('Toning');
                                           setState(() {
                                             goal="Toning";
                                           });
                                          
                                        },
                                        color: goal == 'Toning'?Colors.green:Palette.buttonjColor,
                                        textColor: Colors.white,
                                        child: Text("Select",
                                            style: TextStyle(fontSize: 14,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Image.asset('assets/images/bodgoal22.png'),
                            ],
                          ),
                        ),

                      ),
                      SizedBox(height: height * 0.01,),
                      Container(
                        width: width * 0.90,
                        height: height * 0.17,
                        decoration: BoxDecoration(
                          color: Color(0xffD2BEB7),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top:20.0,bottom: 8.0,left: 8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text('Mass Gain',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),),
                                  Container(
                                    height: 30,
                                    width: 80,
                                    child: FlatButton(
                                      shape: new RoundedRectangleBorder(
                                        borderRadius: new BorderRadius.circular(30.0),
                                      ),
                                      onPressed: () {
                                       // setGoal('Mass Gain');
                                         setState(() {
                                             goal="Mass Gain";
                                           });
                                      },
                                      color: goal == 'Mass Gain'?Colors.green:Palette.buttonjColor,
                                      textColor: Colors.white,
                                      child: Text("Select",
                                          style: TextStyle(fontSize: 14,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ),
                                ],
                              ),
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
                          color: Color(0xff5847BA),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(right:20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(top:20.0,bottom: 8.0,left: 8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text('Endurance',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),),
                                    Container(
                                      height: 30,
                                      width: 80,
                                      child: FlatButton(
                                        shape: new RoundedRectangleBorder(
                                          borderRadius: new BorderRadius.circular(30.0),
                                        ),
                                        onPressed: () {
                                         // setGoal('Endurance');
                                          setState(() {
                                             goal="Endurance";
                                           });
                                        },
                                        color: goal == 'Endurance'?Colors.green:Palette.buttonjColor,
                                        textColor: Colors.white,
                                        child: Text("Select",
                                            style: TextStyle(fontSize: 14,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Image.asset('assets/images/bodgoal4.png'),
                            ],
                          ),
                        ),

                      ),
                    ],
                  ),
            ),
            ),
            Expanded(
              flex: 2,
                child: Container(
              color: Palette.backGround,
                  child: Center(
                    child:  Container(
                      height: 50,
                      width: width * 0.80,
                      child: FlatButton(
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                        onPressed: () {
                           if (goal=="")
                           { showDialog(context: context,
builder: (BuildContext context) {
  return CustomAlertDialog(title: "Alert!",content: "Must Select Goal",);
});
                             print("Select goal must");
                           }
                           else
                           {
                               print("gaol id "+widget.id.toString()+"goal "+goal);
  Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => DietPlan(id:widget.id,goal:goal,name:widget.name,email:widget.email,password:widget.password)));
                           }
                          
                          
                        },
                        color: Palette.buttonjColor,
                        textColor: Colors.white,
                        child: Text("Start".toUpperCase(),
                            style: TextStyle(fontSize: 14,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),

                ),),
          ],
        ),
      ),
    );
  }
}
